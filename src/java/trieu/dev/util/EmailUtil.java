//package trieu.dev.util;
//
//import com.mysql.cj.Session;
//import com.mysql.cj.protocol.Message;
//import java.util.Properties;
//import jakarta.mail.*;
//import java.net.Authenticator;
//import java.net.PasswordAuthentication;
//import javax.mail.internet.*;
//
//public class EmailUtil {
//
//    public static void sendEmail(String recipient, String subject, String content) {
//        final String username = "your-email@gmail.com";  // Email c?a b?n
//        final String password = "your-email-password";   // M?t kh?u email
//
//        Properties prop = new Properties();
//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.starttls.enable", "true"); // TLS
//
//        Session session = Session.getInstance(prop, new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(username, password);
//            }
//        });
//
//        try {
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(username));
//            message.setRecipients(
//                    Message.RecipientType.TO, InternetAddress.parse(recipient));
//            message.setSubject(subject);
//            message.setText(content);
//
//            Transport.send(message);
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }
//}
