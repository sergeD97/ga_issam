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
@Table(name = "region")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Region.findAll", query = "SELECT r FROM Region r"),
    @NamedQuery(name = "Region.findByCoderegion", query = "SELECT r FROM Region r WHERE r.coderegion = :coderegion"),
    @NamedQuery(name = "Region.findByCodepays", query = "SELECT r FROM Region r WHERE r.codepays = :codepays"),
    @NamedQuery(name = "Region.findByLibelleregionlangue1", query = "SELECT r FROM Region r WHERE r.libelleregionlangue1 = :libelleregionlangue1"),
    @NamedQuery(name = "Region.findByLibelleregionlangue2", query = "SELECT r FROM Region r WHERE r.libelleregionlangue2 = :libelleregionlangue2")})
public class Region implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "coderegion")
    private String coderegion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "codepays")
    private String codepays;
    @Size(max = 2147483647)
    @Column(name = "libelleregionlangue1")
    private String libelleregionlangue1;
    @Size(max = 2147483647)
    @Column(name = "libelleregionlangue2")
    private String libelleregionlangue2;
    @OneToMany(mappedBy = "region")
    private List<Preinscription> preinscriptionList;

    public Region() {
    }

    public Region(String coderegion) {
        this.coderegion = coderegion;
    }

    public Region(String coderegion, String codepays) {
        this.coderegion = coderegion;
        this.codepays = codepays;
    }

    public String getCoderegion() {
        return coderegion;
    }

    public void setCoderegion(String coderegion) {
        this.coderegion = coderegion;
    }

    public String getCodepays() {
        return codepays;
    }

    public void setCodepays(String codepays) {
        this.codepays = codepays;
    }

    public String getLibelleregionlangue1() {
        return libelleregionlangue1;
    }

    public void setLibelleregionlangue1(String libelleregionlangue1) {
        this.libelleregionlangue1 = libelleregionlangue1;
    }

    public String getLibelleregionlangue2() {
        return libelleregionlangue2;
    }

    public void setLibelleregionlangue2(String libelleregionlangue2) {
        this.libelleregionlangue2 = libelleregionlangue2;
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
        hash += (coderegion != null ? coderegion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Region)) {
            return false;
        }
        Region other = (Region) object;
        if ((this.coderegion == null && other.coderegion != null) || (this.coderegion != null && !this.coderegion.equals(other.coderegion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Region[ coderegion=" + coderegion + " ]";
    }
    
}
