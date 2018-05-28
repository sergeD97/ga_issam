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
@Table(name = "pays")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pays.findAll", query = "SELECT p FROM Pays p"),
    @NamedQuery(name = "Pays.findByCodepays", query = "SELECT p FROM Pays p WHERE p.codepays = :codepays"),
    @NamedQuery(name = "Pays.findByLibelleEn", query = "SELECT p FROM Pays p WHERE p.libelleEn = :libelleEn"),
    @NamedQuery(name = "Pays.findByLibelleFr", query = "SELECT p FROM Pays p WHERE p.libelleFr = :libelleFr")})
public class Pays implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "codepays")
    private String codepays;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "libelle_en")
    private String libelleEn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "libelle_fr")
    private String libelleFr;
    @OneToMany(mappedBy = "paysnationalite")
    private List<Preinscription> preinscriptionList;
    @OneToMany(mappedBy = "paysobtentiondipl")
    private List<Preinscription> preinscriptionList1;

    public Pays() {
    }

    public Pays(String codepays) {
        this.codepays = codepays;
    }

    public Pays(String codepays, String libelleEn, String libelleFr) {
        this.codepays = codepays;
        this.libelleEn = libelleEn;
        this.libelleFr = libelleFr;
    }

    public String getCodepays() {
        return codepays;
    }

    public void setCodepays(String codepays) {
        this.codepays = codepays;
    }

    public String getLibelleEn() {
        return libelleEn;
    }

    public void setLibelleEn(String libelleEn) {
        this.libelleEn = libelleEn;
    }

    public String getLibelleFr() {
        return libelleFr;
    }

    public void setLibelleFr(String libelleFr) {
        this.libelleFr = libelleFr;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList() {
        return preinscriptionList;
    }

    public void setPreinscriptionList(List<Preinscription> preinscriptionList) {
        this.preinscriptionList = preinscriptionList;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList1() {
        return preinscriptionList1;
    }

    public void setPreinscriptionList1(List<Preinscription> preinscriptionList1) {
        this.preinscriptionList1 = preinscriptionList1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codepays != null ? codepays.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pays)) {
            return false;
        }
        Pays other = (Pays) object;
        if ((this.codepays == null && other.codepays != null) || (this.codepays != null && !this.codepays.equals(other.codepays))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return libelleFr;
    }
    
}
