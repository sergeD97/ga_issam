/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.models;

/**
 * @author ►BenjiS☼l☼
 */
public class Menu {
    private String idMenu;
    private String lien;

    public String getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(String idMenu) {
        this.idMenu = idMenu;
    }

    public String getLien() {
        return lien;
    }

    public void setLien(String lien) {
        this.lien = lien;
    }

    public Menu(String idMenu, String lien) {
        this.idMenu = idMenu;
        this.lien = lien;
    }
}
