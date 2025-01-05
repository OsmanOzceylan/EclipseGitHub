

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class KullaniciKayitGUI extends Application {

    // Kullanıcı kaydını yapan metod
    public static boolean registerUser(String email, String password, String fullName) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = MySQLKodları.getConnection();

            String checkSql = "SELECT * FROM musteriler WHERE MusteriMail = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, email);

            if (pstmt.executeQuery().next()) {
                return false; // E-posta zaten var
            }

            Random random = new Random();
            int musteriId = random.nextInt(100000);

            String insertSql = "INSERT INTO musteriler (MusteriId, MusteriMail, MusteriSifre, MusteriIsimSoyisim) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setInt(1, musteriId);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, fullName);

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Kullanıcı Kaydı");

        // Kullanıcıdan alınacak bilgilerin yer alacağı GridPane
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        // E-posta alanı
        Label emailLabel = new Label("E-posta:");
        TextField emailField = new TextField();
        grid.add(emailLabel, 0, 0);
        grid.add(emailField, 1, 0);

        // Şifre alanı
        Label passwordLabel = new Label("Şifre:");
        PasswordField passwordField = new PasswordField();
        grid.add(passwordLabel, 0, 1);
        grid.add(passwordField, 1, 1);

        // İsim alanı
        Label fullNameLabel = new Label("İsim ve Soyisim:");
        TextField fullNameField = new TextField();
        grid.add(fullNameLabel, 0, 2);
        grid.add(fullNameField, 1, 2);

        // Kayıt butonu
        Button registerButton = new Button("Kayıt Ol");
        grid.add(registerButton, 1, 3);

        // Kayıt butonuna tıklama işlemi
        registerButton.setOnAction(e -> {
            String email = emailField.getText();
            String password = passwordField.getText();
            String fullName = fullNameField.getText();

            // Kayıt işlemini yap
            boolean registrationSuccessful = registerUser(email, password, fullName);

            // Sonuç mesajı
            if (registrationSuccessful) {
                showAlert(AlertType.INFORMATION, "Başarılı", "Kayıt başarılı!");
            } else {
                showAlert(AlertType.ERROR, "Hata", "E-posta adresi zaten mevcut!");
            }
        });

        // Scene ve Stage ayarları
        Scene scene = new Scene(grid, 400, 250);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    // Alert ile mesaj gösterme
    private void showAlert(AlertType type, String title, String message) {
        Alert alert = new Alert(type);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
