/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.managedbean;

import ges.academy.entity.Preinscription;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * @author ►BenjiS☼l☼
 */
@ManagedBean(name="adminBean")
@ApplicationScoped
public class AdminBean {
    @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
    
    private List<Preinscription> preinsList;
    
    public AdminBean() {
        preinsList = new ArrayList<>();
        preinsList = getEm().createNamedQuery("Preinscription.findAll").getResultList();
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
    
}
