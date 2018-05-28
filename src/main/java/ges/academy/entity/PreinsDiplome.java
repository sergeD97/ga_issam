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
@Table(name = "preins_diplome")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreinsDiplome.findAll", query = "SELECT p FROM PreinsDiplome p"),
    @NamedQuery(name = "PreinsDiplome.findByIddiplome", query = "SELECT p FROM PreinsDiplome p WHERE p.preinsDiplomePK.iddiplome = :iddiplome"),
    @NamedQuery(name = "PreinsDiplome.findByIdpreins", query = "SELECT p FROM PreinsDiplome p WHERE p.preinsDiplomePK.idpreins = :idpreins"),
    @NamedQuery(name = "PreinsDiplome.findByAnneobtention", query = "SELECT p FROM PreinsDiplome p WHERE p.anneobtention = :anneobtention"),
    @NamedQuery(name = "PreinsDiplome.findByEtabobtention", query = "SELECT p FROM PreinsDiplome p WHERE p.etabobtention = :etabobtention"),
    @NamedQuery(name = "PreinsDiplome.findByAnnuler", query = "SELECT p FROM PreinsDiplome p WHERE p.annuler = :annuler")})
public class PreinsDiplome implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PreinsDiplomePK preinsDiplomePK;
    @Size(max = 2147483647)
    @Column(name = "anneobtention")
    private String anneobtention;
    @Size(max = 2147483647)
    @Column(name = "etabobtention")
    private String etabobtention;
    @Column(name = "annuler")
    private Boolean annuler;
    @JoinColumn(name = "iddiplome", referencedColumnName = "iddiplome", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Diplomes diplomes;
    @JoinColumn(name = "idpreins", referencedColumnName = "idpreins", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Preinscription preinscription;

    public PreinsDiplome() {
    }

    public PreinsDiplome(PreinsDiplomePK preinsDiplomePK) {
        this.preinsDiplomePK = preinsDiplomePK;
    }

    public PreinsDiplome(String iddiplome, long idpreins) {
        this.preinsDiplomePK = new PreinsDiplomePK(iddiplome, idpreins);
    }
    
    public PreinsDiplome(String anneobtention, String etabobtention, Diplomes diplomes) {
        this.preinsDiplomePK = new PreinsDiplomePK();
        this.preinsDiplomePK.setIddiplome(diplomes.getIddiplome());
        this.anneobtention = anneobtention; 
        this.etabobtention = etabobtention;
        this.diplomes = diplomes;
//To change body of generated methods, choose Tools | Templates.
    }

    public PreinsDiplomePK getPreinsDiplomePK() {
        return preinsDiplomePK;
    }

    public void setPreinsDiplomePK(PreinsDiplomePK preinsDiplomePK) {
        this.preinsDiplomePK = preinsDiplomePK;
    }

    public String getAnneobtention() {
        return anneobtention;
    }

    public void setAnneobtention(String anneobtention) {
        this.anneobtention = anneobtention;
    }

    public String getEtabobtention() {
        return etabobtention;
    }

    public void setEtabobtention(String etabobtention) {
        this.etabobtention = etabobtention;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    public Diplomes getDiplomes() {
        return diplomes;
    }

    public void setDiplomes(Diplomes diplomes) {
        this.diplomes = diplomes;
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
        hash += (preinsDiplomePK != null ? preinsDiplomePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PreinsDiplome)) {
            return false;
        }
        PreinsDiplome other = (PreinsDiplome) object;
        return !((this.preinsDiplomePK == null && other.preinsDiplomePK != null) || (this.preinsDiplomePK != null && !this.preinsDiplomePK.equals(other.preinsDiplomePK)));
    }

    @Override
    public String toString() {
        return "ges.academy.entity.PreinsDiplome[ preinsDiplomePK=" + preinsDiplomePK + " ]";
    }
    
}
