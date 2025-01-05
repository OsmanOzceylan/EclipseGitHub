import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;
import java.awt.*;
import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.util.Scanner;
import org.json.JSONArray;
import org.json.JSONObject;

public class HavaDurumuGUI {
    private static final String API_KEY = "8f5cdcc101fa42821145419128aa1cc0";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/projedenemesi";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "220542";

    public static void main(String[] args) {
        // Giriş yapan kullanıcının e-posta adresi
        

        JFrame frame = new JFrame("Hava Durumu Otomasyonu");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(1200, 600);
        frame.setLayout(new BorderLayout());

        // Üst başlık paneli
        JPanel titlePanel = new JPanel(new BorderLayout());
        titlePanel.setBackground(new Color(153, 0, 0));

        JLabel titleLabel = new JLabel("Hava Durumu Tahmini", SwingConstants.CENTER);
        titleLabel.setForeground(Color.WHITE);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 20));

        // Kullanıcı e-posta paneli
        JPanel userPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        userPanel.setBackground(new Color(153, 0, 0));
        JLabel userEmailLabel = new JLabel("<html><u>" + GirisIslemleriGUI.getKullaniciEmail() + "</u></html>"); // E-posta adresi altı çizili
        userEmailLabel.setForeground(Color.WHITE);
        userEmailLabel.setCursor(new Cursor(Cursor.HAND_CURSOR));

        JButton logoutButton = new JButton("Çıkış Yap");
        logoutButton.setVisible(false); // Başlangıçta gizli

        // E-posta üzerine tıklandığında çıkış butonunu göster
        userEmailLabel.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                logoutButton.setVisible(true);
            }
        });

        // Çıkış butonuna tıklanırsa uygulamayı kapat
        logoutButton.addActionListener(e -> {
            JOptionPane.showMessageDialog(frame, "Çıkış Yapılıyor...");
            System.exit(0);
        });

        userPanel.add(userEmailLabel);
        userPanel.add(logoutButton);

        titlePanel.add(titleLabel, BorderLayout.CENTER);
        titlePanel.add(userPanel, BorderLayout.EAST);

        // Şehir ve ilçe seçim paneli
        JPanel selectionPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 15, 10));
        JLabel cityLabel = new JLabel("Şehir Seç:");
        JComboBox<String> cityComboBox = new JComboBox<>(new String[]{});
        JLabel districtLabel = new JLabel("İlçe Seç:");
        JComboBox<String> districtComboBox = new JComboBox<>(new String[]{""});
        JButton fetchWeatherButton = new JButton("Hava Durumunu Getir");

        selectionPanel.add(cityLabel);
        selectionPanel.add(cityComboBox);
        selectionPanel.add(districtLabel);
        selectionPanel.add(districtComboBox);
        selectionPanel.add(fetchWeatherButton);

        // Şehirleri veritabanından yükle
        loadCities(cityComboBox);
        cityComboBox.addActionListener(e -> {
            String city = (String) cityComboBox.getSelectedItem();
            if (city != null) {
                updateDistricts(districtComboBox, city);
            }
        });

        // Hava durumu tablosu
        String[] columnNames = {"Tarih", "Durum", "En Düşük (°C)", "En Yüksek (°C)", "Nem (%)", "Rüzgar Yönü", "Rüzgar Hızı (km/sa)"};
        DefaultTableModel tableModel = new DefaultTableModel(columnNames, 0);
        JTable weatherTable = new JTable(tableModel);
        weatherTable.setRowHeight(50);

        JTableHeader tableHeader = weatherTable.getTableHeader();
        tableHeader.setFont(new Font("Arial", Font.BOLD, 14));
        tableHeader.setForeground(new Color(102, 102, 102));

        weatherTable.getColumnModel().getColumn(1).setCellRenderer(new WeatherIconRenderer());
        JScrollPane tableScrollPane = new JScrollPane(weatherTable);

        fetchWeatherButton.addActionListener(e -> {
            String city = (String) cityComboBox.getSelectedItem();
            String district = (String) districtComboBox.getSelectedItem();
            if (city != null && district != null) {
                fetchWeatherData(city, district, tableModel);
            }
        });

        // Çerçeveye panelleri ekle
        frame.add(titlePanel, BorderLayout.NORTH);
        frame.add(selectionPanel, BorderLayout.CENTER);
        frame.add(tableScrollPane, BorderLayout.SOUTH);

        frame.setVisible(true);
    }

    private static void loadCities(JComboBox<String> cityComboBox) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT ad FROM il";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            DefaultComboBoxModel<String> cityModel = new DefaultComboBoxModel<>();
            while (rs.next()) {
                cityModel.addElement(rs.getString("ad"));
            }
            cityComboBox.setModel(cityModel);
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Şehirler yüklenirken hata oluştu!", "Hata", JOptionPane.ERROR_MESSAGE);
        }
    }

    private static void updateDistricts(JComboBox<String> districtComboBox, String city) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT ad FROM ilce WHERE il_id = (SELECT id FROM il WHERE ad = ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, city);
            ResultSet rs = stmt.executeQuery();

            DefaultComboBoxModel<String> districtModel = new DefaultComboBoxModel<>();
            while (rs.next()) {
                districtModel.addElement(rs.getString("ad"));
            }
            districtComboBox.setModel(districtModel);
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "İlçe verileri yüklenirken hata oluştu!", "Hata", JOptionPane.ERROR_MESSAGE);
        }
    }

    private static void fetchWeatherData(String city, String district, DefaultTableModel tableModel) {
        try {
            String apiUrl = "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&units=metric&lang=tr&appid=" + API_KEY;
            HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
            connection.setRequestMethod("GET");

            Scanner scanner = new Scanner(connection.getInputStream());
            StringBuilder response = new StringBuilder();
            while (scanner.hasNext()) {
                response.append(scanner.nextLine());
            }
            scanner.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray list = jsonResponse.getJSONArray("list");

            tableModel.setRowCount(0);
            for (int i = 0; i < list.length(); i++) {
                JSONObject weatherData = list.getJSONObject(i);
                String date = weatherData.getString("dt_txt").split(" ")[0];

                JSONObject main = weatherData.getJSONObject("main");
                double minTemp = main.getDouble("temp_min");
                double maxTemp = main.getDouble("temp_max");
                double humidity = main.getDouble("humidity");

                JSONObject wind = weatherData.getJSONObject("wind");
                String windDirection = getWindDirection(wind.getDouble("deg"));
                double windSpeed = wind.getDouble("speed");

                String iconCode = weatherData.getJSONArray("weather").getJSONObject(0).getString("icon");
                ImageIcon weatherIcon = getWeatherIcon(iconCode);

                tableModel.addRow(new Object[]{date, weatherIcon, minTemp + "°C", maxTemp + "°C", humidity + "%", windDirection, windSpeed + " km/sa"});
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "Hava durumu verisi alınamadı!", "Hata", JOptionPane.ERROR_MESSAGE);
        }
    }

    private static ImageIcon getWeatherIcon(String iconCode) {
        String basePath = "C:\\Users\\osman\\Desktop\\görseller\\";
        String iconPath;

        switch (iconCode) {
            case "01d":
                iconPath = basePath + "A.png";
                break;
            case "01n":
                iconPath = basePath + "A.png";
                break;
            case "02d":
                iconPath = basePath + "AB.png";
                break;
            case "02n":
                iconPath = basePath + "AB.png";
                break;
            case "03d":
            case "03n":
                iconPath = basePath + "CB.png";
                break;
            case "04d":
            case "04n":
                iconPath = basePath + "CB.png";
                break;
            case "09d":
                iconPath = basePath + "SY.png";
                break;
            case "09n":
                iconPath = basePath + "SY.png";
                break;
            case "10d":
                iconPath = basePath + "Y.png";
                break;
            case "10n":
                iconPath = basePath + "Y.png";
                break;
            case "11d":
                iconPath = basePath + "KGY.png";
                break;
            case "11n":
                iconPath = basePath + "KGY.png";
                break;
            case "13d":
                iconPath = basePath + "K.png";
                break;
            case "13n":
                iconPath = basePath + "K.png";
                break;
            default:
                iconPath = basePath + "SGK.png";
                break;
        }

        File iconFile = new File(iconPath);
        if (!iconFile.exists()) {
            iconPath = basePath + "SGK.png";
        }

        return new ImageIcon(iconPath);
    }

    private static String getWindDirection(double degree) {
        if (degree >= 337.5 || degree < 22.5) return "Kuzey";
        if (degree >= 22.5 && degree < 67.5) return "Kuzeydoğu";
        if (degree >= 67.5 && degree < 112.5) return "Doğu";
        if (degree >= 112.5 && degree < 157.5) return "Güneydoğu";
        if (degree >= 157.5 && degree < 202.5) return "Güney";
        if (degree >= 202.5 && degree < 247.5) return "Güneybatı";
        if (degree >= 247.5 && degree < 292.5) return "Batı";
        return "Kuzeybatı";
    }

    static class WeatherIconRenderer extends JLabel implements TableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            if (value instanceof ImageIcon) {
                setIcon((ImageIcon) value);
            } else {
                setText(value != null ? value.toString() : "");
                setIcon(null);
            }
            return this;
        }
    }
}
