package com.abc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class checklogine extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public checklogine() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		if(username != null || pwd != null) { 
			/*RequestDispatcher dispatcher=null;*/
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_e","root","W7301@jqir#");
				String sql="SELECT * FROM login WHERE Username=? AND Password=?";
				PreparedStatement stmt=con.prepareStatement(sql);
				stmt.setString(1,  username);
				stmt.setString(2,  pwd);
				
				ResultSet rs=stmt.executeQuery();
				if(rs.next()) {
					HttpSession session=request.getSession();
					session.setAttribute("user",username);
					response.sendRedirect("dashboard.jsp");
				}else {
					request.setAttribute("msg", "failed");
					RequestDispatcher dispatcher =request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
				}
						stmt.close();
				con.close();
				
			}catch(Exception ex) {
				request.setAttribute("msg", "failed");
				RequestDispatcher dispatcher =request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
				ex.printStackTrace();
			}
}
	}
}
			


