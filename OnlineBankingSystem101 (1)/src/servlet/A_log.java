package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GetData;

/**
 * Servlet implementation class C_log
 */
@WebServlet("/A_log")
public class A_log extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			PrintWriter pw=response.getWriter();
			Connection cn=GetData.GetConnection();
			String sql="select admin_name from admin where admin_id=? and password=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, request.getParameter("uid"));
			ps.setString(2, request.getParameter("pid"));
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				HttpSession se=request.getSession();
				se.setAttribute("acc", rs.getString(1));
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.include(request, response);
				
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("Adminlogin.html");
				rd.include(request, response);
				pw.println("incorrect login");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
