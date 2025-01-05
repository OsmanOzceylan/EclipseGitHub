import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class YenilenenSifre {

    public static void resetPassword(String email, String newPassword) {
        // Veritabanı güncelleme SQL sorgusu
        String updateSql = "UPDATE musteriler SET MusteriSifre = ? WHERE MusteriMail = ?";

        // Kaynakları otomatik kapatma için try-with-resources kullanıyoruz
        try (Connection conn = MySQLKodları.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(updateSql)) {

            // Şifre ve e-posta adresini sorguya ekliyoruz
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            // Güncelleme sorgusunu çalıştırıyoruz
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Şifreniz başarıyla güncellendi!");
            } else {
                System.out.println("Şifre güncellenemedi. Kullanıcı bulunamadı.");
            }
        } catch (SQLException e) {
            System.err.println("Şifre güncelleme sırasında bir hata oluştu: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
