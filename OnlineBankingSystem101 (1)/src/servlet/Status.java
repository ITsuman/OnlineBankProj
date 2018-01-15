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
 * Servlet implementation class Status
 */
@WebServlet("/Status")
public class Status extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			PrintWriter pw=response.getWriter();
		HttpSession ses=request.getSession(false);
		String acc=(String) ses.getAttribute("acc");
		Connection cn=GetData.GetConnection();
		String sql="select status from demanddraft where dd_no=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1,request.getParameter("dd") );
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
		if(rs.getString(1).equals("1")){
			RequestDispatcher rd=request.getRequestDispatcher("Status.jsp");
			rd.include(request, response);
			pw.println("Dd request approved for dd number  "+ request.getParameter("dd"));
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("Status.jsp");
			rd.include(request, response);
			pw.println("Dd request yet to be approved for dd number  "+ request.getParameter("dd"));
		}
		}
	}catch(Exception e){
		System.out.println(e);
	}
		}
	
}
