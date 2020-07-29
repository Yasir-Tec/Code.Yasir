<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
  <title><Table> Responsive</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voting Result</title>
</head>
<body>
<h1></span> <span class="yellow"> VOTING RESULT</pan></h1>
<table class="container">
<body>

	<% 
	
	Statement sts,sts1,sts2,sts3;
	ResultSet rss,rss1,rss2,rss3;
	PreparedStatement pst;
	PrintWriter out1 = response.getWriter();
	  Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	System.out.println("Connected..!!! welcome page");
	 sts=con.createStatement();
	 
				sts=con.createStatement();
				 rss=sts.executeQuery("select srno,fname,lname,party,vote from candidate order by vote desc");
				
						%>
				
				<tr><th>CANDIDATE ID </th><th>CANDIDATE NAME</th><th>PARTY</th><th>VOTES</th></tr>
			
			
				<% 
		while(rss.next())
		{
		int a=rss.getInt(1);
		String b=rss.getString(2);
		String c=rss.getString(3);
		String d=rss.getString(4);
		String e=rss.getString(5);
		
	
	
		
		
		%>		
	
	 	
		<tr><td><%=a%> </td><td><%=b %> <%=c %></td><td><%=d%></td><td><%=e%></td></tr>
		
	
	<% }%>
	<%
	
	sts1=con.createStatement();
	 rss1=sts1.executeQuery("select fname,lname from candidate where vote=(select max(vote) from candidate)");
	 while(rss1.next())
	 {
		 String ab=rss1.getString(1);
		 String ab1=rss1.getString(2);
		 System.out.println(ab);
		 System.out.println(ab1);
	
	
	%>
	
	
	
	<% } %>
	<a href="finish.jsp" ><b> <i><font color="#F08080"><= Back</a>
	<% String f1="",f2="",v1="",v2="",v3="",v4=""; %>
	<% sts2=con.createStatement();
	 rss2=sts2.executeQuery("select fname,lname,vote from(select fname,lname,vote,rownum as rn from(select fname,lname,vote from candidate order by vote desc))where rn=1");
	 while(rss2.next())
	 {
		  f1=rss2.getString(1);
		 v1=rss2.getString(2);
		 v3=rss2.getString(3);
		 
	 }
	 sts3=con.createStatement();
	 rss3=sts3.executeQuery("select fname,lname,vote from(select fname,lname,vote,rownum as rn from(select fname,lname,vote from candidate order by vote desc))where rn=2");
	 while(rss3.next())
	 {
		  f2=rss3.getString(1);
		  v2=rss3.getString(2);
		  v4=rss3.getString(3);
		
	 }System.out.println("1st->"+f1);
	 System.out.println(v1);
	 System.out.println("1st->"+f2);
	 System.out.println(v2);
	 
	 
	 if(v3.equals(v4))
	 {%>
			<h2></span> <span class="cyan"> Result is tied winners are - Mr.<%=f1 %> <%=v1 %> and Mr. <%=f2 %> <%=v2 %></span></h2>
	<%}
	 else
	 {%>
		 <h2></span> <span class="cyan"> Winner is - Mr.<%=f1 %> <%=v1 %> </span></h2>
	 <%}
	%>
<body>

</body>
</html>