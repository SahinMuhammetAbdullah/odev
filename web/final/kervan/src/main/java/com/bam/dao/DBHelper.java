package com.bam.dao;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBHelper {

    private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private final String DB_URL = "jdbc:mysql://localhost:3306/kervanDb?useSSL=false&serverTimezone=UTC";

    private final String USER = "root";
    private final String PASS = "";

    private Connection conn = null;
    private Statement stmt = null;

    public DBHelper() {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void open() {
        try {
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void close() {
        try {
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // String table_name;

    // public void test(String table_name) {
    //     this.table_name = table_name;
    //     try {
    //         String sql = "SELECT * FROM " + this.table_name;
    //         ResultSet rs = stmt.executeQuery(sql);
                    
    //         //STE P 5: Extrac t data from result set
    //         while( rs.next()){
    //             //Display values
    //             System.out.print(rs.getString(1));
    //             System.out.print(rs.getString(2));
    //         } 
    //         //STEP 6: Clean-up environment
    //         rs.close();
    //     } catch (SQLException ex) {
    //         Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
    //     }
    // }
}
