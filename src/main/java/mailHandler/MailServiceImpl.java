package mailHandler;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailServiceImpl implements MailService {

	private Log log = LogFactory.getLog(MailServiceImpl.class);
	//로깅을 위한 log객체

	
	@Autowired
	private JavaMailSender javaMailSender;
	//org.springframework.mail.javamail.JavaMailSender
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	
	@Override
	public boolean send(String subject, String text, String from, String to, String[] filePath, HttpServletRequest request) {
		MimeMessage message = javaMailSender.createMimeMessage();
		// javax.mail.internet.MimeMessage
		String imgFolder = request.getRealPath("/resources/img");
		
		try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				// org.springframework.mail.javamail.MimeMessageHelper
				
				//메일에 헤드이미지
				String contents = "<br><br><img src=\"cid:logo2.png\">" + text;
				FileSystemResource imgFile = 
						new FileSystemResource(new File(imgFolder+"/logo2.png"));
				
				helper.setSubject(subject);
				helper.setText(contents, true);			//내용물
				helper.setFrom(from);
				helper.setTo(to);
				helper.addInline("logo2.png", imgFile);
			
				// 첨부 파일 처리
				for(int i=0; i<filePath.length; i++) {
					if (filePath[i] != null) {
						File file = new File(filePath[i]);
						if (file.exists()) {
							helper.addAttachment(file.getName(), new File(filePath[i]));
						}
					}
				}

				javaMailSender.send(message);
				return true;
			
			} catch (MessagingException e) {
				e.printStackTrace();
			}		
		return false;
	}
}
