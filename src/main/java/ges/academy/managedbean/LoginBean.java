/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.managedbean;

import ges.academy.entity.Administrateur;
import ges.academy.entity.Enseignant;
import ges.academy.entity.Etudiant;
import ges.academy.entity.Message;
import ges.academy.entity.MessagePreins;
import ges.academy.entity.Preinscription;
import ges.academy.models.Menu;
import ges.academy.utils.SessionUtils;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ►BenjiS☼l☼
 */
@ManagedBean(name = "loginBean")
@SessionScoped
public class LoginBean implements Serializable{
    @PersistenceContext(unitName = "gecadPU")
    EntityManager em;
    private Preinscription userPreinscrit;
    @ManagedProperty("#{messageBean}")
    private messageBean mb;
    private String matricule;
    private String nom;
    private String sexe;
    private String password;
    private String userGroup;
    private String imgP;
    private MessagePreins messagePreinsToRead;
    private String errorMessage;
    public boolean isLogged = false;
    private ArrayList<Menu> menuList;
    private List messageList;

    // --- Constructors ---
    public LoginBean() {
        userPreinscrit = new Preinscription();
        menuList = new ArrayList<>();
        messageList = new ArrayList<>();
        messagePreinsToRead = new MessagePreins();
    }
    
    // --- Methodes metiers ----
    public String login() {
        boolean valid = false;
        String s;
        //Authentification de l'utilisateur 
        //comptes Preinscription et Consultant
        if(isPreins()){
            this.userGroup = "Preinscrit";
            valid = true;
        }
        else if(isEtudiant()){
            this.userGroup = "Etudiant";
            valid = true;
        }
        else if(isEnseignant()) {
            this.userGroup = "Enseignant";
            valid = true;
        }
        else if(isAdmin()) {
            this.userGroup = "Administrateur";
            valid = true;
        }
        if(valid) {
            System.out.println("Current User[name="+this.getNom()+", groupe="+this.getUserGroup()+", password="+this.getPassword()+"]");
            switch(userGroup) {
                case "Preinscrit" : {
                    menuList.clear();
                    menuList.add(new Menu("profilePreins", "pages/profile_preins.xhtml"));
                    menuList.add(new Menu("newPreins", "preinscription.xhtml"));
                    menuList.add(new Menu("modifierPreins", "hhh.xhtml"));
                    menuList.add(new Menu("etatPreins", "jjj.xhtml"));
                    menuList.add(new Menu("messagesPreins", "messages_preins.xhtml"));
                    menuList.add(new Menu("comptePreins", "compte_preins.xhtml"));
                    menuList.add(new Menu("Accueil", "index.xhtml"));
                }break;
                case "Etudiant" : {
                    menuList.clear();
                    menuList.add(new Menu("userMenu", "pages/gestion_utilisateur.xhtml"));
                    menuList.add(new Menu("profileEtudiant", "pages/profile_etudiant.xhtml"));
                }break;
                case "Enseignant" : {
                    menuList.clear();
                    menuList.add(new Menu("userMenu", "pages/gestion_utilisateur.xhtml"));
                    menuList.add(new Menu("groupMenu", "pages/gestion_groupe.xhtml"));
                    menuList.add(new Menu("sousMenu2", "pages/sousmenu2.xhtml"));
                    menuList.add(new Menu("profileEnseignant", "pages/profile_enseignant.xhtml"));
                }break;
                case "Administrateur" : {
                    menuList.clear();
                    menuList.add(new Menu("userMenu", "pages/gestion_utilisateur.xhtml"));
                    menuList.add(new Menu("groupMenu", "pages/gestion_groupe.xhtml"));
                    menuList.add(new Menu("autreMenu", "pages/autremenu.xhtml"));
                    menuList.add(new Menu("sousMenu1", "pages/sousmenu1.xhtml"));
                    menuList.add(new Menu("sousMenu2", "pages/sousmenu2.xhtml"));
                    menuList.add(new Menu("profileAdmim", "pages/profile_admin.xhtml"));
                }break;
                default : { System.out.println("La valeur de l'attribut 'userGroup' est nulle!");}
            }
            HttpSession session = SessionUtils.getSession();
            session.setAttribute("username", this.getNom());
            session.setAttribute("usergroup", this.getUserGroup());
            isLogged = true;
            s = "pages/profile_preins.xhtml?faces-redirect=true";
        }
        else {
            errorMessage = "Please enter correct username and Password";
            FacesContext.getCurrentInstance().addMessage( null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Incorrect Username and Passowrd",
                            "Please enter correct username and Password"));
            s = "login.xhtml?faces-redirect=true";
        }
        return s;
    }
    
    public String LogOut() {
        HttpSession session = SessionUtils.getSession();
        session.invalidate();
        isLogged = false;
        /*session.removeAttribute("username");
        session.removeAttribute("usergroup");
        isLogged = false;*/
        return "login.xhtml";
    }
    
    // --- Conditions Pour le rendu visuel ---
    public boolean isMenuRendered(String idMenu) {
        boolean flag = false;
        for(Menu m : menuList) {
            if(m.getIdMenu().equals(idMenu)) {
                flag = true;
                break;
            }
        }
        return flag;
    }
    
    private boolean isPreins() {
        boolean flag = false;
        List<Preinscription> preinsList = getEm().createNamedQuery("Preinscription.findByLogin").setParameter("login", this.getNom()).getResultList();
        System.out.println("ges.academy.managedbean.LoginBean.isPreins() sds"+ preinsList.size());
        for(Preinscription p : preinsList) {
            if((p.getLogin().equals(this.getNom()) || p.getNom().equals(this.getNom())) && p.getPwd().equals(this.getPassword())) {
                flag = true;
                userPreinscrit = p;
                matricule = p.getLogin();
                nom = p.getNom();
                sexe = p.getSexe();
                messageList = p.getMessagePreinsList();
                System.out.println("----- NB Messages : "+messageList.size());
                for(MessagePreins mp : p.getMessagePreinsList()) {
                    if(!mp.getMessagelu()) {
                        this.mb.getMessagePreinsNonLuList().add(mp);
                    }
                }
                mb.nbMsg = mb.getMessagePreinsNonLuList().size();
                imgP = imgProfile();
            }
        }
        return flag;
    }
    
    private boolean isEtudiant() {
        boolean flag = false;
        List<Etudiant> studentsList = getEm().createNamedQuery("Etudiant.findAll").getResultList();
        for(Etudiant e : studentsList) {
            if((e.getMatricule().equals(this.getNom()) || e.getNom().equals(this.getNom())) && e.getPwd().equals(this.getPassword())) {
                flag = true;
                matricule = e.getMatricule();
                nom = e.getNom();
                messageList = e.getMessageList();
            }
        }
        return flag;
    }

    private boolean isEnseignant() {
        boolean flag = false;
        List<Enseignant> teachersList = getEm().createNamedQuery("Enseignant.findAll").getResultList();
        for(Enseignant e : teachersList) {
            if(e.getNom().equals(this.getNom()) && e.getPwd().equals(this.getPassword())) {
                flag = true;
                e.getMatricule();
            }
        }
        return flag;
    }

    private boolean isAdmin() {
        boolean flag = false;
        List<Administrateur> adminList = getEm().createNamedQuery("Administrateur.findAll").getResultList();
        for(Administrateur a : adminList) {
            if(a.getNom().equals(this.getNom()) && a.getPwd().equals(this.getPassword())) {
                flag = true;
                a.getMatricule();
            }
        }
        return flag;
    }
    
    public String imgProfile() {
        return (sexe.equals("F"))? "avatar1.jpg":"avatar.png";
    }
    
    
    public String readMessage(MessagePreins message) {
        this.messagePreinsToRead = message;
        return "message_preins.xhtml?faces-redirect=true";
    }
    
    // --- Getters & Setters ---
    public EntityManager getEm() {
        return em;
    }

    public Preinscription getUserPreinscrit() {
        return userPreinscrit;
    }

    public void setUserPreinscrit(Preinscription userPreinscrit) {
        this.userPreinscrit = userPreinscrit;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }

    public boolean isIsLogged() {
        return isLogged;
    }

    public void setIsLogged(boolean isLogged) {
        this.isLogged = isLogged;
    }

    public ArrayList<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(ArrayList<Menu> menuList) {
        this.menuList = menuList;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getImgP() {
        return imgP;
    }

    public void setImgP(String imgP) {
        this.imgP = imgP;
    }

    public MessagePreins getMessagePreinsToRead() {
        return messagePreinsToRead;
    }

    public void setMessagePreinsToRead(MessagePreins messagePreinsToRead) {
        this.messagePreinsToRead = messagePreinsToRead;
    }

    public void setMb(messageBean mb) {
        this.mb = mb;
    }
}
