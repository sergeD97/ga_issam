/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "preins_matiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreinsMatiere.findAll", query = "SELECT p FROM PreinsMatiere p"),
    @NamedQuery(name = "PreinsMatiere.findByIdmatiere", query = "SELECT p FROM PreinsMatiere p WHERE p.preinsMatierePK.idmatiere = :idmatiere"),
    @NamedQuery(name = "PreinsMatiere.findByIdpreins", query = "SELECT p FROM PreinsMatiere p WHERE p.preinsMatierePK.idpreins = :idpreins"),
    @NamedQuery(name = "PreinsMatiere.findByNoteOuGrade", query = "SELECT p FROM PreinsMatiere p WHERE p.noteOuGrade = :noteOuGrade"),
    @NamedQuery(name = "PreinsMatiere.findByAnnuler", query = "SELECT p FROM PreinsMatiere p WHERE p.annuler = :annuler")})
public class PreinsMatiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PreinsMatierePK preinsMatierePK;
    @Size(max = 2147483647)
    @Column(name = "note_ou_grade")
    private String noteOuGrade;
    @Column(name = "annuler")
    private Boolean annuler;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Matieres matieres;
    @JoinColumn(name = "idpreins", referencedColumnName = "idpreins", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Preinscription preinscription;

    public PreinsMatiere() {
    }

    public PreinsMatiere(PreinsMatierePK preinsMatierePK) {
        this.preinsMatierePK = preinsMatierePK;
    }

    public PreinsMatiere(String idmatiere, long idpreins) {
        this.preinsMatierePK = new PreinsMatierePK(idmatiere, idpreins);
    }
    
    public PreinsMatiere(String note, Matieres mat) {
        this.preinsMatierePK = new PreinsMatierePK();
        this.preinsMatierePK.setIdmatiere(mat.getIdmatiere());
        this.noteOuGrade= note;
        this.matieres = mat;
    }

    public PreinsMatierePK getPreinsMatierePK() {
        return preinsMatierePK;
    }

    public void setPreinsMatierePK(PreinsMatierePK preinsMatierePK) {
        this.preinsMatierePK = preinsMatierePK;
    }

    public String getNoteOuGrade() {
        return noteOuGrade;
    }

    public void setNoteOuGrade(String noteOuGrade) {
        this.noteOuGrade = noteOuGrade;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    public Matieres getMatieres() {
        return matieres;
    }

    public void setMatieres(Matieres matieres) {
        this.matieres = matieres;
    }

    public Preinscription getPreinscription() {
        return preinscription;
    }

    public void setPreinscription(Preinscription preinscription) {
        this.preinscription = preinscription;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (preinsMatierePK != null ? preinsMatierePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreinsMatiere)) {
            return false;
        }
        PreinsMatiere other = (PreinsMatiere) object;
        if ((this.preinsMatierePK == null && other.preinsMatierePK != null) || (this.preinsMatierePK != null && !this.preinsMatierePK.equals(other.preinsMatierePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.PreinsMatiere[ preinsMatierePK=" + preinsMatierePK + " ]";
    }
    
}
