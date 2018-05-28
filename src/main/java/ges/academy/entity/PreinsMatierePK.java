/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Medjignia jelly roll
 */
@Embeddable
public class PreinsMatierePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "idmatiere")
    private String idmatiere;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpreins")
    private long idpreins;

    public PreinsMatierePK() {
    }

    public PreinsMatierePK(String idmatiere, long idpreins) {
        this.idmatiere = idmatiere;
        this.idpreins = idpreins;
    }

    public String getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(String idmatiere) {
        this.idmatiere = idmatiere;
    }

    public long getIdpreins() {
        return idpreins;
    }

    public void setIdpreins(long idpreins) {
        this.idpreins = idpreins;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatiere != null ? idmatiere.hashCode() : 0);
        hash += (int) idpreins;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreinsMatierePK)) {
            return false;
        }
        PreinsMatierePK other = (PreinsMatierePK) object;
        if ((this.idmatiere == null && other.idmatiere != null) || (this.idmatiere != null && !this.idmatiere.equals(other.idmatiere))) {
            return false;
        }
        if (this.idpreins != other.idpreins) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.PreinsMatierePK[ idmatiere=" + idmatiere + ", idpreins=" + idpreins + " ]";
    }
    
}
