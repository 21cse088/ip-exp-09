<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ORDERS</title>
        <style>
            table,th,td{
               border:2px solid black;
               border-collapse: collapse;
               padding:20px;
            }
            body{
                background-image:url('bg.jpg');
                background-size:cover;
                margin-left:400px;
                margin-top:200px;
            }
        </style>
    </head>
    <body>
        <h1>order</h1>
        <table>
         <%
        Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/order");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("select count(*) from untitled");
        rs.next();
        int count=rs.getInt(1);
        out.println("<tr><td>Total Number of orders in the database</td><td> " + count+"</td></tr>");
        
        ResultSet rs1=st.executeQuery("select sum(unit_price)  from untitled");
        rs1.next();
        int total_order_id=rs1.getInt(1);
        out.print("<tr><td>Total amount of orders</td><td> "+total_order_id+"</td></tr>");
        
        ResultSet rs2=st.executeQuery("select avg(unit_price) from untitled");
        rs2.next();
        Double avg1=rs2.getDouble(1);
        out.println("<tr><td>The average  value</td><td>  "+avg1+"</td></tr></table>");
        %>
    </body>
</html>
