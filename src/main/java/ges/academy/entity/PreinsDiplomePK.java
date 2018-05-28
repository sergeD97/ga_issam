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
public class PreinsDiplomePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "iddiplome")
    private String iddiplome;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpreins")
    private long idpreins;

    public PreinsDiplomePK() {
    }

    public PreinsDiplomePK(String iddiplome, long idpreins) {
        this.iddiplome = iddiplome;
        this.idpreins = idpreins;
    }

    public String getIddiplome() {
        return iddiplome;
    }

    public void setIddiplome(String iddiplome) {
        this.iddiplome = iddiplome;
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
        hash += (iddiplome != null ? iddiplome.hashCode() : 0);
        hash += (int) idpreins;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreinsDiplomePK)) {
            return false;
        }
        PreinsDiplomePK other = (PreinsDiplomePK) object;
        if ((this.iddiplome == null && other.iddiplome != null) || (this.iddiplome != null && !this.iddiplome.equals(other.iddiplome))) {
            return false;
        }
        if (this.idpreins != other.idpreins) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.PreinsDiplomePK[ iddiplome=" + iddiplome + ", idpreins=" + idpreins + " ]";
    }
    
}
