<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("org.postgresql.Driver");  // PostgreSQL database connection
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DrivingCourse" ,"postgres","Sade01pass");    
        PreparedStatement pst = conn.prepareStatement("Select \"username\",\"password\" from \"DrivingCourse\".\"User\" where \"username\"=? and \"password\"=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>