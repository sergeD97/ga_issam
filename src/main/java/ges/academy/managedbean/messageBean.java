/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ges.academy.managedbean;

import ges.academy.entity.MessagePreins;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

/**
 * @author ►BenjiS☼l☼
 */
@ManagedBean(name="messageBean")
@SessionScoped
public class messageBean implements Serializable {
    @ManagedProperty("#{LoginBean}")
    private LoginBean lb;
    private MessagePreins messagePreinsToRead;
    private List<MessagePreins> messagePreinsNonLuList;
    public Integer nbMsg = 0;
    private String auteur;
    private String contenu;
    private Date dateReception;

    public messageBean() {
        messagePreinsToRead = new MessagePreins();
        messagePreinsNonLuList = new ArrayList<>();
    }
    
    public boolean isNbMsgNull() {
        return messagePreinsNonLuList.isEmpty();
    }
    
    public boolean isNonLu(MessagePreins messagePreins) {
        return messagePreinsNonLuList.contains(messagePreins);
    }

    public String readMessage(MessagePreins message) {
        this.messagePreinsToRead = message;
        this.auteur = messagePreinsToRead.getAuteur();
        this.contenu = messagePreinsToRead.getContenu();
        this.dateReception = messagePreinsToRead.getDatereception();
        if(messagePreinsNonLuList.contains(messagePreinsToRead)) {
            messagePreinsNonLuList.remove(messagePreinsToRead);
            nbMsg = messagePreinsNonLuList.size();
        }
        return "read_messages_preins.xhtml?faces-redirect=true";
    }
    
    public MessagePreins getMessagePreinsToRead() {
        return messagePreinsToRead;
    }

    public void setMessagePreinsToRead(MessagePreins messagePreinsToRead) {
        this.messagePreinsToRead = messagePreinsToRead;
    }

    public List<MessagePreins> getMessagePreinsNonLuList() {
        return messagePreinsNonLuList;
    }

    public void setMessagePreinsNonLuList(List<MessagePreins> messagePreinsNonLuList) {
        this.messagePreinsNonLuList = messagePreinsNonLuList;
    }

    public void setLb(LoginBean lb) {
        this.lb = lb;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public Date getDateReception() {
        return dateReception;
    }

    public void setDateReception(Date dateReception) {
        this.dateReception = dateReception;
    }

    public Integer getNbMsg() {
        return nbMsg;
    }

    public void setNbMsg(Integer nbMsg) {
        this.nbMsg = nbMsg;
    }
    
}
