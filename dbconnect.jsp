<%-- 
    Document   : dbconnect
    Created on : Feb 9, 2017, 11:36:40 AM
    Author     : hp
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <body>
        <%!
            public class dbconnect{
                
                String uname = "root";
                String pwd = "";
                Connection con = null;
                PreparedStatement s;
Statement st;
                ResultSet r;
                public dbconnect(String s){
                String url = "jdbc:mysql://localhost:3306/"+s;
            try{
                con = DriverManager.getConnection(url,uname,pwd);
            }
            catch(Exception e){
                    e.printStackTrace();
            }
}
            public void setStatement(String Query){
            try{
            s = con.prepareStatement(Query);
            }catch(Exception e){
                e.printStackTrace();
            }
}
               
            public ResultSet result(){
            try{
            r = s.executeQuery();
            }catch(Exception e){
            e.printStackTrace();
}
            return r;
}
            public int update(String s){
            int i=0;
            try{
                st = con.createStatement();
                i = st.executeUpdate(s);
            }catch(Exception e){
            e.printStackTrace();
}
        return i;
}
}
            %>
    </body>
</html>
