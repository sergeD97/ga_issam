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
            //quand l'utilisateur n'est pas loggé
            if(!url.contains("login.xhtml")) {
                //s'il ne  sagit pas de la page de connexion on redirige la requete vers celle-ci.
               resp.sendRedirect(req.getContextPath()+"/login.xhtml");
            } 
            else if(url.contains("404.xhtml")) {
            }
        }
        else{
            boolean autorise = false;
            // l'utilisateur est connecte .. il n'a plus acces a la page de connection.
            if(url.contains("login.xhtml")) {
                resp.sendRedirect(req.getContextPath()+"/index.xhtml");
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
                    resp.sendRedirect(req.getContextPath()+"/404.xhtml");
            }
            
        }
        chain.doFilter(req, response);
    }

    @Override
    public void destroy() {
    }

}
