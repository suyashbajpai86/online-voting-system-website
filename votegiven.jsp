<%-- 
    Document   : votegiven
    Created on : Feb 22, 2017, 10:19:23 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%!
    String uname = "root";
    String pwd = "";
    String url = "jdbc:mysql://localhost:3306/voting_system";
%>
<html>
    <body>
        <% 
            Connection con = DriverManager.getConnection(url,uname,pwd);
            PreparedStatement s = con.prepareStatement("update candidates set votes = votes+1 where id = ?");
            s.setInt(1, Integer.parseInt(request.getParameter("vote")));
            s.executeUpdate();
            out.println("Vote given succesfully");
            Thread.sleep(5000);
            session.invalidate();
            response.sendRedirect("index.html");
        %>
    </body>
</html>
