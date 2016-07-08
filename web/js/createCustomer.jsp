<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    try {
        String name = request.getParameter("user_name");
        String surname = request.getParameter("user_surname");
        String email = request.getParameter("user_email");
        String address = request.getParameter("user_address");
        String gender = request.getParameter("user_gender");
        String startDateStr = request.getParameter("user_date");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//surround below line with try catch block as below code throws checked exception
        java.util.Date utilDate = sdf.parse(startDateStr);
        Date date = new java.sql.Date(utilDate.getTime());
        String phoneNumber = request.getParameter("user_phoneNumber");
        Class.forName("org.postgresql.Driver");  // PostgreSQL database connection
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DrivingCourse", "postgres", "Sade01pass");
        PreparedStatement prep = conn.prepareStatement("Insert into \"DrivingCourse\".\"customerlist\"" + "(\"duedate\",\"name\",\"surname\",\"email\",\"address\",\"phonenumber\",\"gender\")  values" + "(?,?,?,?,?,?,?)");
        prep.setDate(1, date);
        prep.setString(2, name);
        prep.setString(3, surname);
        prep.setString(4, email);
        prep.setString(5, address);
        prep.setString(6, phoneNumber);
        prep.setString(7, gender);
        prep.executeUpdate();
        JOptionPane.showMessageDialog(null, "Customer is created");
        RequestDispatcher dispatcher = request.getRequestDispatcher("../homePage.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        out.println("Something went wrong !! Please try again");
    }
%>