/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionDB.ConnectDB;
import Entity.Account;
import Entity.Invoice;
import Entity.Items;
import Entity.LineItem;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Date;
import java.util.Date;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NHAC
 */
public class OrderDAO {
    //Thêm vào dữ liệu
    public int createInvoice(Invoice bill)
    {
        EntityManager em = ConnectDB.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(bill);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
        return 1;
    }
    
    //Check
    public Invoice checkBillExist(int uID) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT i FROM Invoice i WHERE i.invoiceID = :invoiceID";
        TypedQuery<Invoice> q = em.createQuery(query, Invoice.class);
        q.setParameter("invoiceID", uID);
        Invoice billorder = null;
        try {
            billorder = q.getSingleResult();
            if (billorder == null) {
                billorder = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return billorder;
    }
    
    
    
    
    public int createLineItem(Items list) {
        EntityManager em = ConnectDB.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(list);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
        return 1;
    }
    
    //Chọn invoice id có id lớn nhất
    public List<Invoice> getInvoiceTOP() {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT i FROM Invoice i ORDER by i.invoiceID DESC";
        
        TypedQuery<Invoice> q = em.createQuery(query, Invoice.class).setMaxResults(1);
        List<Invoice> listInvoice;
        try {
            listInvoice = q.getResultList();
            if (listInvoice == null || listInvoice.isEmpty()) {
                listInvoice = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listInvoice;
    }
    
    //Select Invoice By ID User
    public List<Invoice> listInvoiceByuID(int uID) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select i FROM Invoice i WHERE i.uid = :uid";
        
        TypedQuery<Invoice> q = em.createQuery(query, Invoice.class);
        List<Invoice> listInvoice;
        q.setParameter("uid", uID);
        try {
            listInvoice = q.getResultList();
            if (listInvoice == null || listInvoice.isEmpty()) {
                listInvoice = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listInvoice;
    }
    //SELECT ITEMS BY INVOICEID
        public List<Items> listItemByInvoiceID(int iID) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select i FROM Items i WHERE i.invoiceID = :invoiceID";
        
        TypedQuery<Items> q = em.createQuery(query, Items.class);
        List<Items> listItems;
        q.setParameter("invoiceID", iID);
        try {
            listItems = q.getResultList();
            if (listItems == null || listItems.isEmpty()) {
                listItems = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listItems;
    }
    
    
//    public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
//        Date dates = calendar.getTime();
//        Invoice NewBill = new Invoice(2, dates, 5000000, 'y');
//        int ok = dao.createInvoice(NewBill);
//        System.out.println(ok);
//    }
    
//    public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        Invoice check = dao.checkBillExist(1);
//        System.out.println(check);
//    }
    
//    public static void main(String[] args) {
//        OrderDAO dao = new OrderDAO();
//        Product newProduct = new Product(29 ,"Lala", "2342", 30000000.0 , "No", "No" ,4,2);
//        //LineItem lineItem = new LineItem(2,2,2);
//        Items item = new Items(1,2,2);
//        int ok = dao.createLineItem(item);
//        System.out.println(ok);
//                      
//    }
    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Invoice> list = dao.getInvoiceTOP();
        for (Invoice o : list) {
            System.out.println(o);
        }
    }
}