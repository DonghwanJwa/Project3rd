package mailHandler;

import javax.servlet.http.HttpServletRequest;

public interface MailService {

	public boolean send(String subject, String text, String from, String to, String filePath, HttpServletRequest request);
	//메일 보내기 메서드 : 메일에 포함되어질 제목,내용,보낸이,받는이,첨부파일 값
}
