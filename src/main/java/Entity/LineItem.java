/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
/**
 *
 * @author NHAC
 */
public class LineItem implements Serializable{
	private Product product;
        
        //Vừa thêm
        private int invoiceID;
        
        //
	private int quantity;
	
        //Vừa thêm

    public LineItem(Product product, int invoiceID, int quantity) {
        this.product = product;
        this.invoiceID = invoiceID;
        this.quantity = quantity;
    }
        
        
        
        
        //
        
        
	public LineItem() {}
	
	public void setProduct(Product p) {
		this.product = p;
	}
	
	public Product getProduct() {
		return this.product;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getQuantity() {
		return this.quantity;
	}
	
	public double getTotal() {
		double total = quantity * product.getPrice();
		return total;
	}

        //Vừa thêm
        
        public int getInvoiceID() {
            return invoiceID;
        }

        public void setInvoiceID(int invoiceID) {
            this.invoiceID = invoiceID;
        }
	
        //
        
    public String getPriceTotalFormat() {
                    DecimalFormat formatter = new DecimalFormat("###,###,###");

                    return formatter.format(this.getTotal())+" VNĐ";
    }
}
