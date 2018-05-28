/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "enseignant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Enseignant.findAll", query = "SELECT e FROM Enseignant e"),
    @NamedQuery(name = "Enseignant.findByMatricule", query = "SELECT e FROM Enseignant e WHERE e.matricule = :matricule"),
    @NamedQuery(name = "Enseignant.findByNom", query = "SELECT e FROM Enseignant e WHERE e.nom = :nom"),
    @NamedQuery(name = "Enseignant.findByActif", query = "SELECT e FROM Enseignant e WHERE e.actif = :actif"),
    @NamedQuery(name = "Enseignant.findByNfinger1", query = "SELECT e FROM Enseignant e WHERE e.nfinger1 = :nfinger1"),
    @NamedQuery(name = "Enseignant.findByFinger1", query = "SELECT e FROM Enseignant e WHERE e.finger1 = :finger1"),
    @NamedQuery(name = "Enseignant.findByNfinger2", query = "SELECT e FROM Enseignant e WHERE e.nfinger2 = :nfinger2"),
    @NamedQuery(name = "Enseignant.findByFinger2", query = "SELECT e FROM Enseignant e WHERE e.finger2 = :finger2"),
    @NamedQuery(name = "Enseignant.findByCni", query = "SELECT e FROM Enseignant e WHERE e.cni = :cni"),
    @NamedQuery(name = "Enseignant.findByTelephone", query = "SELECT e FROM Enseignant e WHERE e.telephone = :telephone"),
    @NamedQuery(name = "Enseignant.findByMail", query = "SELECT e FROM Enseignant e WHERE e.mail = :mail"),
    @NamedQuery(name = "Enseignant.findByPhoto", query = "SELECT e FROM Enseignant e WHERE e.photo = :photo"),
    @NamedQuery(name = "Enseignant.findByPwd", query = "SELECT e FROM Enseignant e WHERE e.pwd = :pwd")})
public class Enseignant implements Serializable {

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
    @Column(name = "actif")
    private Boolean actif;
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
    @Size(max = 2147483647)
    @Column(name = "cni")
    private String cni;
    @Size(max = 2147483647)
    @Column(name = "telephone")
    private String telephone;
    @Size(max = 2147483647)
    @Column(name = "mail")
    private String mail;
    @Size(max = 2147483647)
    @Column(name = "photo")
    private String photo;
    @Size(max = 2147483647)
    @Column(name = "pwd")
    private String pwd;

    public Enseignant() {
    }

    public Enseignant(String matricule) {
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

    public Boolean getActif() {
        return actif;
    }

    public void setActif(Boolean actif) {
        this.actif = actif;
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

    public String getCni() {
        return cni;
    }

    public void setCni(String cni) {
        this.cni = cni;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
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
        if (!(object instanceof Enseignant)) {
            return false;
        }
        Enseignant other = (Enseignant) object;
        if ((this.matricule == null && other.matricule != null) || (this.matricule != null && !this.matricule.equals(other.matricule))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Enseignant[ matricule=" + matricule + " ]";
    }
    
}
