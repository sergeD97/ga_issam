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
@Table(name = "mentions")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mentions.findAll", query = "SELECT m FROM Mentions m"),
    @NamedQuery(name = "Mentions.findByIdmention", query = "SELECT m FROM Mentions m WHERE m.idmention = :idmention"),
    @NamedQuery(name = "Mentions.findByLibellefr", query = "SELECT m FROM Mentions m WHERE m.libellefr = :libellefr"),
    @NamedQuery(name = "Mentions.findByLibelleen", query = "SELECT m FROM Mentions m WHERE m.libelleen = :libelleen"),
    @NamedQuery(name = "Mentions.findByAnnuler", query = "SELECT m FROM Mentions m WHERE m.annuler = :annuler")})
public class Mentions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "idmention")
    private String idmention;
    @Size(max = 10)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 10)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(mappedBy = "mention")
    private List<Preinscription> preinscriptionList;

    public Mentions() {
    }

    public Mentions(String idmention) {
        this.idmention = idmention;
    }

    public String getIdmention() {
        return idmention;
    }

    public void setIdmention(String idmention) {
        this.idmention = idmention;
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
        hash += (idmention != null ? idmention.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mentions)) {
            return false;
        }
        Mentions other = (Mentions) object;
        if ((this.idmention == null && other.idmention != null) || (this.idmention != null && !this.idmention.equals(other.idmention))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Mentions[ idmention=" + idmention + " ]";
    }
    
}
