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
@Table(name = "sports")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sports.findAll", query = "SELECT s FROM Sports s"),
    @NamedQuery(name = "Sports.findByIdsport", query = "SELECT s FROM Sports s WHERE s.idsport = :idsport"),
    @NamedQuery(name = "Sports.findByLibellefr", query = "SELECT s FROM Sports s WHERE s.libellefr = :libellefr"),
    @NamedQuery(name = "Sports.findByLibelleen", query = "SELECT s FROM Sports s WHERE s.libelleen = :libelleen"),
    @NamedQuery(name = "Sports.findByAnnuler", query = "SELECT s FROM Sports s WHERE s.annuler = :annuler")})
public class Sports implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idsport")
    private String idsport;
    @Size(max = 100)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 100)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "sport1")
    private List<Preinscription> preinscriptionList;
    @OneToMany(mappedBy = "sport2")
    private List<Preinscription> preinscriptionList1;

    public Sports() {
    }

    public Sports(String idsport) {
        this.idsport = idsport;
    }

    public String getIdsport() {
        return idsport;
    }

    public void setIdsport(String idsport) {
        this.idsport = idsport;
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
        hash += (idsport != null ? idsport.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sports)) {
            return false;
        }
        Sports other = (Sports) object;
        if ((this.idsport == null && other.idsport != null) || (this.idsport != null && !this.idsport.equals(other.idsport))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Sports[ idsport=" + idsport + " ]";
    }
    
}
