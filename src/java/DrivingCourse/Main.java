/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DrivingCourse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author dogan.cakir
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/DrivingCourse";
        Properties props = new Properties();
        props.setProperty("user", "postgres");
        props.setProperty("password", "Sade01pass");
        Connection conn = DriverManager.getConnection(url, props);
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM \"DrivingCourse\".\"User\"");
        while (rs.next()) {
            System.out.println(rs.getString(1)+"  "+rs.getString(2));
        }
        rs.close();
        st.close();
    }

}
