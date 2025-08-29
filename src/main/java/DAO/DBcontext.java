package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcontext {
    public Connection getConnection() throws Exception {
        // Chuỗi kết nối JDBC cho MySQL
        String url = "jdbc:mysql://localhost:3306/Acc"
                   + "?useSSL=false"
                   + "&serverTimezone=UTC"
                   + "&zeroDateTimeBehavior=CONVERT_TO_NULL";

        // Tài khoản đăng nhập MySQL
        String user = "root";
        String password = "Levandat2004^";

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Trả về đối tượng kết nối
        return DriverManager.getConnection(url, user, password);
    }
    
    
}
