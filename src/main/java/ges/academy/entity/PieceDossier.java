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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "piece_dossier")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PieceDossier.findAll", query = "SELECT p FROM PieceDossier p"),
    @NamedQuery(name = "PieceDossier.findByIdpiece", query = "SELECT p FROM PieceDossier p WHERE p.idpiece = :idpiece"),
    @NamedQuery(name = "PieceDossier.findByLibele", query = "SELECT p FROM PieceDossier p WHERE p.libele = :libele")})
public class PieceDossier implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpiece")
    private Integer idpiece;
    @Size(max = 2147483647)
    @Column(name = "libele")
    private String libele;
    @JoinColumn(name = "codefiliere", referencedColumnName = "codefilere")
    @ManyToOne
    private Filiere codefiliere;

    public PieceDossier() {
    }

    public PieceDossier(Integer idpiece) {
        this.idpiece = idpiece;
    }

    public Integer getIdpiece() {
        return idpiece;
    }

    public void setIdpiece(Integer idpiece) {
        this.idpiece = idpiece;
    }

    public String getLibele() {
        return libele;
    }

    public void setLibele(String libele) {
        this.libele = libele;
    }

    public Filiere getCodefiliere() {
        return codefiliere;
    }

    public void setCodefiliere(Filiere codefiliere) {
        this.codefiliere = codefiliere;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpiece != null ? idpiece.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PieceDossier)) {
            return false;
        }
        PieceDossier other = (PieceDossier) object;
        if ((this.idpiece == null && other.idpiece != null) || (this.idpiece != null && !this.idpiece.equals(other.idpiece))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.PieceDossier[ idpiece=" + idpiece + " ]";
    }
    
}
