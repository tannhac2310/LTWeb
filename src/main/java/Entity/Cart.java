/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;
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

/**
 *
 * @author NHAC
 */
@Entity
@Table(name = "cart")
@NamedQueries({
    @NamedQuery(name = "Cart.findAll", query = "SELECT c FROM Cart c"),
    @NamedQuery(name = "Cart.findByCartID", query = "SELECT c FROM Cart c WHERE c.cartID = :cartID"),
    @NamedQuery(name = "Cart.findByAmount", query = "SELECT c FROM Cart c WHERE c.amount = :amount")})
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cartID")
    private Integer cartID;
    @Column(name = "amount")
    private Integer amount;
//    @JoinColumn(name = "AccountID", referencedColumnName = "uID")
//    @ManyToOne
//    private Account accountID;
//    @JoinColumn(name = "ProductID", referencedColumnName = "id")
//    @ManyToOne
//    private Product productID;
    @Column(name = "AccountID")
    private Integer AccountID;
    @Basic(optional = false)
    @Column(name = "ProductID")
    private Integer ProductID;
    
    
    //Thêm vào
    //private Product product;
    private ArrayList<LineItem> items;
    
//    public void setProduct(Product p) {
//		this.product = p;
//	}
//	
//	public Product getProduct() {
//		return this.product;
//	}

    public Cart() {
        items = new ArrayList<LineItem>();
        
    }
    
    public ArrayList<LineItem> getItems() {
        return items;
    }
    
    public int getCount() {
        return items.size();
    }
    
    
//    public double getTotal(LineItem item) {
//        double Total = item.getProduct().getPrice() * amount;
//        return Total;
//    }
//    
    
//    public String getPriceCurrencyFormat() {
//                    DecimalFormat formatter = new DecimalFormat("###,###,###");
//
//                    return formatter.format(this.getTotal(this.getItems()))+" VNĐ";
//    }
    
    
    public void addItem(LineItem item) {
        int id = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(id))
            {
                lineItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }
    
    public void removeItem(LineItem item) {
        int id = item.getProduct().getId();
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(id))
            {
                items.remove(i);
                return;
            }
        }
    }
    
    public void printItem(LineItem item) {
        int id = item.getProduct().getId();
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(id))
            {
                
                System.out.println(items);
            }
        }
    }
    
    
    public double TotalItem(LineItem item) {
        double total = item.getTotal();
        return total;
    }
    
//    public double TotalItem(LineItem item)
//    {
//        int id = item.getProduct().getId();
//        double total = 0;
//        for (int i = 0; i < items.size(); i++) {
//            LineItem lineItem = items.get(i);
//            if (lineItem.getProduct().getId().equals(id))
//            {
//                return item.getTotal();
//            }
//        }
//        return item.getTotal();
//        
//    }
    
//    public String getPriceTotalFormat() {
//                    DecimalFormat formatter = new DecimalFormat("###,###,###");
//
//                    return formatter.format(this.TotalItem(item))+" VNĐ";
//    }
    //Hết thêm

//    public Cart(Integer cartID, Integer amount, Integer AccountID, Integer ProductID) {
//        this.cartID = cartID;
//        this.amount = amount;
//        this.AccountID = AccountID;
//        this.ProductID = ProductID;
//    }

    

    public Integer getCartID() {
        return cartID;
    }

    public void setCartID(Integer cartID) {
        this.cartID = cartID;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

//    public Account getAccountID() {
//        return accountID;
//    }
//
//    public void setAccountID(Account accountID) {
//        this.accountID = accountID;
//    }
//
//    public Product getProductID() {
//        return productID;
//    }
//
//    public void setProductID(Product productID) {
//        this.productID = productID;
//    }

    public Integer getAccountID() {
        return AccountID;
    }

    public void setAccountID(Integer AccountID) {
        this.AccountID = AccountID;
    }

    public Integer getProductID() {
        return ProductID;
    }

    public void setProductID(Integer ProductID) {
        this.ProductID = ProductID;
    }

    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartID != null ? cartID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cart)) {
            return false;
        }
        Cart other = (Cart) object;
        if ((this.cartID == null && other.cartID != null) || (this.cartID != null && !this.cartID.equals(other.cartID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", amount=" + amount + ", AccountID=" + AccountID + ", ProductID=" + ProductID + '}';
    }

    
    
}
