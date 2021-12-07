/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionDB.ConnectDB;
import Entity.Category;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;


public class CategoryDAO {
    public List<Category> getAllCategories() {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT c FROM Category c";
        TypedQuery<Category> q = em.createQuery(query, Category.class);
        List<Category> listCategories;
        try {
            listCategories = q.getResultList();
            if (listCategories == null || listCategories.isEmpty()) {
                listCategories = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listCategories;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> listC = dao.getAllCategories();
        for (Category o : listC) {
            System.out.println(o);
        }
    }
}
