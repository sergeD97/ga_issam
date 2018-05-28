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
@Table(name = "diplomes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Diplomes.findAll", query = "SELECT d FROM Diplomes d"),
    @NamedQuery(name = "Diplomes.findByIddiplome", query = "SELECT d FROM Diplomes d WHERE d.iddiplome = :iddiplome"),
    @NamedQuery(name = "Diplomes.findByLibellefr", query = "SELECT d FROM Diplomes d WHERE d.libellefr = :libellefr"),
    @NamedQuery(name = "Diplomes.findByLibelleen", query = "SELECT d FROM Diplomes d WHERE d.libelleen = :libelleen"),
    @NamedQuery(name = "Diplomes.findByAnnuler", query = "SELECT d FROM Diplomes d WHERE d.annuler = :annuler")})
public class Diplomes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "iddiplome")
    private String iddiplome;
    @Size(max = 130)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 130)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "diplomes")
    private List<PreinsDiplome> preinsDiplomeList;
    @OneToMany(mappedBy = "diplomeadmission")
    private List<Preinscription> preinscriptionList;

    public Diplomes() {
    }

    public Diplomes(String iddiplome) {
        this.iddiplome = iddiplome;
    }

    public String getIddiplome() {
        return iddiplome;
    }

    public void setIddiplome(String iddiplome) {
        this.iddiplome = iddiplome;
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
    public List<PreinsDiplome> getPreinsDiplomeList() {
        return preinsDiplomeList;
    }

    public void setPreinsDiplomeList(List<PreinsDiplome> preinsDiplomeList) {
        this.preinsDiplomeList = preinsDiplomeList;
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
        hash += (iddiplome != null ? iddiplome.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Diplomes)) {
            return false;
        }
        Diplomes other = (Diplomes) object;
        if ((this.iddiplome == null && other.iddiplome != null) || (this.iddiplome != null && !this.iddiplome.equals(other.iddiplome))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Diplomes[ iddiplome=" + iddiplome + " ]";
    }
    
}
