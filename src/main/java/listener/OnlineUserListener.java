/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package listener;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

/**
 *
 * @author mac
 */
public class OnlineUserListener implements HttpSessionListener{
    private static int userCount = 0 ; 

    @Override
    public void sessionCreated(HttpSessionEvent se) {
       userCount ++ ; // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        userCount-- ;// Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    public OnlineUserListener() {
    }

    public static int getUserCount() {
        return userCount;
    }
    
   
    

 
    
    
}
