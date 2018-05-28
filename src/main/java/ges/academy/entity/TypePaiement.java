/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "type_paiement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypePaiement.findAll", query = "SELECT t FROM TypePaiement t"),
    @NamedQuery(name = "TypePaiement.findByIdtypepaiement", query = "SELECT t FROM TypePaiement t WHERE t.idtypepaiement = :idtypepaiement"),
    @NamedQuery(name = "TypePaiement.findByLibelle", query = "SELECT t FROM TypePaiement t WHERE t.libelle = :libelle"),
    @NamedQuery(name = "TypePaiement.findByAnnuler", query = "SELECT t FROM TypePaiement t WHERE t.annuler = :annuler")})
public class TypePaiement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idtypepaiement")
    private String idtypepaiement;
    @Size(max = 40)
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "annuler")
    private Boolean annuler;

    public TypePaiement() {
    }

    public TypePaiement(String idtypepaiement) {
        this.idtypepaiement = idtypepaiement;
    }

    public String getIdtypepaiement() {
        return idtypepaiement;
    }

    public void setIdtypepaiement(String idtypepaiement) {
        this.idtypepaiement = idtypepaiement;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtypepaiement != null ? idtypepaiement.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypePaiement)) {
            return false;
        }
        TypePaiement other = (TypePaiement) object;
        if ((this.idtypepaiement == null && other.idtypepaiement != null) || (this.idtypepaiement != null && !this.idtypepaiement.equals(other.idtypepaiement))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.TypePaiement[ idtypepaiement=" + idtypepaiement + " ]";
    }
    
}
