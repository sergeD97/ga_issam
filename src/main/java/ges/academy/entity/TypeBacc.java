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
@Table(name = "type_bacc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeBacc.findAll", query = "SELECT t FROM TypeBacc t"),
    @NamedQuery(name = "TypeBacc.findByIdtypebacc", query = "SELECT t FROM TypeBacc t WHERE t.idtypebacc = :idtypebacc"),
    @NamedQuery(name = "TypeBacc.findByLibellefr", query = "SELECT t FROM TypeBacc t WHERE t.libellefr = :libellefr"),
    @NamedQuery(name = "TypeBacc.findByLibelleen", query = "SELECT t FROM TypeBacc t WHERE t.libelleen = :libelleen"),
    @NamedQuery(name = "TypeBacc.findByAnnuler", query = "SELECT t FROM TypeBacc t WHERE t.annuler = :annuler")})
public class TypeBacc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "idtypebacc")
    private String idtypebacc;
    @Size(max = 20)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 20)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "typebacc")
    private List<Preinscription> preinscriptionList;

    public TypeBacc() {
    }

    public TypeBacc(String idtypebacc) {
        this.idtypebacc = idtypebacc;
    }

    public String getIdtypebacc() {
        return idtypebacc;
    }

    public void setIdtypebacc(String idtypebacc) {
        this.idtypebacc = idtypebacc;
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
        hash += (idtypebacc != null ? idtypebacc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypeBacc)) {
            return false;
        }
        TypeBacc other = (TypeBacc) object;
        if ((this.idtypebacc == null && other.idtypebacc != null) || (this.idtypebacc != null && !this.idtypebacc.equals(other.idtypebacc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.TypeBacc[ idtypebacc=" + idtypebacc + " ]";
    }
    
}
