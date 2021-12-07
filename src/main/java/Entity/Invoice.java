/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author NHAC
 */
@Entity
@Table(name = "invoice")
@NamedQueries({
    @NamedQuery(name = "Invoice.findAll", query = "SELECT i FROM Invoice i"),
    //@NamedQuery(name = "Invoice.findByuID", query = "SELECT i FROM Invoice i WHERE i.uID = :uID"),
    @NamedQuery(name = "Invoice.findByInvoiceID", query = "SELECT i FROM Invoice i WHERE i.invoiceID = :invoiceID"),
    @NamedQuery(name = "Invoice.findByInvoiceDate", query = "SELECT i FROM Invoice i WHERE i.invoiceDate = :invoiceDate"),
    @NamedQuery(name = "Invoice.findByTotalAmount", query = "SELECT i FROM Invoice i WHERE i.totalAmount = :totalAmount"),
    @NamedQuery(name = "Invoice.findByIsProccessed", query = "SELECT i FROM Invoice i WHERE i.isProccessed = :isProccessed")})
public class Invoice implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "invoiceID")
    private Integer invoiceID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "invoiceDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date invoiceDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TotalAmount")
    private double totalAmount;
    @Column(name = "isProccessed")
    private Character isProccessed;
//    @JoinColumn(name = "uID", referencedColumnName = "uID")
//    @ManyToOne(optional = false)
    @Basic(optional = false)
    @NotNull
    @Column(name = "uID")
    private int uid;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invoiceID")
//    private Collection<Items> itemsCollection;

    public Invoice() {
    }

    public Invoice(Integer invoiceID, Integer uid, Date invoiceDate, double totalAmount, Character isProccessed) {
        this.invoiceID = invoiceID;
        this.uid = uid;
        this.invoiceDate = invoiceDate;
        this.totalAmount = totalAmount;
        this.isProccessed = isProccessed;
    }

    public Invoice(Integer uid, Date invoiceDate, double totalAmount, Character isProccessed) {
        this.uid = uid;
        this.invoiceDate = invoiceDate;
        this.totalAmount = totalAmount;
        this.isProccessed = isProccessed;
    }

    public Integer getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(Integer invoiceID) {
        this.invoiceID = invoiceID;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Character getIsProccessed() {
        return isProccessed;
    }

    public void setIsProccessed(Character isProccessed) {
        this.isProccessed = isProccessed;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

//    public Collection<Items> getItemsCollection() {
//        return itemsCollection;
//    }
//
//    public void setItemsCollection(Collection<Items> itemsCollection) {
//        this.itemsCollection = itemsCollection;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invoiceID != null ? invoiceID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Invoice)) {
            return false;
        }
        Invoice other = (Invoice) object;
        if ((this.invoiceID == null && other.invoiceID != null) || (this.invoiceID != null && !this.invoiceID.equals(other.invoiceID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Invoice[ invoiceID=" + invoiceID + " ]";
    }
    
}
