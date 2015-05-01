package yapiPackage;


import java.util.LinkedList;
import java.util.Properties;
import java.util.Queue;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MailListener implements ServletContextListener {
	
	private static Queue<DavetMail> mailListesi;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("basladi");
		mailListesi = new LinkedList<DavetMail>();
		// veritabanında gönderilmemiş var mı bak.
		MailGonder.start();
	}
	private static Thread MailGonder = new Thread(){
		public void run() {
			int counter = 0;
			while(counter<100 && !mailListesi.isEmpty()){
				
				DavetMail mail = mailListesi.poll();
			
				final String username = "abdullahtellioglu93@gmail.com";
				final String password = "tell10glu";
		 
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				Session session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				  });
				try {
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress("abdullahtellioglu93@gmail.com"));
					message.setSubject("Yeni Anket Daveti");
					message.setText(mail.davetEdenKullaniciAdi +" isimli kullanici sizi ankete davet etti.");
					for(int i =0;i<mail.mailler.length;i++){
						message.setRecipients(Message.RecipientType.TO,
								InternetAddress.parse(mail.mailler[i]));
							Transport.send(message);
					}
					counter=0;
					System.out.println("Mesaj Gönderildi");
				} catch(Exception ex){
					counter++;
					ex.printStackTrace();
				}
				
			}
			
			
		};
	};
	
	
	public static void MailEkle(DavetMail mail){
		mailListesi.add(mail);
		try{
			MailGonder.run();
		}catch(Exception ex){
			ex.printStackTrace();
			try {
				MailGonder.start();
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
		
	}

}
