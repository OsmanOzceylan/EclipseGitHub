import java.sql.*;
import java.util.Random;
import java.util.Scanner;

public class GirisIslemleri {

    // Kullanıcı doğrulama (Giriş) işlemi
    public static boolean isValidUser(String email, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Veritabanına bağlanma
            conn = MySQLKodları.getConnection();

            // SQL sorgusu
            String sql = "SELECT * FROM musteriler WHERE MusteriMail = ? AND MusteriSifre = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            // Eğer veri varsa, kullanıcı doğru giriş yapmıştır.
            if (rs.next()) {
                // Kullanıcı adı (isim soyisim) veritabanından alınır ve geri döndürülür
                String fullName = rs.getString("MusteriIsimSoyisim");
                System.out.println("Merhaba, " + fullName + "!");
                return true; // Kullanıcı geçerlidir
            } else {
                return false; // Kullanıcı geçerli değil
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Kaynakları kapatma
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Şifremi Unuttum İşlemi
    public static void forgotPassword(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = MySQLKodları.getConnection();

            // Kullanıcıyı e-posta adresine göre bul
            String checkSql = "SELECT * FROM musteriler WHERE MusteriMail = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Kullanıcı bulundu, bir şifre sıfırlama bağlantısı gönder
                String resetLink = generateResetLink(email); // Şifre sıfırlama bağlantısı

                // Şifre sıfırlama linkini e-posta ile gönder
                Mailİslemleri.sendPasswordResetEmail(email, resetLink);
                System.out.println("Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.");
            } else {
                System.out.println("Bu e-posta adresi ile kayıtlı bir kullanıcı bulunamadı.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Rastgele bir şifre sıfırlama bağlantısı oluşturma
    private static String generateResetLink(String email) {
        Random random = new Random();
        String token = Integer.toHexString(random.nextInt()); // Şifre sıfırlama için token (basit örnek)
        return "http://yourwebsite.com/reset-password?token=" + token + "&email=" + email;
    }

    // Şifreyi sıfırlama (yeni şifre girilerek)
    public static void resetPassword(String email, String newPassword) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = MySQLKodları.getConnection();

            // Kullanıcının şifresini güncelle
            String updateSql = "UPDATE musteriler SET MusteriSifre = ? WHERE MusteriMail = ?";
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Şifreniz başarıyla güncellendi!");
            } else {
                System.out.println("Şifre güncellenemedi. Kullanıcı bulunamadı.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

        // Kullanıcıdan işlem seçimi
        System.out.println("1. Giriş\n2. Şifremi Unuttum");
        int choice = scanner.nextInt();
        scanner.nextLine(); // Buffer temizleme

        if (choice == 1) {
            // Giriş işlemleri
            System.out.print("E-posta: ");
            String email = scanner.nextLine();

            int attempt = 0;  // Giriş hakkı sayısı
            boolean isValid = false;

            while (attempt < 3 && !isValid) {  // 3 kereye kadar denemek için döngü
                System.out.print("Şifre: ");
                String password = scanner.nextLine();

                if (isValidUser(email, password)) {
                    System.out.println("Hoşgeldiniz!");
                    isValid = true;
                } else {
                    attempt++;
                    if (attempt < 3) {
                        System.out.println("Geçersiz  şifre. Kalan deneme sayısı: " + (3 - attempt));
                    } else {
                        System.out.println("3 yanlış denemeden sonra giriş engellendi.");
                    }
                }
            }
        } else if (choice == 2) {
            // Şifremi unuttum
            System.out.print("E-posta adresinizi girin: ");
            String email = scanner.nextLine();

            forgotPassword(email);
        }

        scanner.close();
    }

	public static String getKullaniciEmail() {
		// TODO Auto-generated method stub
		return null;
	}
}
