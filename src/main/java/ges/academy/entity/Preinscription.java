/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "preinscription")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Preinscription.findAll", query = "SELECT p FROM Preinscription p"),
    @NamedQuery(name = "Preinscription.findByIdpreins", query = "SELECT p FROM Preinscription p WHERE p.idpreins = :idpreins"),
    @NamedQuery(name = "Preinscription.findByRentreeacademique", query = "SELECT p FROM Preinscription p WHERE p.rentreeacademique = :rentreeacademique"),
    @NamedQuery(name = "Preinscription.findBySexe", query = "SELECT p FROM Preinscription p WHERE p.sexe = :sexe"),
    @NamedQuery(name = "Preinscription.findByNom", query = "SELECT p FROM Preinscription p WHERE p.nom = :nom"),
    @NamedQuery(name = "Preinscription.findByDatenaiss", query = "SELECT p FROM Preinscription p WHERE p.datenaiss = :datenaiss"),
    @NamedQuery(name = "Preinscription.findByAnneeacademique", query = "SELECT p FROM Preinscription p WHERE p.anneeacademique = :anneeacademique"),
    @NamedQuery(name = "Preinscription.findByLieunaiss", query = "SELECT p FROM Preinscription p WHERE p.lieunaiss = :lieunaiss"),
    @NamedQuery(name = "Preinscription.findByVilleresid", query = "SELECT p FROM Preinscription p WHERE p.villeresid = :villeresid"),
    @NamedQuery(name = "Preinscription.findByActiviteprofessionnelle", query = "SELECT p FROM Preinscription p WHERE p.activiteprofessionnelle = :activiteprofessionnelle"),
    @NamedQuery(name = "Preinscription.findByNumtel", query = "SELECT p FROM Preinscription p WHERE p.numtel = :numtel"),
    @NamedQuery(name = "Preinscription.findByEmail", query = "SELECT p FROM Preinscription p WHERE p.email = :email"),
    @NamedQuery(name = "Preinscription.findBySituationmatrimoniale", query = "SELECT p FROM Preinscription p WHERE p.situationmatrimoniale = :situationmatrimoniale"),
    @NamedQuery(name = "Preinscription.findByAnneeobtentiondipl", query = "SELECT p FROM Preinscription p WHERE p.anneeobtentiondipl = :anneeobtentiondipl"),
    @NamedQuery(name = "Preinscription.findByEtablissementdipl", query = "SELECT p FROM Preinscription p WHERE p.etablissementdipl = :etablissementdipl"),
    @NamedQuery(name = "Preinscription.findByDescriptionactiviteprof", query = "SELECT p FROM Preinscription p WHERE p.descriptionactiviteprof = :descriptionactiviteprof"),
    @NamedQuery(name = "Preinscription.findByHandicap", query = "SELECT p FROM Preinscription p WHERE p.handicap = :handicap"),
    @NamedQuery(name = "Preinscription.findByActivitesportive", query = "SELECT p FROM Preinscription p WHERE p.activitesportive = :activitesportive"),
    @NamedQuery(name = "Preinscription.findByNompersonneacontacter", query = "SELECT p FROM Preinscription p WHERE p.nompersonneacontacter = :nompersonneacontacter"),
    @NamedQuery(name = "Preinscription.findByTelpersonneacontacter", query = "SELECT p FROM Preinscription p WHERE p.telpersonneacontacter = :telpersonneacontacter"),
    @NamedQuery(name = "Preinscription.findByNomparent1", query = "SELECT p FROM Preinscription p WHERE p.nomparent1 = :nomparent1"),
    @NamedQuery(name = "Preinscription.findByTelparent1", query = "SELECT p FROM Preinscription p WHERE p.telparent1 = :telparent1"),
    @NamedQuery(name = "Preinscription.findByNomparent2", query = "SELECT p FROM Preinscription p WHERE p.nomparent2 = :nomparent2"),
    @NamedQuery(name = "Preinscription.findByTelparent2", query = "SELECT p FROM Preinscription p WHERE p.telparent2 = :telparent2"),
    @NamedQuery(name = "Preinscription.findByDatepreins", query = "SELECT p FROM Preinscription p WHERE p.datepreins = :datepreins"),
    @NamedQuery(name = "Preinscription.findByAnnuler", query = "SELECT p FROM Preinscription p WHERE p.annuler = :annuler"),
    @NamedQuery(name = "Preinscription.findByEtatpreins", query = "SELECT p FROM Preinscription p WHERE p.etatpreins = :etatpreins"),
    @NamedQuery(name = "Preinscription.findByPaye", query = "SELECT p FROM Preinscription p WHERE p.paye = :paye"),
    @NamedQuery(name = "Preinscription.findByDatepaiement", query = "SELECT p FROM Preinscription p WHERE p.datepaiement = :datepaiement"),
    @NamedQuery(name = "Preinscription.findByRendezvouspaiement", query = "SELECT p FROM Preinscription p WHERE p.rendezvouspaiement = :rendezvouspaiement"),
    @NamedQuery(name = "Preinscription.findByTypepaiement", query = "SELECT p FROM Preinscription p WHERE p.typepaiement = :typepaiement"),
    @NamedQuery(name = "Preinscription.findByRendezvousdepotdossier", query = "SELECT p FROM Preinscription p WHERE p.rendezvousdepotdossier = :rendezvousdepotdossier"),
    @NamedQuery(name = "Preinscription.findBySelectionner", query = "SELECT p FROM Preinscription p WHERE p.selectionner = :selectionner"),
    @NamedQuery(name = "Preinscription.findByGenerer", query = "SELECT p FROM Preinscription p WHERE p.generer = :generer"),
    @NamedQuery(name = "Preinscription.findByEtapeaccorde", query = "SELECT p FROM Preinscription p WHERE p.etapeaccorde = :etapeaccorde"),
    @NamedQuery(name = "Preinscription.findByMatricule", query = "SELECT p FROM Preinscription p WHERE p.matricule = :matricule"),
    @NamedQuery(name = "Preinscription.findByCentredexamen", query = "SELECT p FROM Preinscription p WHERE p.centredexamen = :centredexamen"),
    @NamedQuery(name = "Preinscription.findByNumcni", query = "SELECT p FROM Preinscription p WHERE p.numcni = :numcni"),
    @NamedQuery(name = "Preinscription.findByEmailpersonneacontacter", query = "SELECT p FROM Preinscription p WHERE p.emailpersonneacontacter = :emailpersonneacontacter"),
    @NamedQuery(name = "Preinscription.findByAdresse", query = "SELECT p FROM Preinscription p WHERE p.adresse = :adresse"),
    @NamedQuery(name = "Preinscription.findByLogin", query = "SELECT p FROM Preinscription p WHERE p.login = :login"),
    @NamedQuery(name = "Preinscription.findByPwd", query = "SELECT p FROM Preinscription p WHERE p.pwd = :pwd")})
