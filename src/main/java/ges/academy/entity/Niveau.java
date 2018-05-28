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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "niveau")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Niveau.findAll", query = "SELECT n FROM Niveau n"),
    @NamedQuery(name = "Niveau.findByCodeNiveau", query = "SELECT n FROM Niveau n WHERE n.codeNiveau = :codeNiveau"),
    @NamedQuery(name = "Niveau.findByLibelleNiveau", query = "SELECT n FROM Niveau n WHERE n.libelleNiveau = :libelleNiveau")})
public class Niveau implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "code_niveau")
    private String codeNiveau;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "libelle_niveau")
    private String libelleNiveau;
    @JoinColumn(name = "code_cycle", referencedColumnName = "idcycle")
    @ManyToOne(optional = false)
    private Cycles codeCycle;

    public Niveau() {
    }

    public Niveau(String codeNiveau) {
        this.codeNiveau = codeNiveau;
    }

    public Niveau(String codeNiveau, String libelleNiveau) {
        this.codeNiveau = codeNiveau;
        this.libelleNiveau = libelleNiveau;
    }

    public String getCodeNiveau() {
        return codeNiveau;
    }

    public void setCodeNiveau(String codeNiveau) {
        this.codeNiveau = codeNiveau;
    }

    public String getLibelleNiveau() {
        return libelleNiveau;
    }

    public void setLibelleNiveau(String libelleNiveau) {
        this.libelleNiveau = libelleNiveau;
    }

    public Cycles getCodeCycle() {
        return codeCycle;
    }

    public void setCodeCycle(Cycles codeCycle) {
        this.codeCycle = codeCycle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codeNiveau != null ? codeNiveau.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Niveau)) {
            return false;
        }
        Niveau other = (Niveau) object;
        if ((this.codeNiveau == null && other.codeNiveau != null) || (this.codeNiveau != null && !this.codeNiveau.equals(other.codeNiveau))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Niveau[ codeNiveau=" + codeNiveau + " ]";
    }
    
}
