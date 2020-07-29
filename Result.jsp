<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vote count</title>
</head>
<body>
<% 
PrintWriter pw=response.getWriter();
		int arrvote[]=new int[1000],i=0,m=0, a[]=new int[1000];
		
		
		
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
			 System.out.println("connected.....");
			 Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from candidate");
				
				while(rs.next())
				{
					
					arrvote[i]=rs.getInt(5);
					a[m]=arrvote[i];
					out.println(sizeof(a[i]));
				}	
					
					int largest=arrvote[0];
					for(int j=0;j<arrvote[2];j++)
					{
					if(arrvote[j]>largest)
					{
						largest=arrvote[j];
						
					}
					
					}
				
					out.println("WINNER IS="+largest);
				
				/* int sumModi=0,sumRaga=0,sumAk=0;
				
				for(int x=0;x<1000;x++)
				{
					sumModi=sumModi+arrModi[x];
				}
				
				System.out.println("Modi===>"+sumModi);
				
				for(int x=0;x<1000;x++)
				{
					sumRaga=sumRaga+arrRaga[x];
				}
				
				System.out.println("Raga===>"+sumRaga);
				
				for(int x=0;x<1000;x++)
				{
					sumAk=sumAk+arrAk[x];
				}
				
				System.out.println("AK==>"+sumAk);
				
				
				pw.println("<table border=1><tr><th>Sr.No</th><th>Moi Votes</th><th>Raga Votes<th>AK Votes</th></tr>");
				pw.println("<tr><td>1</td><td>"+sumModi+"</td><td>"+sumRaga+"</td><td>"+sumAk+"</td></tr>");
				pw.println("</table>");
				
				
				
				
				
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	*/
%>

</body>
</html>