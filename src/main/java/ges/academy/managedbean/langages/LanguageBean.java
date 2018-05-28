/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.managedbean.langages;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author serge
 */
@ManagedBean( name="langueBean")
@SessionScoped
public class LanguageBean implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Locale locale;
    
    public LanguageBean(){
        locale = FacesContext.getCurrentInstance().getViewRoot().getLocale();
        /*FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);*/
    }

    public String getLangue() {
        /* nous permet de mettre a jour la langue de la page au chargemet de celle - ci avec la langue actuel de notre bean*/
        /* Permet de conserver la langue choise toute la durrees de la session */
        FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);
        return locale.getLanguage();
    }

    public void setLangue(String langue) {
        locale = new Locale(langue);
        FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);
    }
    
    public SelectItem[] getListLangue(){
        ArrayList<SelectItem> list = new ArrayList<>();
        Locale l;
        
        Iterator<Locale> iterator=FacesContext.getCurrentInstance().getApplication().getSupportedLocales();
        while(iterator.hasNext()){
            l = iterator.next();
            list.add(new SelectItem(l.getLanguage(), l.getDisplayLanguage()));
        }
        
        SelectItem[] s= new SelectItem[list.size()];
        list.toArray(s);
        return s;
    }
    
    
}
