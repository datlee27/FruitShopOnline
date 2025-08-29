/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 *
 * @author mac
 */
public class LogFilter implements Filter{

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
         HttpServletRequest req = (HttpServletRequest) sr;
        String path = req.getRequestURI();
        String ip = sr.getRemoteAddr();
        System.out.println("Request from " + ip + " to " + path);
 
        fc.doFilter(sr, sr1);
    }

    public void init(FilterConfig config) {}
    public void destroy() {} // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    

