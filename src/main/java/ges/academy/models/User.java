/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.models;

/**
 * @author Expression BenjiSolo is undefined on line 11, column 14 in Templates/Classes/Class.java.
 * @param <T>
 */
public class User<T> {
    private String login;
    private String password;
    private String group;

    public User() {
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

}
