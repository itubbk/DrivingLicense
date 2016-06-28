<%@page import="javax.swing.JOptionPane"%>
<%@ page import ="java.sql.*" %>
<%
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int max = 0;
        Class.forName("org.postgresql.Driver");  // PostgreSQL database connection
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DrivingCourse", "postgres", "Sade01pass");
        //PreparedStatement pst = conn.prepareStatement("Select \"username\",\"password\" from \"DrivingCourse\".\"User\" where \"username\"=? and \"password\"=?");
        PreparedStatement pst = conn.prepareStatement("select max(\"UID\") as max_id from \"DrivingCourse\".\"User\"");
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        max = Integer.parseInt(rs.getString("max_id"))+1;
        }
        Statement statement = conn.createStatement();
        statement.executeUpdate("Insert into \"DrivingCourse\".\"User\" values ("+max+",'"+username+"','"+password+"')");
        JOptionPane.showMessageDialog(null, "user is signed up");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        out.println("Something went wrong !! Please try again");
    }
%>