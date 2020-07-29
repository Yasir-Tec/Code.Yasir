<HTML>
<META HTTP-EQUIV="refresh" CONTENT="5,url=electionresults.html">
<HEAD>
<TITLE>Election Results</TITLE>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</HEAD>
<BODY  bgcolor=moccasin>
<%@page import="java.sql.*"%>
<%
try{
			ServletContext context=getServletContext();
			String drivername=context.getInitParameter("driver");
			String url=context.getInitParameter("url");
			String dname=context.getInitParameter("dname");
			String dpassword=context.getInitParameter("dpassword");
			 
		
	Connection con;
	Statement st;
	ResultSet rs;
	Class.forName(drivername);
	con=DriverManager.getConnection(url,dname,dpassword);
	st=con.createStatement();
%>
<center>
<h1><FONT color=mediumseagreen>Election Results
</FONT> </h1></center><hr color=lightslategray><br>
<TABLE cellSpacing=1 cellPadding=1 width="85%" border=1 align=center>
  <tr><td colspan=4><b>ZONAL RESULTS</b></td></tr>
  <TR>
    <TD><b>Name</b></TD>
    <TD><b>Party</b></TD>
    <TD><b> Zone</b></TD>
    <TD><b>No of Votes</b></TD></TR>
	<%
	  rs=st.executeQuery("SELECT NAME, PARTY, CNAME, COUNT(*) FROM ONLINEVOTING GROUP BY CNAME, PARTY, NAME");
	while(rs.next()){%>
  <TR> <TD><%=rs.getString(1)%></TD> <TD><%=rs.getString(2)%></TD>  <TD><%=rs.getString(3)%></TD>   <TD><%=rs.getString(4)%></TD></TR>
  <%}rs.close();%>
</TABLE>
<br><br>

<TABLE cellSpacing=1 cellPadding=1 width="85%" border=1  align=center>
  <tr><td colspan=3><b><b>TOTAL RESULTS</b></b></td></tr>
  <TR>
    <TD><b>Party&nbsp;Name</b></TD>
    <TD><b>Zone</b></TD>
    <TD><b>No Of Votes</b></TD></TR>
		<%
	  rs=st.executeQuery("SELECT PARTY, CNAME, COUNT(*) FROM ONLINEVOTING GROUP BY CNAME, PARTY");
	while(rs.next()){%>
  <TR> <TD><%=rs.getString(1)%></TD> <
  .TD><%=rs.getString(2)%></TD>  <TD><%=rs.getString(3)%></TD></TR>
  <%}rs.close();
	con.close();
	}
	catch(Exception e){}
	%>
</TABLE><center><br>
<a href="homepage.html">Home</a></center>
</BODY>
</HTML>
