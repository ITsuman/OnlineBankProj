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
 * Servlet implementation class Transfer
 */
@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int bal1 = 0,bal2=0,bal=0,bal3=0;
			String accno=request.getParameter("accno");
			Connection con=GetData.GetConnection();
			PrintWriter pw=response.getWriter();
			//String s="--";
			String p="Transanction->"+request.getParameter("accno");
			String p1="From "+request.getParameter("accno");
			HttpSession se=request.getSession(false);
			String acc=(String)se.getAttribute("acc");
			String sql="select balance from balance where account_number=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, acc);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				bal=Integer.parseInt(rs.getString(1));
				bal3=Integer.parseInt(request.getParameter("amm"));
				if(bal3>bal){
					RequestDispatcher rdd=request.getRequestDispatcher("Transfer.jsp");
					rdd.include(request, response);
					pw.print("Your balance is not sufficient...");
				}else{
					bal1=Integer.parseInt(rs.getString(1))-Integer.parseInt(request.getParameter("amm"));
					String sql1="update balance set balance=? where account_number=?";
					PreparedStatement ps1=con.prepareStatement(sql1);
					ps1.setInt(1, bal1);
					ps1.setString(2, acc);
					ps1.executeUpdate();
					String sql2="insert into account values(?,?,?,?,?,?)";
					PreparedStatement ps2=con.prepareStatement(sql2);
					ps2.setString(1, acc);
					ps2.setString(5, request.getParameter("date"));
					ps2.setInt(2, bal1);
					ps2.setInt(3,0);
					ps2.setInt(4,Integer.parseInt(request.getParameter("amm")));
					ps2.setString(6, p);
					ps2.execute();
					String sql3="select balance from balance where account_number=?";
					PreparedStatement ps3=con.prepareStatement(sql3);
					//System.out.println(accno);
					ps3.setString(1,accno);
					ResultSet rs3=ps3.executeQuery();
					while(rs3.next()){
					bal2=Integer.parseInt(rs3.getString(1))+Integer.parseInt(request.getParameter("amm"));
					}
					//System.out.println(bal2);
					String sql4="update balance set balance=? where account_number=?";
					PreparedStatement ps4=con.prepareStatement(sql4);
					ps4.setInt(1, bal2);
					ps4.setString(2, request.getParameter("accno"));
					ps4.executeUpdate();
					String sql5="insert into account values(?,?,?,?,?,?)";
					PreparedStatement ps5=con.prepareStatement(sql2);
					ps5.setString(1, request.getParameter("accno"));
					ps5.setString(5, request.getParameter("date"));
					ps5.setInt(2, bal2);
					ps5.setInt(4, 0);
					ps5.setInt(3, Integer.parseInt(request.getParameter("amm")));
					ps5.setString(6, p1);
					ps5.execute();
					RequestDispatcher rd=request.getRequestDispatcher("Transfer.jsp");
					rd.include(request, response);
					pw.println("Succesfull transanction...");
				}
			
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
