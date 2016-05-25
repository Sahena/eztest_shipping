/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eztest
 */
public class DbConnection {
     static Connection con = null;
    String driver, connectionString, user, password;

    public DbConnection(String driver, String connectionString, String user, String password) {
        this.driver = driver;
        this.connectionString = connectionString;
        this.user = user;
        this.password = password;
    }

    public Connection getConnection() {
        if (con == null) {
           
            try {
                Class.forName(driver);
                System.out.println("Driver Loads Sucessfully!!");
                con = DriverManager.getConnection(connectionString,user,password);
                System.out.println("Connection Established!!");
                
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        return con;
    }
}
