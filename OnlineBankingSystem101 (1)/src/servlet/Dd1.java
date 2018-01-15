package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GetData;

/**
 * Servlet implementation class Dd1
 */
@WebServlet("/Dd1")
public class Dd1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		String w=request.getParameter("r1");
		String parts[]=w.split("-");
		String par1=parts[0];
		String par2=parts[1];
		//System.out.println(par1+"  "+par2);
		int bal = 0,dd_bal = 0,new_bal;
		Date d=new Date();
		String dd=d.toString();
		Connection cn=GetData.GetConnection();
		PrintWriter pw=response.getWriter();
		//String acc=request.getParameter("r1");
		String sql="select balance from balance where account_number=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, par1);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
		bal=rs.getInt(1);
		}
		String sql1="select amount from demanddraft where account_number=? and dd_no=?";
		PreparedStatement ps1=cn.prepareStatement(sql1);
		ps1.setString(1, par1);
		ps1.setString(2, par2);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next()){
		dd_bal=rs1.getInt(1);
		}
		//System.out.println(bal);
		if(bal<dd_bal){
			RequestDispatcher rdd=request.getRequestDispatcher("Admin.jsp");
			rdd.include(request, response);
			pw.println("Low Balance...can't be approved");
		}else{
			new_bal=bal-dd_bal;
			//System.out.println(new_bal);
			String sql2="update balance set balance=? where account_number=?";
			PreparedStatement ps2=cn.prepareStatement(sql2);
			ps2.setInt(1, new_bal);
			ps2.setString(2, par1);
			ps2.executeUpdate();
			String sql4="insert into account values(?,?,?,?,?,?)";
			PreparedStatement ps4=cn.prepareStatement(sql4);
			ps4.setString(1, par1);
			ps4.setInt(2, new_bal);
			ps4.setInt(3, 0);
			ps4.setInt(4, dd_bal);
			ps4.setString(5,dd);
			ps4.setString(6, "Demand Draft "+par2);
			ps4.execute();

			String sql3="update demanddraft set status=1 where account_number=? and dd_no=?";
			PreparedStatement ps3=cn.prepareStatement(sql3);
			ps3.setString(1, par1);
			ps3.setString(2,par2);
			ps3.executeUpdate();
			response.sendRedirect("./Admin.jsp");
			

		}
				}catch(Exception e){
			System.out.println(e);
		}
	}

}
