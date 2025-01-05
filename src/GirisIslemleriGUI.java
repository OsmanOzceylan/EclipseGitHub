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

import java.util.Random;

public class GirisIslemleriGUI extends Application {
    private String resetCode;

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Giriş Yap");

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

        // Giriş butonu
        Button loginButton = new Button("Giriş Yap");
        grid.add(loginButton, 1, 2);

        // Şifremi unuttum butonu
        Button forgotPasswordButton = new Button("Şifremi Unuttum");
        grid.add(forgotPasswordButton, 1, 3);

        // Giriş butonuna tıklama işlemi
        loginButton.setOnAction(e -> {
            String email = emailField.getText();
            String password = passwordField.getText();

            // Kullanıcı doğrulama işlemi
            boolean isValid = GirisIslemleri.isValidUser(email, password);

            if (isValid) {
                showAlert(AlertType.INFORMATION, "Başarılı", "Hoşgeldiniz!");
                primaryStage.close(); // Giriş ekranını kapat
                javax.swing.SwingUtilities.invokeLater(() -> HavaDurumuGUI.main(null)); // HavaDurumGUI'yi başlat
            } else {
                showAlert(AlertType.ERROR, "Hata", "Geçersiz e-posta veya şifre!");
            }
        });

        // Şifremi Unuttum butonuna tıklama işlemi
        forgotPasswordButton.setOnAction(e -> {
            String email = emailField.getText(); // E-posta adresini al
            if (email.isEmpty()) {
                showAlert(AlertType.ERROR, "Hata", "Lütfen e-posta adresinizi girin.");
            } else {
                sendResetCodeEmail(email);  // E-posta ile şifre sıfırlama kodu gönder
            }
        });

        // Scene ve Stage ayarları
        Scene scene = new Scene(grid, 400, 250);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    // Şifre sıfırlama kodu gönderen metod
    private void sendResetCodeEmail(String email) {
        // Rastgele bir şifre sıfırlama kodu oluştur
        resetCode = generateResetCode();

        // E-posta gönderimi
        Mailİslemleri.sendPasswordResetEmail(email, resetCode); // Mail gönder

        // Kod doğrulama GUI'sine yönlendirme
        openResetPasswordGUI();
    }

    // Şifre sıfırlama kodu oluşturma
    private String generateResetCode() {
        Random random = new Random();
        return String.format("%04d", random.nextInt(10000)); // 4 haneli bir kod oluştur
    }

    // Şifre sıfırlama kodunu girecek GUI
    private void openResetPasswordGUI() {
        Stage resetStage = new Stage();
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        // Şifre sıfırlama kodu alanı
        TextField resetCodeField = new TextField();
        resetCodeField.setPromptText("Şifre sıfırlama kodu");
        grid.add(resetCodeField, 0, 0);

        // Şifreyi güncelleme butonu
        Button confirmButton = new Button("Onayla");
        grid.add(confirmButton, 1, 1);
        confirmButton.setOnAction(e -> {
            String userInputCode = resetCodeField.getText();
            if (userInputCode.equals(resetCode)) {
                // Kod doğru, yeni şifre alanını gösterelim
                showNewPasswordField();
                resetStage.close(); // Kapat
            } else {
                showAlert(AlertType.ERROR, "Hata", "Geçersiz şifre sıfırlama kodu!");
            }
        });

        // Scene ve Stage ayarları
        Scene scene = new Scene(grid, 300, 200);
        resetStage.setScene(scene);
        resetStage.setTitle("Şifre Sıfırlama");
        resetStage.show();
    }

    // Yeni şifreyi girmeye yönelik ekran
    private void showNewPasswordField() {
        Stage newPasswordStage = new Stage();
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        // Yeni şifre alanı
        TextField newPasswordField = new TextField();
        newPasswordField.setPromptText("Yeni şifre");
        grid.add(newPasswordField, 0, 0);

        // Şifreyi güncelleme butonu
        Button updateButton = new Button("Yeni Şifreyi Kaydet");
        grid.add(updateButton, 1, 1);
        updateButton.setOnAction(e -> {
            String newPassword = newPasswordField.getText();
            // Yeni şifreyi veritabanında güncelle
            updatePassword(newPassword);
            newPasswordStage.close();
        });

        // Scene ve Stage ayarları
        Scene scene = new Scene(grid, 300, 200);
        newPasswordStage.setScene(scene);
        newPasswordStage.setTitle("Yeni Şifre");
        newPasswordStage.show();
    }

    // Yeni şifreyi veritabanına kaydetme
    private void updatePassword(String newPassword) {
        // Veritabanına yeni şifreyi kaydetme işlemi burada yapılacak
        System.out.println("Yeni şifre kaydedildi: " + newPassword);
    }

    // Alert ile mesaj gösterme
    static void showAlert(AlertType type, String title, String message) {
        Alert alert = new Alert(type);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public static void main(String[] args) {
        launch(args);
    }

	public static String getKullaniciEmail() {
		// TODO Auto-generated method stub
		return null;
	}

  
}
