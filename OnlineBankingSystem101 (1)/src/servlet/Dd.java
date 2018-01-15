package servlet;

import java.awt.image.RescaleOp;
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

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import model.GetData;

/**
 * Servlet implementation class Dd
 */
@WebServlet("/Dd")
public class Dd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generate,d method stub
		try{
			int bal1=0;
			HttpSession ses=request.getSession(false);
			String acc=(String) ses.getAttribute("acc");
			PrintWriter pw=response.getWriter();
			Connection cn=GetData.GetConnection();
			int dd=(int)(Math.random()*1000000);
			String sql1="select balance from balance where account_number=?";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1, acc);
			ResultSet rs=ps1.executeQuery();
			while(rs.next()){
				int bal=Integer.parseInt(rs.getString(1));
				bal1=Integer.parseInt(request.getParameter("aname"));
				if(bal1>bal){
					RequestDispatcher rd=request.getRequestDispatcher("DD.jsp");
					rd.include(request, response);
					pw.println("Your account balance is low...");
				}else{
					String SQL="insert into demanddraft values(?,?,?,?,?,0,0)";
					PreparedStatement  ps=cn.prepareStatement(SQL);
					ps.setInt(1, dd);
					ps.setString(2, request.getParameter("bcname"));
					ps.setString(3, request.getParameter("pname"));
					ps.setString(4, request.getParameter("aname"));
					ps.setString(5, acc);
					ps.execute();
					RequestDispatcher rd=request.getRequestDispatcher("DD.jsp");
					rd.include(request, response);
					
					pw.println("your dd number is" + dd);
				}
			}
			
			
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
