package model;
import java.util.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import util.AirlineSql;
public class Email {
	
	public boolean  getMail(String Toemail,String subject,String comment) {
		
		AirlineSql airline=new AirlineSql();
		
	
		//Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
		"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(Toemail,"Abcd0000");//Put your email id and password here
		}
		});
		//compose message
		//using Exception handling
		try {
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(Toemail));//change accordingly
		message.addRecipient(Message.RecipientType.TO,new InternetAddress(airline.fromEmail));
		message.setSubject(subject);
		message.setText(comment);
		//send message
		Transport.send(message);
		System.out.println("message sent successfully");
		return true;
		} catch (MessagingException e) {
			
			
			}
		return false;
		
	}

}
