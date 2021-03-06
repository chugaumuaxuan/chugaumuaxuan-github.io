/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nguye
 */
public class DBContext {
    private static final String serverName = "ADMIN\\THANG";
    private static final String dbName = "PROJECTWEB_SneakerShop";
    private static final String portNumber = "1433";
    private static final String userID = "sa";
    private static final String password = "12345";
    
    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }



    
}
