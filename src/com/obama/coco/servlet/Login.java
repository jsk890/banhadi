package com.obama.coco.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obama.coco.dao.ExpertsDAO;
import com.obama.coco.dao.UsersDAO;
import com.obama.coco.vo.Expert;
import com.obama.coco.vo.User;


@WebServlet("/login.coco")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User(email, password);
		User loginUser = UsersDAO.login(user);
		HttpSession session = req.getSession();
		if (loginUser == null) {
			System.out.println("존재하지 않는 아이디");
			session.setAttribute("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
			resp.sendRedirect("/login.jsp");
		} else {
			if(loginUser.getType()=='e') {
				Expert expert = ExpertsDAO.getExpert(loginUser.getNo());
				session.setAttribute("expertUser", expert);
			}
			session.setAttribute("loginUser", loginUser);
		
			resp.sendRedirect("/main.jsp");
		}//if else
	}
}
