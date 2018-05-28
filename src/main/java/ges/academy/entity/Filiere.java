/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "filiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filiere.findAll", query = "SELECT f FROM Filiere f"),
    @NamedQuery(name = "Filiere.findByCodefilere", query = "SELECT f FROM Filiere f WHERE f.codefilere = :codefilere"),
    @NamedQuery(name = "Filiere.findByLibelefilierefr", query = "SELECT f FROM Filiere f WHERE f.libelefilierefr = :libelefilierefr"),
    @NamedQuery(name = "Filiere.findByLibelefiliereen", query = "SELECT f FROM Filiere f WHERE f.libelefiliereen = :libelefiliereen"),
    @NamedQuery(name = "Filiere.findByMontant", query = "SELECT f FROM Filiere f WHERE f.montant = :montant"),
    @NamedQuery(name = "Filiere.findByAnnuler", query = "SELECT f FROM Filiere f WHERE f.annuler = :annuler"),
    @NamedQuery(name = "Filiere.findByComptebancaire", query = "SELECT f FROM Filiere f WHERE f.comptebancaire = :comptebancaire")})
public class Filiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "codefilere")
    private String codefilere;
    @Size(max = 2147483647)
    @Column(name = "libelefilierefr")
    private String libelefilierefr;
    @Size(max = 2147483647)
    @Column(name = "libelefiliereen")
    private String libelefiliereen;
    @Column(name = "montant")
    private BigInteger montant;
    @Column(name = "annuler")
    private Boolean annuler;
    @Size(max = 2147483647)
    @Column(name = "comptebancaire")
    private String comptebancaire;
    @JoinColumn(name = "cycles", referencedColumnName = "idcycle")
    @ManyToOne
    private Cycles cycles;
    @JoinColumn(name = "ecole", referencedColumnName = "codeecole")
    @ManyToOne
    private Ecole ecole;
    @JoinColumn(name = "typeformation", referencedColumnName = "idformation")
    @ManyToOne
    private TypeFormation typeformation;
    @OneToMany(mappedBy = "choixformation1")
    private List<Preinscription> preinscriptionList;
    @OneToMany(mappedBy = "choixformation2")
    private List<Preinscription> preinscriptionList1;
    @OneToMany(mappedBy = "choixformation3")
    private List<Preinscription> preinscriptionList2;
    @OneToMany(mappedBy = "codefiliere")
    private List<PieceDossier> pieceDossierList;

    public Filiere() {
    }

    public Filiere(String codefilere) {
        this.codefilere = codefilere;
    }

    public String getCodefilere() {
        return codefilere;
    }

    public void setCodefilere(String codefilere) {
        this.codefilere = codefilere;
    }

    public String getLibelefilierefr() {
        return libelefilierefr;
    }

    public void setLibelefilierefr(String libelefilierefr) {
        this.libelefilierefr = libelefilierefr;
    }

    public String getLibelefiliereen() {
        return libelefiliereen;
    }

    public void setLibelefiliereen(String libelefiliereen) {
        this.libelefiliereen = libelefiliereen;
    }

    public BigInteger getMontant() {
        return montant;
    }

    public void setMontant(BigInteger montant) {
        this.montant = montant;
    }

    public Boolean getAnnuler() {
        return annuler;
    }

    public void setAnnuler(Boolean annuler) {
        this.annuler = annuler;
    }

    public String getComptebancaire() {
        return comptebancaire;
    }

    public void setComptebancaire(String comptebancaire) {
        this.comptebancaire = comptebancaire;
    }

    public Cycles getCycles() {
        return cycles;
    }

    public void setCycles(Cycles cycles) {
        this.cycles = cycles;
    }

    public Ecole getEcole() {
        return ecole;
    }

    public void setEcole(Ecole ecole) {
        this.ecole = ecole;
    }

    public TypeFormation getTypeformation() {
        return typeformation;
    }

    public void setTypeformation(TypeFormation typeformation) {
        this.typeformation = typeformation;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList() {
        return preinscriptionList;
    }

    public void setPreinscriptionList(List<Preinscription> preinscriptionList) {
        this.preinscriptionList = preinscriptionList;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList1() {
        return preinscriptionList1;
    }

    public void setPreinscriptionList1(List<Preinscription> preinscriptionList1) {
        this.preinscriptionList1 = preinscriptionList1;
    }

    @XmlTransient
    public List<Preinscription> getPreinscriptionList2() {
        return preinscriptionList2;
    }

    public void setPreinscriptionList2(List<Preinscription> preinscriptionList2) {
        this.preinscriptionList2 = preinscriptionList2;
    }

    @XmlTransient
    public List<PieceDossier> getPieceDossierList() {
        return pieceDossierList;
    }

    public void setPieceDossierList(List<PieceDossier> pieceDossierList) {
        this.pieceDossierList = pieceDossierList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codefilere != null ? codefilere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filiere)) {
            return false;
        }
        Filiere other = (Filiere) object;
        if ((this.codefilere == null && other.codefilere != null) || (this.codefilere != null && !this.codefilere.equals(other.codefilere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.Filiere[ codefilere=" + codefilere + " ]";
    }
    
}
