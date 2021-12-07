/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

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
import javax.validation.constraints.NotNull;

/**
 *
 * @author NHAC
 */
@Entity
@Table(name = "items")
@NamedQueries({
    @NamedQuery(name = "Items.findAll", query = "SELECT i FROM Items i"),
    @NamedQuery(name = "Items.findByLineItemID", query = "SELECT i FROM Items i WHERE i.lineItemID = :lineItemID"),
    @NamedQuery(name = "Items.findByProductID", query = "SELECT i FROM Items i WHERE i.productID = :productID"),
    @NamedQuery(name = "Items.findByQuantity", query = "SELECT i FROM Items i WHERE i.quantity = :quantity")})
public class Items implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "lineItemID")
    private Integer lineItemID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "productID")
    private int productID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
//    @JoinColumn(name = "invoiceID", referencedColumnName = "invoiceID")
//    @ManyToOne(optional = false)
    private int invoiceID;

    public Items() {
    }

    public Items(Integer lineItemID, int InvoiceID, int productID, int quantity) {
        this.lineItemID = lineItemID;
        this.invoiceID = InvoiceID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public Items(int InvoiceID, int productID, int quantity) {
        this.invoiceID = InvoiceID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public Integer getLineItemID() {
        return lineItemID;
    }

    public void setLineItemID(Integer lineItemID) {
        this.lineItemID = lineItemID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (lineItemID != null ? lineItemID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Items)) {
            return false;
        }
        Items other = (Items) object;
        if ((this.lineItemID == null && other.lineItemID != null) || (this.lineItemID != null && !this.lineItemID.equals(other.lineItemID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Items[ lineItemID=" + lineItemID + " ]";
    }
    
}