public class Preinscription implements Serializable {

    @Size(max = 2147483647)
    @Column(name = "prenom")
    private String prenom;

    @Column(name = "taf")
    private Boolean taf;
    
    @Size(max = 2147483647)
    @Column(name = "adresse")
    private String adresse;
    @Column(name = "activitesportivecom")
    private Boolean activitesportivecom;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpreins")
    private Long idpreins;
    @Size(max = 2147483647)
    @Column(name = "rentreeacademique")
    private String rentreeacademique;
    @Size(max = 1)
    @Column(name = "sexe")
    private String sexe;
    @Size(max = 2147483647)
    @Column(name = "nom")
    private String nom;
    @Column(name = "datenaiss")
    @Temporal(TemporalType.DATE)
    private Date datenaiss;
    @Size(max = 2147483647)
    @Column(name = "anneeacademique")
    private String anneeacademique;
    @Size(max = 2147483647)
    @Column(name = "lieunaiss")
    private String lieunaiss;
    @Size(max = 2147483647)
    @Column(name = "villeresid")
    private String villeresid;
    @Size(max = 2147483647)
    @Column(name = "numtel")
    private String numtel;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 2147483647)
    @Column(name = "email")
    private String email;
    @Size(max = 2147483647)
    @Column(name = "situationmatrimoniale")
    private String situationmatrimoniale;
    @Size(max = 2147483647)
    @Column(name = "anneeobtentiondipl")
    private String anneeobtentiondipl;
    @Size(max = 2147483647)
    @Column(name = "etablissementdipl")
    private String etablissementdipl;
    @Size(max = 2147483647)
    @Column(name = "descriptionactiviteprof")
    private String descriptionactiviteprof;
    @Column(name = "handicap")
    private Boolean handicap;
    @Column(name = "activitesportive")
    private Boolean activitesportive;
    @Size(max = 2147483647)
    @Column(name = "nompersonneacontacter")
    private String nompersonneacontacter;
    @Size(max = 2147483647)
    @Column(name = "telpersonneacontacter")
    private String telpersonneacontacter;
    @Size(max = 2147483647)
    @Column(name = "nomparent1")
    private String nomparent1;
    @Size(max = 2147483647)
    @Column(name = "telparent1")
    private String telparent1;
    @Size(max = 2147483647)
    @Column(name = "nomparent2")
    private String nomparent2;
    @Size(max = 2147483647)
    @Column(name = "telparent2")
    private String telparent2;
    @Column(name = "datepreins")
    @Temporal(TemporalType.DATE)
    private Date datepreins;
    @Column(name = "annuler")
    private Boolean annuler;
    @Size(max = 1)
    @Column(name = "etatpreins")
    private String etatpreins;
    @Column(name = "paye")
    private Boolean paye;
    @Column(name = "datepaiement")
    @Temporal(TemporalType.DATE)
    private Date datepaiement;
    @Size(max = 2147483647)
    @Column(name = "rendezvouspaiement")
    private String rendezvouspaiement;
    @Size(max = 2147483647)
    @Column(name = "typepaiement")
    private String typepaiement;
    @Size(max = 2147483647)
    @Column(name = "rendezvousdepotdossier")
    private String rendezvousdepotdossier;
    @Column(name = "selectionner")
    private Boolean selectionner;
    @Column(name = "generer")
    private Boolean generer;
    @Size(max = 2147483647)
    @Column(name = "etapeaccorde")
    private String etapeaccorde;
    @Size(max = 2147483647)
    @Column(name = "matricule")
    private String matricule;
    @Size(max = 2147483647)
    @Column(name = "centredexamen")
    private String centredexamen;
    @Size(max = 2147483647)
    @Column(name = "numcni")
    private String numcni;
    
    @Size(max = 2147483647)
    @Column(name = "emailpersonneacontacter")
    private String emailpersonneacontacter;
    @Size(max = 2147483647)
    @Column(name = "login")
    private String login;
    @Size(max = 2147483647)
    @Column(name = "pwd")
    private String pwd;
    @Column(name = "activiteprofessionnelle")
    private String activiteprofessionnelle;
    @OneToMany(mappedBy = "idpreins")
    private List<MessagePreins> messagePreinsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preinscription")
    private List<PreinsDiplome> preinsDiplomeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preinscription")
    private List<PreinsMatiere> preinsMatiereList;
    @JoinColumn(name = "cycles", referencedColumnName = "idcycle")
    @ManyToOne
    private Cycles cycles;
    @JoinColumn(name = "departementgeographique", referencedColumnName = "codedepartementgeographique")
    @ManyToOne
    private DepartementGeographique departementgeographique;
    @JoinColumn(name = "diplomeadmission", referencedColumnName = "iddiplome")
    @ManyToOne
    private Diplomes diplomeadmission;
    @JoinColumn(name = "ecole", referencedColumnName = "codeecole")
    @ManyToOne
    private Ecole ecole;
    @JoinColumn(name = "choixformation1", referencedColumnName = "codefilere")
    @ManyToOne
    private Filiere choixformation1;
    @JoinColumn(name = "typebacc", referencedColumnName = "idtypebacc")
    @ManyToOne
    private TypeBacc typebacc;
    @JoinColumn(name = "choixformation2", referencedColumnName = "codefilere")
    @ManyToOne
    private Filiere choixformation2;
    @JoinColumn(name = "loisir1", referencedColumnName = "idloisir")
    @ManyToOne
    private Loisirs loisir1;
    @JoinColumn(name = "sport1", referencedColumnName = "idsport")
    @ManyToOne
    private Sports sport1;
    @JoinColumn(name = "paysnationalite", referencedColumnName = "codepays")
    @ManyToOne
    private Pays paysnationalite;
    @JoinColumn(name = "sport2", referencedColumnName = "idsport")
    @ManyToOne
    private Sports sport2;
    @JoinColumn(name = "mention", referencedColumnName = "idmention")
    @ManyToOne
    private Mentions mention;
    @JoinColumn(name = "choixformation3", referencedColumnName = "codefilere")
    @ManyToOne
    private Filiere choixformation3;
    @JoinColumn(name = "typehandicap", referencedColumnName = "idhandicap")
    @ManyToOne
    private Handicaps typehandicap;
    @JoinColumn(name = "lang2", referencedColumnName = "idlangue")
    @ManyToOne
    private Langues lang2;
    @JoinColumn(name = "lang1", referencedColumnName = "idlangue")
    @ManyToOne
    private Langues lang1;
    @JoinColumn(name = "loisir2", referencedColumnName = "idloisir")
    @ManyToOne
    private Loisirs loisir2;
    @JoinColumn(name = "paysobtentiondipl", referencedColumnName = "codepays")
    @ManyToOne
    private Pays paysobtentiondipl;
    @JoinColumn(name = "typeformation", referencedColumnName = "idformation")
    @ManyToOne
    private TypeFormation typeformation;
    @JoinColumn(name = "region", referencedColumnName = "coderegion")
    @ManyToOne
    private Region region;

    public Preinscription() {
    }

    public Preinscription(Long idpreins) {
        this.idpreins = idpreins;
    }

    public Long getIdpreins() {
        return idpreins;
    }
    
    public String getActiviteprofessionnelle() {
        return activiteprofessionnelle;
    }

    public void setActiviteprofessionnelle(String activiteprofessionnelle) {
        this.activiteprofessionnelle = activiteprofessionnelle;
    }

    public void setIdpreins(Long idpreins) {
        this.idpreins = idpreins;
    }

    public String getRentreeacademique() {
        return rentreeacademique;
    }

    public void setRentreeacademique(String rentreeacademique) {
        this.rentreeacademique = rentreeacademique;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(Date datenaiss) {
        this.datenaiss = datenaiss;
    }

    public String getAnneeacademique() {
        return anneeacademique;
    }

    public void setAnneeacademique(String anneeacademique) {
        this.anneeacademique = anneeacademique;
    }

    public String getLieunaiss() {
        return lieunaiss;
    }

    public void setLieunaiss(String lieunaiss) {
        this.lieunaiss = lieunaiss;
    }

    public String getVilleresid() {
        return villeresid;
    }

    public void setVilleresid(String villeresid) {
        this.villeresid = villeresid;
    }

    public String getNumtel() {
        return numtel;
    }

    public void setNumtel(String numtel) {
        this.numtel = numtel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSituationmatrimoniale() {
        return situationmatrimoniale;
    }

    public void setSituationmatrimoniale(String situationmatrimoniale) {
        this.situationmatrimoniale = situationmatrimoniale;
    }

    public String getAnneeobtentiondipl() {
        return anneeobtentiondipl;
    }

    public void setAnneeobtentiondipl(String anneeobtentiondipl) {
        this.anneeobtentiondipl = anneeobtentiondipl;
    }

    public String getEtablissementdipl() {
        return etablissementdipl;
    }

    public void setEtablissementdipl(String etablissementdipl) {
        this.etablissementdipl = etablissementdipl;
    }

    public String getDescriptionactiviteprof() {
        return descriptionactiviteprof;
    }

    public void setDescriptionactiviteprof(String descriptionactiviteprof) {
        this.descriptionactiviteprof = descriptionactiviteprof;
    }

    public Boolean getHandicap() {
        return handicap;
    }

    public void setHandicap(Boolean handicap) {
        this.handicap = handicap;
    }

    public Boolean getActivitesportive() {
        return activitesportive;
    }

    public void setActivitesportive(Boolean activitesportive) {
        this.activitesportive = activitesportive;
    }

    public String getNompersonneacontacter() {
        return nompersonneacontacter;
    }

    public void setNompersonneacontacter(String nompersonneacontacter) {
        this.nompersonneacontacter = nompersonneacontacter;
    }

    public String getTelpersonneacontacter() {
        return telpersonneacontacter;
    }

    public void setTelpersonneacontacter(String telpersonneacontacter) {
        this.telpersonneacontacter = telpersonneacontacter;
    }

    public String getNomparent1() {
        return nomparent1;
    }

    public void setNomparent1(String nomparent1) {
        this.nomparent1 = nomparent1;
    }

    public String getTelparent1() {
        return telparent1;
    }

    public void setTelparent1(String telparent1) {
        this.telparent1 = telparent1;
    }

    public String getNomparent2() {
        return nomparent2;
    }

    public void setNomparent2(String nomparent2) {
        this.nomparent2 = nomparent2;
    }

    public String getTelparent2() {
        return telparent2;
    }

    public void setTelparent2(String telparent2) {
        this.telparent2 = telparent2;
    }

    public Date getDatepreins() {
        return datepreins;
    }

    public void setDatepreins(Date datepreins) {
        this.datepreins = datepreins;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    public String getEtatpreins() {
        return etatpreins;
    }

    public void setEtatpreins(String etatpreins) {
        this.etatpreins = etatpreins;
    }

    public Boolean getPaye() {
        return paye;
    }

    public void setPaye(Boolean paye) {
        this.paye = paye;
    }

    public Date getDatepaiement() {
        return datepaiement;
    }

    public void setDatepaiement(Date datepaiement) {
        this.datepaiement = datepaiement;
    }

    public String getRendezvouspaiement() {
        return rendezvouspaiement;
    }

    public void setRendezvouspaiement(String rendezvouspaiement) {
        this.rendezvouspaiement = rendezvouspaiement;
    }

    public String getTypepaiement() {
        return typepaiement;
    }

    public void setTypepaiement(String typepaiement) {
        this.typepaiement = typepaiement;
    }

    public String getRendezvousdepotdossier() {
        return rendezvousdepotdossier;
    }

    public void setRendezvousdepotdossier(String rendezvousdepotdossier) {
        this.rendezvousdepotdossier = rendezvousdepotdossier;
    }

    public Boolean getSelectionner() {
        return selectionner;
    }

    public void setSelectionner(Boolean selectionner) {
        this.selectionner = selectionner;
    }

    public Boolean getGenerer() {
        return generer;
    }

    public void setGenerer(Boolean generer) {
        this.generer = generer;
    }

    public String getEtapeaccorde() {
        return etapeaccorde;
    }

    public void setEtapeaccorde(String etapeaccorde) {
        this.etapeaccorde = etapeaccorde;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getCentredexamen() {
        return centredexamen;
    }

    public void setCentredexamen(String centredexamen) {
        this.centredexamen = centredexamen;
    }

    public String getNumcni() {
        return numcni;
    }

    public void setNumcni(String numcni) {
        this.numcni = numcni;
    }

    public String getEmailpersonneacontacter() {
        return emailpersonneacontacter;
    }

    public void setEmailpersonneacontacter(String emailpersonneacontacter) {
        this.emailpersonneacontacter = emailpersonneacontacter;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    //@XmlTransient
    public List<MessagePreins> getMessagePreinsList() {
        return messagePreinsList;
    }

    public void setMessagePreinsList(List<MessagePreins> messagePreinsList) {
        this.messagePreinsList = messagePreinsList;
    }

    //@XmlTransient
    public List<PreinsDiplome> getPreinsDiplomeList() {
        return preinsDiplomeList;
    }

    public void setPreinsDiplomeList(List<PreinsDiplome> preinsDiplomeList) {
        this.preinsDiplomeList = preinsDiplomeList;
    }

    //@XmlTransient
    public List<PreinsMatiere> getPreinsMatiereList() {
        return preinsMatiereList;
    }

    public void setPreinsMatiereList(List<PreinsMatiere> preinsMatiereList) {
        this.preinsMatiereList = preinsMatiereList;
    }

    public Cycles getCycles() {
        return cycles;
    }

    public void setCycles(Cycles cycles) {
        this.cycles = cycles;
    }

    public DepartementGeographique getDepartementgeographique() {
        return departementgeographique;
    }

    public void setDepartementgeographique(DepartementGeographique departementgeographique) {
        this.departementgeographique = departementgeographique;
    }

    public Diplomes getDiplomeadmission() {
        return diplomeadmission;
    }

    public void setDiplomeadmission(Diplomes diplomeadmission) {
        this.diplomeadmission = diplomeadmission;
    }

    public Ecole getEcole() {
        return ecole;
    }

    public void setEcole(Ecole ecole) {
        this.ecole = ecole;
    }

    public Filiere getChoixformation1() {
        return choixformation1;
    }

    public void setChoixformation1(Filiere choixformation1) {
        this.choixformation1 = choixformation1;
    }

    public TypeBacc getTypebacc() {
        return typebacc;
    }

    public void setTypebacc(TypeBacc typebacc) {
        this.typebacc = typebacc;
    }

    public Filiere getChoixformation2() {
        return choixformation2;
    }

    public void setChoixformation2(Filiere choixformation2) {
        this.choixformation2 = choixformation2;
    }

    public Loisirs getLoisir1() {
        return loisir1;
    }

    public void setLoisir1(Loisirs loisir1) {
        this.loisir1 = loisir1;
    }

    public Sports getSport1() {
        return sport1;
    }

    public void setSport1(Sports sport1) {
        this.sport1 = sport1;
    }

    public Pays getPaysnationalite() {
        return paysnationalite;
    }

    public void setPaysnationalite(Pays paysnationalite) {
        this.paysnationalite = paysnationalite;
    }

    public Sports getSport2() {
        return sport2;
    }

    public void setSport2(Sports sport2) {
        this.sport2 = sport2;
    }

    public Mentions getMention() {
        return mention;
    }

    public void setMention(Mentions mention) {
        this.mention = mention;
    }

    public Filiere getChoixformation3() {
        return choixformation3;
    }

    public void setChoixformation3(Filiere choixformation3) {
        this.choixformation3 = choixformation3;
    }

    public Handicaps getTypehandicap() {
        return typehandicap;
    }

    public void setTypehandicap(Handicaps typehandicap) {
        this.typehandicap = typehandicap;
    }

    public Langues getLang2() {
        return lang2;
    }

    public void setLang2(Langues lang2) {
        this.lang2 = lang2;
    }

    public Langues getLang1() {
        return lang1;
    }

    public void setLang1(Langues lang1) {
        this.lang1 = lang1;
    }

    public Loisirs getLoisir2() {
        return loisir2;
    }

    public void setLoisir2(Loisirs loisir2) {
        this.loisir2 = loisir2;
    }

    public Pays getPaysobtentiondipl() {
        return paysobtentiondipl;
    }

    public void setPaysobtentiondipl(Pays paysobtentiondipl) {
        this.paysobtentiondipl = paysobtentiondipl;
    }

    public TypeFormation getTypeformation() {
        return typeformation;
    }

    public void setTypeformation(TypeFormation typeformation) {
        this.typeformation = typeformation;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpreins != null ? idpreins.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Preinscription)) {
            return false;
        }
        Preinscription other = (Preinscription) object;
        return !((this.idpreins == null && other.idpreins != null) || (this.idpreins != null && !this.idpreins.equals(other.idpreins)));
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Preinscription[ idpreins=" + idpreins + " ]";
    }

    public Boolean getTaf() {
        return taf;
    }

    public void setTaf(Boolean taf) {
        this.taf = taf;
    }

    public Boolean getActivitesportivecom() {
        return activitesportivecom;
    }

    public void setActivitesportivecom(Boolean activitesportivecom) {
        this.activitesportivecom = activitesportivecom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
}
