import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class Mailİslemleri {

    // Şifre sıfırlama e-postasını gönderme
    public static void sendPasswordResetEmail(String recipientEmail, String resetCode) {
        // E-posta ayarlarını yapılandırma
        String host = "smtp.gmail.com"; // SMTP sunucusu (örneğin, Gmail için smtp.gmail.com)
        final String fromEmail = "projedenemesibp@gmail.com"; // Gönderen e-posta adresi
        final String password = "wrev pjpp tsyq fswx"; // Gönderen e-posta hesabının şifresi

        // E-posta gönderimi için Properties objesi oluşturma
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // Genelde 587 portu kullanılır
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Session oluşturma
        Session session = Session.getInstance(properties, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // E-posta içeriği oluşturma
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject("Şifre Sıfırlama Kodu");
            message.setText("Şifre sıfırlama kodunuz: " + resetCode);

            // E-posta gönderme
            Transport.send(message);
            System.out.println("Şifre sıfırlama e-postası başarıyla gönderildi.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
