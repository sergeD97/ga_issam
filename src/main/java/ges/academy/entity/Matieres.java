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
@Table(name = "matieres")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Matieres.findAll", query = "SELECT m FROM Matieres m"),
    @NamedQuery(name = "Matieres.findByIdmatiere", query = "SELECT m FROM Matieres m WHERE m.idmatiere = :idmatiere"),
    @NamedQuery(name = "Matieres.findByLibellefr", query = "SELECT m FROM Matieres m WHERE m.libellefr = :libellefr"),
    @NamedQuery(name = "Matieres.findByLibelleen", query = "SELECT m FROM Matieres m WHERE m.libelleen = :libelleen"),
    @NamedQuery(name = "Matieres.findByAnnuler", query = "SELECT m FROM Matieres m WHERE m.annuler = :annuler")})
public class Matieres implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idmatiere")
    private String idmatiere;
    @Size(max = 50)
    @Column(name = "libellefr")
    private String libellefr;
    @Size(max = 50)
    @Column(name = "libelleen")
    private String libelleen;
    @Column(name = "annuler")
    private Boolean annuler;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matieres")
    private List<PreinsMatiere> preinsMatiereList;

    public Matieres() {
    }

    public Matieres(String idmatiere) {
        this.idmatiere = idmatiere;
    }

    public String getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(String idmatiere) {
        this.idmatiere = idmatiere;
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
    public List<PreinsMatiere> getPreinsMatiereList() {
        return preinsMatiereList;
    }

    public void setPreinsMatiereList(List<PreinsMatiere> preinsMatiereList) {
        this.preinsMatiereList = preinsMatiereList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatiere != null ? idmatiere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Matieres)) {
            return false;
        }
        Matieres other = (Matieres) object;
        if ((this.idmatiere == null && other.idmatiere != null) || (this.idmatiere != null && !this.idmatiere.equals(other.idmatiere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Matieres[ idmatiere=" + idmatiere + " ]";
    }
    
}
