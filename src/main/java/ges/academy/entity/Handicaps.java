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
@Table(name = "handicaps")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Handicaps.findAll", query = "SELECT h FROM Handicaps h"),
    @NamedQuery(name = "Handicaps.findByIdhandicap", query = "SELECT h FROM Handicaps h WHERE h.idhandicap = :idhandicap"),
    @NamedQuery(name = "Handicaps.findByLibellefr", query = "SELECT h FROM Handicaps h WHERE h.libellefr = :libellefr"),
    @NamedQuery(name = "Handicaps.findByLibelleen", query = "SELECT h FROM Handicaps h WHERE h.libelleen = :libelleen"),
    @NamedQuery(name = "Handicaps.findByAnnuler", query = "SELECT h FROM Handicaps h WHERE h.annuler = :annuler")})
public class Handicaps implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idhandicap")
    private String idhandicap;
    @Size(max = 30)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 30)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "typehandicap")
    private List<Preinscription> preinscriptionList;

    public Handicaps() {
    }

    public Handicaps(String idhandicap) {
        this.idhandicap = idhandicap;
    }

    public String getIdhandicap() {
        return idhandicap;
    }

    public void setIdhandicap(String idhandicap) {
        this.idhandicap = idhandicap;
    }

    public String getLibellefr() {
        return libellefr;
    }

    public void setLibellefr(String libellefr) {
        this.libellefr = libellefr;
    }

    public String getLibelleen() {
        return libelleen;
    }

    public void setLibelleen(String libelleen) {
        this.libelleen = libelleen;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
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
        hash += (idhandicap != null ? idhandicap.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Handicaps)) {
            return false;
        }
        Handicaps other = (Handicaps) object;
        if ((this.idhandicap == null && other.idhandicap != null) || (this.idhandicap != null && !this.idhandicap.equals(other.idhandicap))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Handicaps[ idhandicap=" + idhandicap + " ]";
    }
    
}
