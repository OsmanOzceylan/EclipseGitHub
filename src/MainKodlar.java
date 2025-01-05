import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONObject;
import java.net.URI;


public class MainKodlar {
	public static void main(String[] args) {
        // Kullanıcıdan şehir ismi alma
        Scanner scanner = new Scanner(System.in);
        System.out.print("Şehir ismini girin: ");
        String city = scanner.nextLine();  // Kullanıcının girdiği şehir ismi alınır
        String apiKey = "8f5cdcc101fa42821145419128aa1cc0"; // API anahtarınız
        String urlString = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&units=metric&lang=tr";

        try {
            // URI ile URL oluşturma
            URI uri = new URI(urlString);
            URL url = uri.toURL();

            // HttpURLConnection ile API'ye bağlanma
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // API'den gelen veriyi okuma
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // JSON verisini işleme
            JSONObject json = new JSONObject(response.toString());
            String sehirAdi = json.getString("name");
            JSONObject main = json.getJSONObject("main");
            double sicaklik = main.getDouble("temp");
            int nem = main.getInt("humidity");
            JSONObject weather = json.getJSONArray("weather").getJSONObject(0);
            String havaDurumu = weather.getString("description");

            // Sonuçları yazdırma
            System.out.println("Şehir: " + sehirAdi);
            System.out.println("Sıcaklık: " + sicaklik + "°C");
            System.out.println("Nem: " + nem + "%");
            System.out.println("Hava Durumu: " + havaDurumu);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            scanner.close();  // Scanner kaynaklarını kapatma
        }
    }
}
