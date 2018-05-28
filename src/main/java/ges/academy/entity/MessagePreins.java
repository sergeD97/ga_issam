/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ges.academy.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Medjignia jelly roll
 */
@Entity
@Table(name = "message_preins")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MessagePreins.findAll", query = "SELECT m FROM MessagePreins m"),
    @NamedQuery(name = "MessagePreins.findByIdmessage", query = "SELECT m FROM MessagePreins m WHERE m.idmessage = :idmessage"),
    @NamedQuery(name = "MessagePreins.findByAuteur", query = "SELECT m FROM MessagePreins m WHERE m.auteur = :auteur"),
    @NamedQuery(name = "MessagePreins.findByDatereception", query = "SELECT m FROM MessagePreins m WHERE m.datereception = :datereception"),
    @NamedQuery(name = "MessagePreins.findByDatelecture", query = "SELECT m FROM MessagePreins m WHERE m.datelecture = :datelecture"),
    @NamedQuery(name = "MessagePreins.findByHeurelecture", query = "SELECT m FROM MessagePreins m WHERE m.heurelecture = :heurelecture"),
    @NamedQuery(name = "MessagePreins.findByContenu", query = "SELECT m FROM MessagePreins m WHERE m.contenu = :contenu"),
    @NamedQuery(name = "MessagePreins.findByMessagelu", query = "SELECT m FROM MessagePreins m WHERE m.messagelu = :messagelu"),
    @NamedQuery(name = "MessagePreins.findByLibelle", query = "SELECT m FROM MessagePreins m WHERE m.libelle = :libelle")})
public class MessagePreins implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "idmessage")
    private String idmessage;
    @Size(max = 2147483647)
    @Column(name = "auteur")
    private String auteur;
    @Column(name = "datereception")
    @Temporal(TemporalType.DATE)
    private Date datereception;
    @Column(name = "datelecture")
    @Temporal(TemporalType.DATE)
    private Date datelecture;
    @Column(name = "heurelecture")
    @Temporal(TemporalType.TIME)
    private Date heurelecture;
    @Size(max = 2147483647)
    @Column(name = "contenu")
    private String contenu;
    @Column(name = "messagelu")
    private Boolean messagelu;
    @Size(max = 2147483647)
    @Column(name = "libelle")
    private String libelle;
    @JoinColumn(name = "idpreins", referencedColumnName = "idpreins")
    @ManyToOne
    private Preinscription idpreins;

    public MessagePreins() {
    }

    public MessagePreins(String idmessage) {
        this.idmessage = idmessage;
    }

    public String getIdmessage() {
        return idmessage;
    }

    public void setIdmessage(String idmessage) {
        this.idmessage = idmessage;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public Date getDatereception() {
        return datereception;
    }

    public void setDatereception(Date datereception) {
        this.datereception = datereception;
    }

    public Date getDatelecture() {
        return datelecture;
    }

    public void setDatelecture(Date datelecture) {
        this.datelecture = datelecture;
    }

    public Date getHeurelecture() {
        return heurelecture;
    }

    public void setHeurelecture(Date heurelecture) {
        this.heurelecture = heurelecture;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public Boolean getMessagelu() {
        return messagelu;
    }

    public void setMessagelu(Boolean messagelu) {
        this.messagelu = messagelu;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Preinscription getIdpreins() {
        return idpreins;
    }

    public void setIdpreins(Preinscription idpreins) {
        this.idpreins = idpreins;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmessage != null ? idmessage.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MessagePreins)) {
            return false;
        }
        MessagePreins other = (MessagePreins) object;
        if ((this.idmessage == null && other.idmessage != null) || (this.idmessage != null && !this.idmessage.equals(other.idmessage))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ges.academy.entity.MessagePreins[ idmessage=" + idmessage + " ]";
    }
    
}
