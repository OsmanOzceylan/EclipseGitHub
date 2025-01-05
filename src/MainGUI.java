import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;


public class MainGUI extends Application {

    @Override
    public void start(Stage primaryStage) {
        // Hoş geldiniz mesajı
        javafx.scene.control.Label welcomeLabel = new javafx.scene.control.Label("Hoşgeldiniz!");

        // Kayıt ol butonu
        Button registerButton = new Button("Kayıt Ol");
        registerButton.setOnAction(e -> {
            // Kayıt ekranına yönlendirme
            KullaniciKayitGUI kullaniciKayitGUI = new KullaniciKayitGUI();
            Stage newStage = new Stage();  // Yeni bir pencere (stage) oluştur
            kullaniciKayitGUI.start(newStage); // KullaniciKayitGUI penceresini başlat
            primaryStage.close(); // Eski pencereyi kapat
        });

        // Giriş yap butonu
        Button loginButton = new Button("Giriş Yap");
        loginButton.setOnAction(e -> {
            // Giriş ekranına yönlendirme
            GirisIslemleriGUI girisIslemleriGUI = new GirisIslemleriGUI();
            Stage newStage = new Stage();  // Yeni bir pencere (stage) oluştur
            girisIslemleriGUI.start(newStage); // GirisIslemleriGUI penceresini başlat
            primaryStage.hide(); // Mevcut pencereyi sakla (close yerine hide kullanabilirsiniz)
        });


        // Butonları birleştirip dikey yerleşim için VBox kullanıyoruz
        javafx.scene.layout.VBox vbox = new javafx.scene.layout.VBox(20, welcomeLabel, registerButton, loginButton);
        vbox.setAlignment(Pos.CENTER);

        // Scene'i oluştur
        Scene scene = new Scene(vbox, 400, 300);

        // Başlangıç penceresini ayarla
        primaryStage.setTitle("Ana Ekran");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args); // JavaFX uygulamasını başlat
    }
}
