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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
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
@ManagedBean(name = "preinscriptionBean")
@SessionScoped
public class PreinscriptionBean {

    @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    private Preinscription preins,preins2;
    private PreinsMatiere note;
    private PreinsDiplome diplomeAutre;
    private final List<PreinsDiplome> listDiplome;
    private final List<PreinsMatiere> listMatiere;
    private String pays, matiere, diplomeA, mat, pass, filiere1, filiere2, region, departementGeo, langue1, langue2, cycle, typeFormation, choix1, choix2, diplomeAd, serie, mention, loisir1, loisir2, sport1, sport2, typeHandicap, sexe, taf, sp, spCom, datenaiss, handicap;
    private boolean pers;
    private long id;

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
            mat = generateMatricule(preins.getIdpreins());
            pass = generatePass();
            preins.setPwd(pass);
            preins.setMatricule(mat);
            em.merge(preins);
            //em.getTransaction().commit();
            transaction.commit();

            pers = false;
        }
    }

    public PreinscriptionBean() {
        pers = true;
        sexe = "Homme";
        taf = "oui";
        spCom = "oui";
        sp = "oui";
        handicap = "non";
        preins = new Preinscription();
        note = new PreinsMatiere();
        diplomeAutre = new PreinsDiplome();
        preins.setActivitesportive(Boolean.TRUE);
        preins.setHandicap(false);
        listDiplome = new ArrayList<>();
        listMatiere = new ArrayList<>();

    }

    @PostConstruct
    public void init() {
        System.out.println(generateMatricule(2154));
    }

    public boolean isPers() {
        return pers;
    }

    public String getMat() {
        return mat;
    }

    public void setMat(String mat) {
        this.mat = mat;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Preinscription getPreins() {
        return preins;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getTaf() {
        return taf;
    }

    public void setTaf(String taf) {
        this.taf = taf;
    }

    public String getSp() {
        return sp;
    }

    public void setSp(String sp) {
        this.sp = sp;
    }

    public String getSpCom() {
        return spCom;
    }

    public void setSpCom(String spCom) {
        this.spCom = spCom;
    }

    public String getDatenaiss() {
        return datenaiss;
    }

    public boolean getNotPreins() {
        return !pers;
    }

    public void setDatenaiss(String datenaiss) {
        this.datenaiss = datenaiss;
    }

    public String getHandicap() {
        return handicap;
    }

    public void setHandicap(String handicap) {
        this.handicap = handicap;
    }

    public void setPreins(Preinscription preins) {
        this.preins = preins;
    }

    public String getPays() {
        return pays;
    }

    public String getDiplomeA() {
        return diplomeA;
    }

    public void setDiplomeA(String diplomeA) {
        this.diplomeA = diplomeA;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public List<PreinsDiplome> getListDiplome() {
        return listDiplome;
    }

    public List<PreinsMatiere> getListMatiere() {
        return listMatiere;
    }

    public String getFiliere1() {
        return filiere1;
    }

    public void setFiliere1(String filiere1) {
        this.filiere1 = filiere1;
    }

    public String getFiliere2() {
        return filiere2;
    }

    public void setFiliere2(String filiere2) {
        this.filiere2 = filiere2;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public PreinsMatiere getNote() {
        return note;
    }

    public void setNote(PreinsMatiere note) {
        this.note = note;
    }

    public PreinsDiplome getDiplomeAutre() {
        return diplomeAutre;
    }

    public void setDiplomeAutre(PreinsDiplome diplomeAutre) {
        this.diplomeAutre = diplomeAutre;
    }

    public String getDepartementGeo() {
        return departementGeo;
    }

    public void setDepartementGeo(String departementGeo) {
        this.departementGeo = departementGeo;
    }

    public String getLangue1() {
        return langue1;
    }

    public void setLangue1(String langue1) {
        this.langue1 = langue1;
    }

    public String getLangue2() {
        return langue2;
    }

    public void setLangue2(String langue2) {
        this.langue2 = langue2;
    }

    public String getCycle() {
        return cycle;
    }

    public void setCycle(String cycle) {
        this.cycle = cycle;
    }

    public String getTypeFormation() {
        return typeFormation;
    }

    public void setTypeFormation(String typeFormation) {
        this.typeFormation = typeFormation;
    }

    public String getChoix1() {
        return choix1;
    }

    public void setChoix1(String choix1) {
        this.choix1 = choix1;
    }

    public String getChoix2() {
        return choix2;
    }

    public void setChoix2(String choix2) {
        this.choix2 = choix2;
    }

    public String getDiplomeAd() {
        return diplomeAd;
    }

    public void setDiplomeAd(String diplomeAd) {
        this.diplomeAd = diplomeAd;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getMention() {
        return mention;
    }

    public void setMention(String mention) {
        this.mention = mention;
    }

    public String getLoisir1() {
        return loisir1;
    }

    public void setLoisir1(String loisir1) {
        this.loisir1 = loisir1;
    }

    public String getLoisir2() {
        return loisir2;
    }

    public void setLoisir2(String loisir2) {
        this.loisir2 = loisir2;
    }

    public String getSport1() {
        return sport1;
    }

    public void setSport1(String sport1) {
        this.sport1 = sport1;
    }

    public String getSport2() {
        return sport2;
    }

    public void setSport2(String sport2) {
        this.sport2 = sport2;
    }

    public String getTypeHandicap() {
        return typeHandicap;
    }

    public void setTypeHandicap(String typeHandicap) {
        this.typeHandicap = typeHandicap;
    }

    public void ajoutNote() {
        System.out.println(generatePass());
        boolean add = true;
        for (PreinsMatiere pm : this.listMatiere) {
            if (pm.getMatieres().getIdmatiere().equals(matiere)) {
                add = false;
                break;
            }
        }
        if (add) {
            this.listMatiere.add(new PreinsMatiere(note.getNoteOuGrade(), new Matieres(matiere)));
            note = new PreinsMatiere();
        }

    }

    public void ajouDiplomeAutre() {
        boolean add = true;
        for (PreinsDiplome pm : this.listDiplome) {
            if (pm.getDiplomes().getIddiplome().equals(diplomeA)) {
                add = false;
                break;
            }
        }

        if (add) {
            this.listDiplome.add(new PreinsDiplome(this.diplomeAutre.getAnneobtention(), this.diplomeAutre.getEtabobtention(), new Diplomes(diplomeA)));

        }

    }

    public void removeNote(String mat) {
        for (PreinsMatiere pm : this.listMatiere) {
            if (pm.getMatieres().getIdmatiere().equals(mat)) {
                this.listMatiere.remove(pm);
                System.out.println(pm.getMatieres().getIdmatiere());
                break;
            }
        }
    }

    public void removeDiplumeAutre(String dip) {
        for (PreinsDiplome pm : this.listDiplome) {
            if (pm.getDiplomes().getIddiplome().equals(dip)) {
                this.listDiplome.remove(pm);
                break;
            }
        }
    }

    private String generateMatricule(long id) {
        int y = Calendar.getInstance().get(Calendar.YEAR);
        String idw = id + "";
        for (int i = idw.length(); i <= 5; i++) {
            idw = "0" + idw;
        }
        return (y + "").substring(2) + idw;
    }

    private String generatePass() {
        Random r = new Random();
        int p = r.nextInt(9999);
        String ps = p + "";
        String[] val = {"a", "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"};
        int ind = r.nextInt(val.length - 1);
        for (int i = ps.length(); i < 4; i++) {
            ps = "0" + ps;
        }
        return val[ind] + ps;
    }

}
