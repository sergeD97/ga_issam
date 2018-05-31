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
import ges.academy.entity.Mentions;
import ges.academy.entity.Pays;
import ges.academy.entity.PreinsDiplome;
import ges.academy.entity.PreinsMatiere;
import ges.academy.entity.PreinsMatierePK;
import ges.academy.entity.Preinscription;
import ges.academy.entity.Region;
import ges.academy.entity.Sports;
import ges.academy.entity.TypeBacc;
import ges.academy.entity.TypeFormation;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

/**
 *
 * @author serge
 */
@ManagedBean(name = "updatePreinsBean")
@SessionScoped
public class UpdatePreinsBean {
    @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    @ManagedProperty("#{loginBean.userPreinscrit}")
    private Preinscription preins;
    private PreinsMatiere note;
    private PreinsDiplome diplomeAutre;
    private  List<PreinsDiplome> listDiplome  = new ArrayList<>();
    private  List<PreinsMatiere> listMatiere = new ArrayList<>();
    private String pays, matiere, diplomeA, mat, pass, filiere1, filiere2, region, departementGeo, langue1, langue2, cycle, typeFormation, choix1, choix2, diplomeAd, serie, mention, loisir1, loisir2, sport1, sport2, typeHandicap, sexe, taf, sp, spCom, datenaiss, handicap;
    private boolean pers;
    private long id;
    
    public UpdatePreinsBean(){
        //
        listMatiere = new ArrayList<>();
        if(preins!=null){
            listDiplome  = new ArrayList<>(preins.getPreinsDiplomeList());
            listMatiere = new ArrayList<>(preins.getPreinsMatiereList());
            preins.setPreinsDiplomeList(new ArrayList<PreinsDiplome>());
            preins.setPreinsMatiereList(new ArrayList<PreinsMatiere>());
            pays = preins.getPaysnationalite().getCodepays();
            diplomeA = preins.getDiplomeadmission().getIddiplome();
            
            
            
        }else{
            preins = new Preinscription();
        }
        
        
        
    }
    
    public void valider() throws NamingException, NotSupportedException, SystemException, RollbackException, HeuristicMixedException, HeuristicRollbackException {
        if (pers) {

            preins.setPaysnationalite(new Pays(pays));
            preins.setChoixformation1(new Filiere(filiere1));
            preins.setChoixformation2(new Filiere(filiere2));
            if (region != null && !region.equals("")) {
                preins.setRegion(new Region(region));
            }
            if (departementGeo != null && !departementGeo.equals("")) {
                preins.setDepartementgeographique(new DepartementGeographique(departementGeo));
            }
            if (typeHandicap != null && !typeHandicap.equals("")) {
                preins.setTypehandicap(new Handicaps(typeHandicap));
            }
            if (sport1 != null && !sport1.equals("")) {
                preins.setSport1(new Sports(sport1));
            }
            if (sport2 != null && !sport2.equals("")) {
                preins.setSport2(new Sports(sport2));
            }
            preins.setLang1(new Langues(langue1));
            preins.setLang2(new Langues(langue2));
            preins.setCycles(new Cycles(cycle));
            preins.setTypeformation(new TypeFormation(typeFormation));
            preins.setDiplomeadmission(new Diplomes(diplomeAd));
            preins.setTypebacc(new TypeBacc(serie));
            preins.setMention(new Mentions(mention));
            preins.setLoisir1(new Loisirs(loisir1));
            preins.setLoisir2(new Loisirs(loisir2));

            try {

                preins.setDatenaiss(dateFormat.parse(datenaiss));
            } catch (ParseException ex) {
                preins.setDatenaiss(new Date());
            }
            if (sexe.equals("Homme")) {
                preins.setSexe("H");
            } else {
                preins.setSexe("F");
            }
            if (taf.equals("oui")) {
                preins.setTaf(true);
            } else {
                preins.setTaf(false);
            }
            if (taf.equals("oui")) {
                preins.setTaf(true);
            } else {
                preins.setTaf(false);
            }
            if (sp.equals("oui")) {
                preins.setActivitesportive(true);
            } else {
                preins.setActivitesportive(false);
            }
            if (spCom.equals("oui")) {
                preins.setActivitesportivecom(true);
            } else {
                preins.setActivitesportivecom(false);
            }
            if (handicap.equals("oui")) {
                preins.setHandicap(true);
            } else {
                preins.setHandicap(false);
            }
            

            // preins.setPreinsDiplomeList(listDiplome);
            // preins.setPreinsMatiereList(listMatiere);
            UserTransaction transaction = (UserTransaction) new InitialContext().lookup("java:comp/UserTransaction");
//        if(!em.getTransaction().isActive()){
//            em.getTransaction().begin();
//        }
            transaction.begin();
            preins = em.merge(preins);
            transaction.commit();
//            em.refresh(preins);
            // em.getTransaction().commit();
            System.out.println("ges.academy.managedbean.PreinscriptionBean.valider()  " + preins.getIdpreins());
            id = preins.getIdpreins();
//        if(!em.getTransaction().isActive()){
//            em.getTransaction().begin();
//        }

            transaction.begin();
            for (PreinsMatiere pm : this.listMatiere) {
                pm.setPreinsMatierePK(new PreinsMatierePK(pm.getMatieres().getIdmatiere(), id));
                pm.setPreinscription(preins);
                em.persist(pm);
            }

            for (PreinsDiplome pm : this.listDiplome) {
                pm.getPreinsDiplomePK().setIdpreins(preins.getIdpreins());
                pm.setPreinscription(preins);
                em.persist(pm);
            }
            //  em.getTransaction().commit();
            transaction.commit();
//        if(!em.getTransaction().isActive()){
//            em.getTransaction().begin();
//        }
            transaction.begin();
            
            em.merge(preins);
            //em.getTransaction().commit();
            transaction.commit();

            pers = false;
        }
    }
    
    

    
}
