/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
@Table(name = "cycles")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cycles.findAll", query = "SELECT c FROM Cycles c"),
    @NamedQuery(name = "Cycles.findByIdcycle", query = "SELECT c FROM Cycles c WHERE c.idcycle = :idcycle"),
    @NamedQuery(name = "Cycles.findByLibelle", query = "SELECT c FROM Cycles c WHERE c.libelle = :libelle"),
    @NamedQuery(name = "Cycles.findByAnnuler", query = "SELECT c FROM Cycles c WHERE c.annuler = :annuler")})
public class Cycles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "idcycle")
    private String idcycle;
    @Size(max = 10)
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "cycles")
    private List<Filiere> filiereList;
    @OneToMany(mappedBy = "cycles")
    private List<Preinscription> preinscriptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codeCycle")
    private List<Niveau> niveauList;

    public Cycles() {
    }

    public Cycles(String idcycle) {
        this.idcycle = idcycle;
    }

    public String getIdcycle() {
        return idcycle;
    }

    public void setIdcycle(String idcycle) {
        this.idcycle = idcycle;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
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

    @XmlTransient
    public List<Niveau> getNiveauList() {
        return niveauList;
    }

    public void setNiveauList(List<Niveau> niveauList) {
        this.niveauList = niveauList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcycle != null ? idcycle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cycles)) {
            return false;
        }
        Cycles other = (Cycles) object;
        if ((this.idcycle == null && other.idcycle != null) || (this.idcycle != null && !this.idcycle.equals(other.idcycle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Cycles[ idcycle=" + idcycle + " ]";
    }
    
}
