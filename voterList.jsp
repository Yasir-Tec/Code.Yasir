<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="javax.xml.ws.Action"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title><Table> Responsive</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <h1></span> <span class="yellow">REGISTERED VOTER LIST</pan></h1>
   <table class="container">
	<thead>
		<tr>
			<th><h1><font color="yellow">ENROLLMENT NO</h1></th>
			<th><h1><font color="yellow">FIRST NAME</h1></th>
			<th><h1><font color="yellow">LAST NAME</h1></th>
			<th><h1><font color="yellow">EMAIL</h1></th>
				<th><h1><font color="yellow">GENDER</h1></th>
		</tr>
	</thead>
    
    <%!String newuserId,newno;
   		String fname,lname,email,gender;
    %>
  
    <%
 
    	
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection co=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	System.out.println("Connected..!!! welcome page");
	Statement sts=co.createStatement();
	ResultSet rss=sts.executeQuery("select * from user1"); 
	Statement s=co.createStatement();
	
	while(rss.next()){
	
	
 newuserId=rss.getString(1);

 fname=rss.getString(3);
 lname=rss.getString(4);
 email=rss.getString(5);
 gender=rss.getString(7);%>
 
 
 <tr>

    <td><%=newuserId %></td>
    <td><%=fname%></td>
    <td><%=lname%></td>
    <td><%=email%></td>
    <td><%=gender%></td>
    

   		
	
 
    
    
</tr>  <%


	
		
	}%>
	<tr><td><a href=searchVoter.html Method=post><b> <i><font color="#F08080"> SEARCH<br></a></td>
	<td><a href=updateVoter.html Method=post><b> <i><font color="#F08080"> UPDATE</td>
	<td><a href=finish.jsp Method=post><b> <i><font color="#F08080"><- BACK</td>
	<td><a href=deleteVoter.html Method=post><b> <i><font color="#F08080"> DELETE</td></tr>
 <%	
 
 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
 Statement st=con.createStatement();
 String query="select count(*)from user1";
 ResultSet rs=st.executeQuery(query);
 String countrow="";
 while(rs.next())
 {
 	countrow=rs.getString(1);
 	System.out.println(countrow);
 	
 }

%>
<tr><td><b> <i><font color="#F08080"> TOTAL VOTERS = <%=countrow %></td>
<%


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
Statement st1=con1.createStatement();
String query1="select count(voting)from user1 where voting=1";
ResultSet rs1=st.executeQuery(query1);
String countrow1="";
while(rs1.next())
{
	countrow1=rs1.getString(1);
	System.out.println("voted list count"+countrow1);
	
}
Statement st2=con1.createStatement();
String query2="select count(voting)from user1 where voting=0";
ResultSet rs2=st.executeQuery(query2);
String countrow2="";
while(rs2.next())
{
	countrow2=rs2.getString(1);
	System.out.println("Remaining list count"+countrow2);
	
}

Statement st3=con1.createStatement();
String query3="select count(gender)from user1 where gender='male'";
ResultSet rs3=st.executeQuery(query3);
String countrow4="";
while(rs3.next())
{
	countrow4=rs3.getString(1);
	System.out.println("Total male's in the list are "+countrow4);
}
Statement st4=con1.createStatement();
String query4="select count(gender)from user1 where gender='female'";
ResultSet rs4=st.executeQuery(query4);
String countrow5="";
while(rs4.next())
{
	countrow5=rs4.getString(1);
	System.out.println("Total female's in the list are "+countrow5);
}

%>
<td><b> <i><font color="#F08080"> VOTED = <%=countrow1 %></td>
<td><b> <i><font color="#F08080"> UNVOTED = <%=countrow2 %></td>
<td><b> <i><font color="#F08080"> CLEAR LIST </td>
	<tr><td><a href=votedList.jsp Method=post><b> <i><font color="#F08080"> VOTED VOTER`S LIST</td>
	<td><a href=remainingList.jsp Method=post><b> <i><font color="#F08080"> UNVOTED VOTER`S LIST</td>
	<td><b> <i><font color="#F08080"> TOTAL MALE'S = <%=countrow4 %></td>
	<td><b> <i><font color="#F08080"> TOTAL FEMALE'S = <%=countrow5 %></td>
	</tr>
</body>
</html>