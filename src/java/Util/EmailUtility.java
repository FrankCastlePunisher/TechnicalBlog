package Util;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtility {

    public static void sendEmail(String host, String port, final String userName, final String password,
                                  String[] toAddress, String subject, String message)
            throws AddressException, MessagingException {

        // SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host); // smtp.gmail.com
        properties.put("mail.smtp.port", port); // 587
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
        properties.put("mail.smtp.ssl.trust", host); // Fix for SSL trust issue

        // Authenticator to login
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password); // your email and app password
            }
        };

        // Create session
        Session session = Session.getInstance(properties, auth);

        // Compose message
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(userName));

        InternetAddress[] toAddresses = new InternetAddress[toAddress.length];
        for (int i = 0; i < toAddress.length; i++) {
            toAddresses[i] = new InternetAddress(toAddress[i].trim());
        }

        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message); // Plain text message

        // Send the message
        Transport.send(msg);
    }
}
