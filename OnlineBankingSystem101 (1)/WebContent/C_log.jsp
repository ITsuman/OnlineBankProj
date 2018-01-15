<!DOCTYPE html>
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
<th align="right" ><font color="navy" size="4px">Call Us At : 1800 3500 7896 <br><a href="Adminlogin.html">ADMIN</a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Home.jsp">Home</a></li>
<li><a href="NewCustomer.html">Create Account</a></li>
<li><a href="C_log.jsp">Login</a>
<li><a href="#">Contact</a>
</ul>

<form action="C_log" method="post" >
<table align="center" style="background-color: rgba(0,0,0,0.1);height: 200px;width: 300px;">
	<tr><th colspan="2" style="color: white;">Enter Details</th></tr>
	<tr><td style="color: white;">Login Id-</td><td><input type="text" name="uid" style="border-radius:5px;margin-left: 10px"></td></tr>
	<tr><td style="color: white;">Password-</td><td><input type="password" name="pid" style="border-radius:5px;margin-left: 10px"></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="Submit"></td></tr>
</table>
</form>

</body>

</html>