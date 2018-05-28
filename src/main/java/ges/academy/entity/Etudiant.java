/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "etudiant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Etudiant.findAll", query = "SELECT e FROM Etudiant e"),
    @NamedQuery(name = "Etudiant.findByMatricule", query = "SELECT e FROM Etudiant e WHERE e.matricule = :matricule"),
    @NamedQuery(name = "Etudiant.findByNom", query = "SELECT e FROM Etudiant e WHERE e.nom = :nom"),
    @NamedQuery(name = "Etudiant.findByDatenaiss", query = "SELECT e FROM Etudiant e WHERE e.datenaiss = :datenaiss"),
    @NamedQuery(name = "Etudiant.findByLieunaiss", query = "SELECT e FROM Etudiant e WHERE e.lieunaiss = :lieunaiss"),
    @NamedQuery(name = "Etudiant.findByCni", query = "SELECT e FROM Etudiant e WHERE e.cni = :cni"),
    @NamedQuery(name = "Etudiant.findByMail", query = "SELECT e FROM Etudiant e WHERE e.mail = :mail"),
    @NamedQuery(name = "Etudiant.findByNfinger1", query = "SELECT e FROM Etudiant e WHERE e.nfinger1 = :nfinger1"),
    @NamedQuery(name = "Etudiant.findByFinger1", query = "SELECT e FROM Etudiant e WHERE e.finger1 = :finger1"),
    @NamedQuery(name = "Etudiant.findByNfinger2", query = "SELECT e FROM Etudiant e WHERE e.nfinger2 = :nfinger2"),
    @NamedQuery(name = "Etudiant.findByFinger2", query = "SELECT e FROM Etudiant e WHERE e.finger2 = :finger2"),
    @NamedQuery(name = "Etudiant.findByAnnuler", query = "SELECT e FROM Etudiant e WHERE e.annuler = :annuler"),
    @NamedQuery(name = "Etudiant.findByPhoto", query = "SELECT e FROM Etudiant e WHERE e.photo = :photo"),
    @NamedQuery(name = "Etudiant.findByTelephone", query = "SELECT e FROM Etudiant e WHERE e.telephone = :telephone"),
    @NamedQuery(name = "Etudiant.findByPwd", query = "SELECT e FROM Etudiant e WHERE e.pwd = :pwd")})
public class Etudiant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "matricule")
    private String matricule;
    @Size(max = 2147483647)
    @Column(name = "nom")
    private String nom;
    @Size(max = 2147483647)
    @Column(name = "datenaiss")
    private String datenaiss;
    @Size(max = 2147483647)
    @Column(name = "lieunaiss")
    private String lieunaiss;
    @Size(max = 2147483647)
    @Column(name = "cni")
    private String cni;
    @Size(max = 2147483647)
    @Column(name = "mail")
    private String mail;
    @Column(name = "nfinger1")
    private Integer nfinger1;
    @Size(max = 2147483647)
    @Column(name = "finger1")
    private String finger1;
    @Column(name = "nfinger2")
    private Integer nfinger2;
    @Size(max = 2147483647)
    @Column(name = "finger2")
    private String finger2;
    @Column(name = "annuler")
    private Boolean annuler;
    @Size(max = 2147483647)
    @Column(name = "photo")
    private String photo;
    @Size(max = 2147483647)
    @Column(name = "telephone")
    private String telephone;
    @Size(max = 2147483647)
    @Column(name = "pwd")
    private String pwd;
    @OneToMany(mappedBy = "idetudiant")
    private List<Message> messageList;

    public Etudiant() {
    }

    public Etudiant(String matricule) {
        this.matricule = matricule;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(String datenaiss) {
        this.datenaiss = datenaiss;
    }

    public String getLieunaiss() {
        return lieunaiss;
    }

    public void setLieunaiss(String lieunaiss) {
        this.lieunaiss = lieunaiss;
    }

    public String getCni() {
        return cni;
    }

    public void setCni(String cni) {
        this.cni = cni;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Integer getNfinger1() {
        return nfinger1;
    }

    public void setNfinger1(Integer nfinger1) {
        this.nfinger1 = nfinger1;
    }

    public String getFinger1() {
        return finger1;
    }

    public void setFinger1(String finger1) {
        this.finger1 = finger1;
    }

    public Integer getNfinger2() {
        return nfinger2;
    }

    public void setNfinger2(Integer nfinger2) {
        this.nfinger2 = nfinger2;
    }

    public String getFinger2() {
        return finger2;
    }

    public void setFinger2(String finger2) {
        this.finger2 = finger2;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @XmlTransient
    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (matricule != null ? matricule.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Etudiant)) {
            return false;
        }
        Etudiant other = (Etudiant) object;
        if ((this.matricule == null && other.matricule != null) || (this.matricule != null && !this.matricule.equals(other.matricule))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Etudiant[ matricule=" + matricule + " ]";
    }
    
}
