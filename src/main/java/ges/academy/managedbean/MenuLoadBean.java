/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.managedbean;

import ges.academy.entity.Cycles;
import ges.academy.entity.DepartementGeographique;
import ges.academy.entity.Diplomes;
import ges.academy.entity.Filiere;
import ges.academy.entity.Handicaps;
import ges.academy.entity.Langues;
import ges.academy.entity.Loisirs;
import ges.academy.entity.Matieres;
import ges.academy.entity.Mentions;
import ges.academy.entity.Niveau;
import ges.academy.entity.Pays;
import ges.academy.entity.PieceDossier;
import ges.academy.entity.Region;
import ges.academy.entity.Sports;
import ges.academy.entity.TypeBacc;
import ges.academy.entity.TypeFormation;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author serge
 */
@ManagedBean(name="menuBean")
@SessionScoped
public class MenuLoadBean {
    
   @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
     
    private List<Langues> listLangue;
    private List<Region> listRegion;
    private List<DepartementGeographique> listDepartementGeo;
    private List<Loisirs> listLoisir;
    private List<Pays> listPays;
    private List<Handicaps> listHandicap;
    private List<Sports> listSport;
    private List<Cycles> listCycle;
    private List<Diplomes> listDiplome;
    private List<Matieres> listMatieres;
    private List<Mentions> listMention;
    private List<Niveau> listNiveau;
    private List<TypeFormation> listTypeFormation;
    private List<TypeBacc> listTypeBacc;
    private List<Filiere> listFiliere;
    private List<PieceDossier> listPieceDossier;
    private String cycle, tf, pays, filiere;
    
    
    public MenuLoadBean(){
        cycle = "L";
        tf = "1";
        pays = "";
        filiere = "";
    }
    
    @PostConstruct
    private void init(){
        listFiliere = new ArrayList<>();
        listFiliere = em.createNamedQuery("Filiere.findAll").getResultList();
        listLangue = em.createNamedQuery("Langues.findAll").getResultList();
        listCycle = em.createNamedQuery("Cycles.findAll").getResultList();
        listDepartementGeo = em.createNamedQuery("DepartementGeographique.findAll").getResultList();
        listDiplome = em.createNamedQuery("Diplomes.findAll").getResultList();
        listHandicap = em.createNamedQuery("Handicaps.findAll").getResultList();
        listLoisir = em.createNamedQuery("Loisirs.findAll").getResultList();
        listMatieres = em.createNamedQuery("Matieres.findAll").getResultList();
        listMention = em.createNamedQuery("Mentions.findAll").getResultList();
        listNiveau = em.createNamedQuery("Niveau.findAll").getResultList();
        listPays = em.createNamedQuery("Pays.findAll").getResultList();
        listRegion = em.createNamedQuery("Region.findAll").getResultList();
        listSport = em.createNamedQuery("Sports.findAll").getResultList();
        listTypeFormation = em.createNamedQuery("TypeFormation.findAll").getResultList();
        listTypeBacc = em.createNamedQuery("TypeBacc.findAll").getResultList();
        listPieceDossier = em.createNamedQuery("PieceDossier.findAll").getResultList();
        
        
    }

    public String getPays() {
        return pays;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public String getFiliere() {
        return filiere;
    }

    public void setFiliere(String filiere) {
        this.filiere = filiere;
    }

    
    
    public List<Filiere> getListFiliere() {
        List<Filiere> l = new ArrayList<>();
        for(Filiere fg : this.listFiliere){
            if(fg.getCycles().getIdcycle().equals(cycle) && fg.getTypeformation().getIdformation().equals(tf)){
                l.add(fg);
            }
        }
        
        return l;
        
    }

    public String getTf() {
        return tf;
    }

    public void setTf(String tf) {
        filiere = "";
        this.tf = tf;
    }

    public String getCycle() {
        return cycle;
    }

    public List<PieceDossier> getListPieceDossier() {
        List<PieceDossier> l = new ArrayList<>();
        for(PieceDossier pd : listPieceDossier){
            if(pd.getCodefiliere().getCodefilere().equals(filiere)){
                l.add(pd);
            }
        }
        
        return l;
    }

    public void setListPieceDossier(List<PieceDossier> listPieceDossier) {
        this.listPieceDossier = listPieceDossier;
    }
    
    

    public void setCycle(String cycle) {
        filiere = "";
        this.cycle = cycle;
    }
    
    
    public List<Langues> getListLangue() {
        return listLangue;
    }

    public EntityManager getEm() {
        return em;
    }

    public List<Region> getListRegion() {
        return listRegion;
    }

    public List<DepartementGeographique> getListDepartementGeo() {
        List<DepartementGeographique> l = new ArrayList<>();
        for (DepartementGeographique dep : listDepartementGeo){
            if(dep.getIdregion().equals(pays)){
                l.add(dep);
            }
        }
        return l;
    }

    public List<Loisirs> getListLoisir() {
        return listLoisir;
    }

    public List<Pays> getListPays() {
        return listPays;
    }

    public List<Handicaps> getListHandicap() {
        return listHandicap;
    }

    public List<Sports> getListSport() {
        return listSport;
    }

    public List<Cycles> getListCycle() {
        return listCycle;
    }

    public List<Diplomes> getListDiplome() {
        return listDiplome;
    }

    public List<Matieres> getListMatieres() {
        return listMatieres;
    }

    public List<Mentions> getListMention() {
        return listMention;
    }

    public List<Niveau> getListNiveau() {
        return listNiveau;
    }

    public List<TypeFormation> getListTypeFormation() {
        return listTypeFormation;
    }

    public List<TypeBacc> getListTypeBacc() {
        return listTypeBacc;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    
}
