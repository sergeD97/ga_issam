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
@Table(name = "type_formation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeFormation.findAll", query = "SELECT t FROM TypeFormation t"),
    @NamedQuery(name = "TypeFormation.findByIdformation", query = "SELECT t FROM TypeFormation t WHERE t.idformation = :idformation"),
    @NamedQuery(name = "TypeFormation.findByLibelleFr", query = "SELECT t FROM TypeFormation t WHERE t.libelleFr = :libelleFr")})
public class TypeFormation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "idformation")
    private String idformation;
    @Size(max = 2147483647)
    @Column(name = "libelle_fr")
    private String libelleFr;
    @OneToMany(mappedBy = "typeformation")
    private List<Filiere> filiereList;
    @OneToMany(mappedBy = "typeformation")
    private List<Preinscription> preinscriptionList;

    public TypeFormation() {
    }

    public TypeFormation(String idformation) {
        this.idformation = idformation;
    }

    public String getIdformation() {
        return idformation;
    }

    public void setIdformation(String idformation) {
        this.idformation = idformation;
    }

    public String getLibelleFr() {
        return libelleFr;
    }

    public void setLibelleFr(String libelleFr) {
        this.libelleFr = libelleFr;
    }

    @XmlTransient
    public List<Filiere> getFiliereList() {
        return filiereList;
    }

    public void setFiliereList(List<Filiere> filiereList) {
        this.filiereList = filiereList;
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
        hash += (idformation != null ? idformation.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypeFormation)) {
            return false;
        }
        TypeFormation other = (TypeFormation) object;
        if ((this.idformation == null && other.idformation != null) || (this.idformation != null && !this.idformation.equals(other.idformation))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.TypeFormation[ idformation=" + idformation + " ]";
    }
    
}
