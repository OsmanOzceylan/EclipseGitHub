import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class SifremiUnuttumGUI extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Şifremi Unuttum");

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

        // Şifre sıfırlama butonu
        Button resetPasswordButton = new Button("Şifreyi Sıfırla");
        grid.add(resetPasswordButton, 1, 1);

        // Şifre sıfırlama butonuna tıklama işlemi
        resetPasswordButton.setOnAction(e -> {
            String email = emailField.getText();

            // Şifremi unuttum işlemi
            GirisIslemleri.forgotPassword(email); // Burada GirisIslemleri'deki forgotPassword metodunu kullanıyoruz
            showAlert(AlertType.INFORMATION, "Şifre Sıfırlama", "E-posta adresinize şifre sıfırlama bağlantısı gönderildi.");
        });

        // Scene ve Stage ayarları
        Scene scene = new Scene(grid, 400, 150);
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