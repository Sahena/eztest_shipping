/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.common;

import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Eztest
 */
public class DbListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
       ServletContext sc=sce.getServletContext();
        String driver=sc.getInitParameter("driver");//driver from web.xml
        String url = sc.getInitParameter("url");//url from web.xml
        String user = sc.getInitParameter("user");
        String pass =sc.getInitParameter("password");
        
        DbConnection dbConnection = new DbConnection(driver, url, user, pass);
        Connection con =dbConnection.getConnection();
        sc.setAttribute("con", con);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
