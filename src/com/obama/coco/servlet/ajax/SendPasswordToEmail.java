package com.obama.coco.servlet.ajax;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obama.coco.dao.UsersDAO;
import com.obama.coco.vo.User;

@WebServlet("/ajax/sendPassword.json")
public class SendPasswordToEmail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adminEmail = "5bamaADM@gmail.com"; // 메일을 보낼 아이디
		String adminPassword = "dhqkak123"; // 패스워드

		// SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465); // google passport
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(adminEmail, adminPassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(adminEmail));

			// 파라미터 emailId, domain, name 받아오기
			String emailId = req.getParameter("emailId");
			String domain = req.getParameter("domain");

			String email = emailId + "@" + domain;
			System.out.println(email);

			String name = req.getParameter("name");
			System.out.println(name);

			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// Subject
			message.setSubject("반하디 임시비밀번호 발송"); // 메일 제목을 입력

			// 8자리 숫자,소문자 랜덤하게
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < 8; i++) {
				// rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴.
				// true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
				if (rnd.nextBoolean()) {
					buf.append((char) ((int) (rnd.nextInt(26)) + 97));
				} else {
					buf.append((rnd.nextInt(10)));
				} // if~else end
			} // for end

			// 바뀐 password를 얻어와서 passwordText에 저장
			String passwordText = buf.toString();
			System.out.println(passwordText);

			//http프로토콜의 header에 설정
			resp.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			
					
//			User userCheck = new User(email,name); 
//			int count = UsersDAO.selectCheckEmailAndName(userCheck);
			

			// 새로운 객체를 생성해서 userUpdate에 넣어줌
			User userUpdate = new User(email,passwordText);

			// 새로운 객체로 update 해준다.
			int result = UsersDAO.updatePassword(userUpdate);
			System.out.println("업데이트 : " + (result == 1));

			// Text
			message.setText("새로운 비밀번호 : " + passwordText); // 메일 내용을 입력

			// send the message
			Transport.send(message); //// 전송
			System.out.println("message sent successfully...");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // try~catch end

	}// doPost() end

}// SendPasswordToEmail end