/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.managedbean;

import ges.academy.entity.Preinscription;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author ►BenjiS☼l☼
 */
@ManagedBean(name="adminBean")
@ApplicationScoped
public class AdminBean implements Serializable {
    @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
    @ManagedProperty("#{loginBean}")
    private LoginBean lb;
    private List<Preinscription> preinsList;
    
    public AdminBean() {
        preinsList = new ArrayList<>();
        populateList();
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public List<Preinscription> getPreinsList() {
        return preinsList;
    }

    public void setPreinsList(List<Preinscription> preinsList) {
        this.preinsList = preinsList;
    }

    private void populateList() {
        //List<Preinscription> list = getEm().createNamedQuery("Preinscription.findAll").getResultList();
        //this.preinsList = list;
        System.out.println("nombre : "+preinsList.size());
    }
    
}
