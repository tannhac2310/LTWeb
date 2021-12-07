/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionDB.ConnectDB;
import Entity.Product;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.transaction.Transaction;

/**
 *
 * @author NHAC
 */
public class ProductDAO {
    
    public List<Product> listAllProduct() {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select p FROM Product p";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        List<Product> listProduct;
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    
    public List<Product> listProductByCategory(int cateID) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select p FROM Product p WHERE p.cateID = :cateID";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        List<Product> listProduct;
        q.setParameter("cateID", cateID);
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    
    public Product getProductByID(int id) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select p FROM Product p WHERE p.id = :id";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        q.setParameter("id", id);
        Product product = null;
        try {
            product = q.getSingleResult();
            if (product == null) {
                product = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return product;
    }
    
    public List<Product> listProductBySearchName(String txtSearch) {
        EntityManager em = ConnectDB.getEntityManager();
        //String query = "Select p FROM Product p WHERE p.cateID = :cateID";
        String query = "Select p FROM Product p WHERE p.name LIKE :name";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        List<Product> listProduct;
        q.setParameter("name", "%" + txtSearch +"%");
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    
    public List<Product> listCProduct(String cate) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT p FROM Product p WHERE p.title = :title";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        q.setParameter("title", cate);
        List<Product> listProduct;
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    //sản phẩm mới nhất
    public List<Product> getNewProduct() {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT p FROM Product p ORDER by p.id DESC";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class).setMaxResults(1);
        List<Product> listProduct;
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    //
    public List<Product> getTopProduct(int id) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT p FROM Product p WHERE p.id = :id";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        q.setParameter("id", id);
        List<Product> listProduct;
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    //Một sản phẩm trong category
    public List<Product> listOneProductCategory(int cateID) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select p FROM Product p WHERE p.cateID = :cateID";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class).setMaxResults(1);;
        List<Product> listProduct;
        q.setParameter("cateID", cateID);
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
    //Một sản phẩm search được
       public List<Product> listOneProductSearch(String txt) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "Select p FROM Product p WHERE p.name LIKE :name";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class).setMaxResults(1);;
        List<Product> listProduct;
        q.setParameter("name", "%" + txt +"%");
        try {
            listProduct = q.getResultList();
            if (listProduct == null || listProduct.isEmpty()) {
                listProduct = null;
            }
        }catch (Exception e) 
        {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listProduct;
    }
       
    
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.listProductByCategory(3);
        for (Product o : list) {
            System.out.println(o);
        }
    }
}