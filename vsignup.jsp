<%-- 
    Document   : vsignup
    Created on : Mar 2, 2017, 8:30:09 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%!
String url = "jdbc:mysql://localhost:3306/voting_system";
String uname = "root";
String pwd = "";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>voter signup</title>
    </head>
    <body>
        <%
                try{
                    Connection con = DriverManager.getConnection(url,uname,pwd);
                    PreparedStatement mys = con.prepareStatement("insert into signed_up(first_name, last_name, rollno, designation, email, mobile, userid, password) values (?,?,?,?,?,?,?,?)");
                    mys.setString(1, request.getParameter("fname"));
                    mys.setString(2, request.getParameter("lname"));
                    mys.setInt(3, Integer.parseInt(request.getParameter("roll")));
                    mys.setString(4, request.getParameter("des"));
                    mys.setString(5, request.getParameter("email"));
                    mys.setLong(6, Long.parseLong(request.getParameter("mobile")));
                    mys.setString(7, request.getParameter("uname"));
                    
                    mys.setString(8, request.getParameter("pwd"));
                    
                     mys.executeUpdate(); 
                     %>
                     <h1>Registered successfully</h1>
        <%
                }catch(Exception e){
                    out.println(e.getMessage());
                }            
        %>
    </body>
</html>
