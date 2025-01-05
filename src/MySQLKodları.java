import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLKodları {

    private static final String URL = "jdbc:mysql://localhost:3306/projedenemesi";
    private static final String USER = "root";
    private static final String PASSWORD = "220542";

    // Veritabanı bağlantısını döndürme
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Main metodu ekleyerek sınıfı çalıştırabilirsiniz
    public static void main(String[] args) {
        // Bağlantı testi
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("Veritabanına başarıyla bağlanıldı!");
        } else {
            System.out.println("Veritabanına bağlanılamadı.");
        }
    }
}
