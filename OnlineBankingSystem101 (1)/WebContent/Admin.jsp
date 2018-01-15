<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.GetData"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Global Bank</title>
<style type="text/css">
#c{
background-color: #d3e4ff;
}
.nav{
background-color: #c0cee5;
color: black;
text align:center;
padding: 20px 0 20px 0;
}
.nav >li{
display: inline-block;
padding:0 25px 0 25px; 
}
.nav > li > a{
text-decoration: none;
color: #ffffff;
}
.nav > li >a:hover{
color: silver;
}





</style>
</head>
<body id="c">
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="left" ><b><Font color="navy" ><font size="5"><img alt="" src="eb8.png" height="80px" width="160px"><i>...With us,You're sure</i></Font></b></th>
<th align="right" ><font color="navy" size="4px">Call Us At : 1800 3500 7896 <br><a href="Adminlogin.html"><input type="button" value="Admin Login" style="margin-right: 35px;float: right;"></a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Admin.jsp">Home</a></li>
<li><a href="A_logout">Log Out</a>
</ul>
<table align="center">
<form action="Dd1" method="post">
<tr><th colspan="5" style="color: white;">New Demand Draft Request</th></tr>
<tr><th style="padding-left: 25px;">DD NO</th><th style="padding-left: 25px;">Baneficiary</th>
<th style="padding-left: 25px;">Payable At</th><th style="padding-left: 25px;">Amount</th><th style="padding-left: 25px;">Account_number</th><tr>
<%
	try{
		Connection cn=GetData.GetConnection();
		String sql="select * from demanddraft";
		PreparedStatement ps=cn.prepareStatement(sql);
		ResultSet res=ps.executeQuery();
		while(res.next()){
			if(res.getString(7).equals("0")){
%>
<tr><td style="padding-left: 25px;"><%= res.getString(1) %></td><td style="padding-left: 25px;"><%= res.getString(2) %></td>
<td style="padding-left: 25px;"><%= res.getString(3) %></td><td style="padding-left: 25px;"><%= res.getString(4) %></td>
<td style="padding-left: 25px;"><%= res.getString(5) %></td><td style="padding-left: 25px;"><input type="radio" name="r1" value="<%= res.getString(5)+"-"+res.getString(1)%>"></td>
<td align="right"><input type="submit" value="OK"></td></tr>
<%}
		}
	}catch(Exception e){
		System.out.println(e);
}%>

</form>
</table>
<img src="eb16.jpg" height="100%" width="100%">
</body>

</html>