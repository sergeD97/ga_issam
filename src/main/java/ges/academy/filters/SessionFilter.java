/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.filters;

import ges.academy.managedbean.LoginBean;
import ges.academy.models.Menu;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ►BenjiS☼l☼
 */
public class SessionFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        LoginBean session = (LoginBean) req.getSession().getAttribute("loginBean");
        String url = req.getRequestURI();
        
        if(session == null || !session.isLogged) {
            System.out.println("URL: "+url);
            if(url.endsWith("ga_issam/") || url.contains("login.xhtml") || url.contains("preinscription.xhtml") || url.contains("404.xhtml")) {
            } 
            else {
               resp.sendRedirect(req.getServletContext().getContextPath() + "/login.xhtml");
            }
        }
        else{
            boolean autorise = false;
            // l'utilisateur est connecte .. il n'a plus acces a la page de connection.
            if(url.contains("login.xhtml")) {
                resp.sendRedirect(req.getContextPath()+"/pages/profile_preins.xhtml");
            }
            else if(url.contains("404.xhtml")) {
            }
            else {
                ArrayList<Menu> liste = (ArrayList) session.getMenuList();
                for (Menu m : liste) {
                    if(url.contains(m.getLien())) {
                        autorise = true;
                        break;
                    }
                }
                if(!autorise)
                    resp.sendRedirect(req.getServletContext().getContextPath()+"/404.xhtml");
            }
            
        }
        chain.doFilter(req, response);
    }

    @Override
    public void destroy() {
    }

}
