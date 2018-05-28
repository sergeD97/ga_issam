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
@Table(name = "departement_geographique")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DepartementGeographique.findAll", query = "SELECT d FROM DepartementGeographique d"),
    @NamedQuery(name = "DepartementGeographique.findByCodedepartementgeographique", query = "SELECT d FROM DepartementGeographique d WHERE d.codedepartementgeographique = :codedepartementgeographique"),
    @NamedQuery(name = "DepartementGeographique.findByIdregion", query = "SELECT d FROM DepartementGeographique d WHERE d.idregion = :idregion"),
    @NamedQuery(name = "DepartementGeographique.findByLibelledepartementgeographiquelangue1", query = "SELECT d FROM DepartementGeographique d WHERE d.libelledepartementgeographiquelangue1 = :libelledepartementgeographiquelangue1"),
    @NamedQuery(name = "DepartementGeographique.findByLibelledepartementgeographiquelangue2", query = "SELECT d FROM DepartementGeographique d WHERE d.libelledepartementgeographiquelangue2 = :libelledepartementgeographiquelangue2")})
public class DepartementGeographique implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "codedepartementgeographique")
    private String codedepartementgeographique;
    @Size(max = 2147483647)
    @Column(name = "idregion")
    private String idregion;
    @Size(max = 2147483647)
    @Column(name = "libelledepartementgeographiquelangue1")
    private String libelledepartementgeographiquelangue1;
    @Size(max = 2147483647)
    @Column(name = "libelledepartementgeographiquelangue2")
    private String libelledepartementgeographiquelangue2;
    @OneToMany(mappedBy = "departementgeographique")
    private List<Preinscription> preinscriptionList;

    public DepartementGeographique() {
    }

    public DepartementGeographique(String codedepartementgeographique) {
        this.codedepartementgeographique = codedepartementgeographique;
    }

    public String getCodedepartementgeographique() {
        return codedepartementgeographique;
    }

    public void setCodedepartementgeographique(String codedepartementgeographique) {
        this.codedepartementgeographique = codedepartementgeographique;
    }

    public String getIdregion() {
        return idregion;
    }

    public void setIdregion(String idregion) {
        this.idregion = idregion;
    }

    public String getLibelledepartementgeographiquelangue1() {
        return libelledepartementgeographiquelangue1;
    }

    public void setLibelledepartementgeographiquelangue1(String libelledepartementgeographiquelangue1) {
        this.libelledepartementgeographiquelangue1 = libelledepartementgeographiquelangue1;
    }

    public String getLibelledepartementgeographiquelangue2() {
        return libelledepartementgeographiquelangue2;
    }

    public void setLibelledepartementgeographiquelangue2(String libelledepartementgeographiquelangue2) {
        this.libelledepartementgeographiquelangue2 = libelledepartementgeographiquelangue2;
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
        hash += (codedepartementgeographique != null ? codedepartementgeographique.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DepartementGeographique)) {
            return false;
        }
        DepartementGeographique other = (DepartementGeographique) object;
        if ((this.codedepartementgeographique == null && other.codedepartementgeographique != null) || (this.codedepartementgeographique != null && !this.codedepartementgeographique.equals(other.codedepartementgeographique))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.DepartementGeographique[ codedepartementgeographique=" + codedepartementgeographique + " ]";
    }
    
}
