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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "ecole")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ecole.findAll", query = "SELECT e FROM Ecole e"),
    @NamedQuery(name = "Ecole.findByCodeecole", query = "SELECT e FROM Ecole e WHERE e.codeecole = :codeecole"),
    @NamedQuery(name = "Ecole.findByLibelefr", query = "SELECT e FROM Ecole e WHERE e.libelefr = :libelefr"),
    @NamedQuery(name = "Ecole.findByLibeleen", query = "SELECT e FROM Ecole e WHERE e.libeleen = :libeleen"),
    @NamedQuery(name = "Ecole.findByCodemat", query = "SELECT e FROM Ecole e WHERE e.codemat = :codemat"),
    @NamedQuery(name = "Ecole.findByDateouverture", query = "SELECT e FROM Ecole e WHERE e.dateouverture = :dateouverture"),
    @NamedQuery(name = "Ecole.findByDatefermeture", query = "SELECT e FROM Ecole e WHERE e.datefermeture = :datefermeture"),
    @NamedQuery(name = "Ecole.findByAnneeencours", query = "SELECT e FROM Ecole e WHERE e.anneeencours = :anneeencours"),
    @NamedQuery(name = "Ecole.findByAnnuler", query = "SELECT e FROM Ecole e WHERE e.annuler = :annuler")})
public class Ecole implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "codeecole")
    private String codeecole;
    @Size(max = 2147483647)
    @Column(name = "libelefr")
    private String libelefr;
    @Size(max = 2147483647)
    @Column(name = "libeleen")
    private String libeleen;
    @Size(max = 2147483647)
    @Column(name = "codemat")
    private String codemat;
    @Column(name = "dateouverture")
    @Temporal(TemporalType.DATE)
    private Date dateouverture;
    @Column(name = "datefermeture")
    @Temporal(TemporalType.DATE)
    private Date datefermeture;
    @Size(max = 2147483647)
    @Column(name = "anneeencours")
    private String anneeencours;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "ecole")
    private List<Filiere> filiereList;
    @OneToMany(mappedBy = "ecole")
    private List<Preinscription> preinscriptionList;

    public Ecole() {
    }

    public Ecole(String codeecole) {
        this.codeecole = codeecole;
    }

    public String getCodeecole() {
        return codeecole;
    }

    public void setCodeecole(String codeecole) {
        this.codeecole = codeecole;
    }

    public String getLibelefr() {
        return libelefr;
    }

    public void setLibelefr(String libelefr) {
        this.libelefr = libelefr;
    }

    public String getLibeleen() {
        return libeleen;
    }

    public void setLibeleen(String libeleen) {
        this.libeleen = libeleen;
    }

    public String getCodemat() {
        return codemat;
    }

    public void setCodemat(String codemat) {
        this.codemat = codemat;
    }

    public Date getDateouverture() {
        return dateouverture;
    }

    public void setDateouverture(Date dateouverture) {
        this.dateouverture = dateouverture;
    }

    public Date getDatefermeture() {
        return datefermeture;
    }

    public void setDatefermeture(Date datefermeture) {
        this.datefermeture = datefermeture;
    }

    public String getAnneeencours() {
        return anneeencours;
    }

    public void setAnneeencours(String anneeencours) {
        this.anneeencours = anneeencours;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    @XmlTransient
    public List<Filiere> getFiliereList() {
        return filiereList;
    }

    public void setFiliereList(List<Filiere> filiereList) {
        this.filiereList = filiereList;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList() {
        return preinscriptionList;
    }

    public void setPreinscriptionList(List<Preinscription> preinscriptionList) {
        this.preinscriptionList = preinscriptionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codeecole != null ? codeecole.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ecole)) {
            return false;
        }
        Ecole other = (Ecole) object;
        if ((this.codeecole == null && other.codeecole != null) || (this.codeecole != null && !this.codeecole.equals(other.codeecole))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Ecole[ codeecole=" + codeecole + " ]";
    }
    
}
