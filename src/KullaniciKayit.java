import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.Scanner;

public class KullaniciKayit {

    // Kullanıcı kaydı eklemek için
    public static boolean registerUser(String email, String password, String fullName) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Veritabanına bağlan
            conn = MySQLKodları.getConnection();

            // E-posta zaten var mı kontrolü
            String checkSql = "SELECT * FROM musteriler WHERE MusteriMail = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, email);

            if (pstmt.executeQuery().next()) {
                System.out.println("Bu e-posta adresi zaten mevcut. Lütfen farklı bir e-posta adresi girin.");
                return false; // E-posta mevcutsa, kayıt işlemi başarısız
            }

            // E-posta mevcut değilse, yeni kullanıcıyı ekle

            // Rastgele bir ID oluşturma
            Random random = new Random();
            int musteriId = random.nextInt(100000); // 0 ile 99999 arasında rastgele bir ID oluşturur

            String insertSql = "INSERT INTO musteriler (MusteriId, MusteriMail, MusteriSifre, MusteriIsimSoyisim) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setInt(1, musteriId);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, fullName);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Kayıt başarılı! Hoşgeldiniz!");
                return true;
            } else {
                return false; // Kayıt başarısız
            }
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

    // Ana metod
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int maxAttempts = 3; // Maksimum deneme sayısı
        boolean registrationSuccessful = false;

        // Kullanıcıdan bilgiler alma
        for (int attempt = 1; attempt <= maxAttempts; attempt++) {
            System.out.println("Deneme " + attempt + " / " + maxAttempts);

            // Kullanıcıdan bilgiler alma
            System.out.print("E-posta: ");
            String email = scanner.nextLine();

            System.out.print("Şifre: ");
            String password = scanner.nextLine();

            System.out.print("İsim ve Soyisim: ");
            String fullName = scanner.nextLine();

            // Kayıt işlemini yapma
            registrationSuccessful = registerUser(email, password, fullName); // Kayıt işlemi

            if (registrationSuccessful) {
                System.out.println("Kayıt başarılı.");
                break; // Kayıt başarılı olursa döngüyü sonlandır
            } else {
                System.out.println("Kayıt sırasında bir hata oluştu.");
                if (attempt == maxAttempts) {
                    System.out.println("Maksimum deneme sayısına ulaşıldı. Kayıt işlemi başarısız.");
                }
            }
        }

        if (registrationSuccessful) {
            System.out.println("Kayıt işlemi başarılı bir şekilde tamamlandı.");
        } else {
            System.out.println("Kayıt işlemi başarısız oldu.");
        }

        scanner.close();
    }
}
