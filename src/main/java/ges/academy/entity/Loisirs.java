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
@Table(name = "loisirs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Loisirs.findAll", query = "SELECT l FROM Loisirs l"),
    @NamedQuery(name = "Loisirs.findByIdloisir", query = "SELECT l FROM Loisirs l WHERE l.idloisir = :idloisir"),
    @NamedQuery(name = "Loisirs.findByLibellefr", query = "SELECT l FROM Loisirs l WHERE l.libellefr = :libellefr"),
    @NamedQuery(name = "Loisirs.findByLibelleen", query = "SELECT l FROM Loisirs l WHERE l.libelleen = :libelleen"),
    @NamedQuery(name = "Loisirs.findByAnnuler", query = "SELECT l FROM Loisirs l WHERE l.annuler = :annuler")})
public class Loisirs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idloisir")
    private String idloisir;
    @Size(max = 50)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 50)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "loisir1")
    private List<Preinscription> preinscriptionList;
    @OneToMany(mappedBy = "loisir2")
    private List<Preinscription> preinscriptionList1;

    public Loisirs() {
    }

    public Loisirs(String idloisir) {
        this.idloisir = idloisir;
    }

    public String getIdloisir() {
        return idloisir;
    }

    public void setIdloisir(String idloisir) {
        this.idloisir = idloisir;
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
        hash += (idloisir != null ? idloisir.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Loisirs)) {
            return false;
        }
        Loisirs other = (Loisirs) object;
        if ((this.idloisir == null && other.idloisir != null) || (this.idloisir != null && !this.idloisir.equals(other.idloisir))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Loisirs[ idloisir=" + idloisir + " ]";
    }
    
}
