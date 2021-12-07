package DAO;

import ConnectionDB.ConnectDB;
import Entity.Account;
import Entity.Category;
import Entity.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;



public class AccountDAO {
    public Account login(String user, String pass) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT a FROM Account a WHERE a.user = :user AND a.pass = :pass";
        TypedQuery<Account> q = em.createQuery(query, Account.class);
        q.setParameter("user", user);
        q.setParameter("pass", pass);
        Account account = null;
        try {
            account = q.getSingleResult();
            if (account == null) {
                account = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return account;
    }
    public Account checkAccountExist(String user) {
        EntityManager em = ConnectDB.getEntityManager();
        String query = "SELECT a FROM Account a WHERE a.user = :user";
        TypedQuery<Account> q = em.createQuery(query, Account.class);
        q.setParameter("user", user);
        Account account = null;
        try {
            account = q.getSingleResult();
            if (account == null) {
                account = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return account;
    }
    
    public int register(Account account) {
        EntityManager em = ConnectDB.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(account);
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
    //update
    public int update(Account account) {
        EntityManager em = ConnectDB.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(account);
            trans.commit();
            return 1;
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
    }
    
    
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account account = new Account(2, "Nhac", "12345", 1, 1, "nhachnt23102001@gmail.com", "0903020504");
        int acc = dao.update(account);
        System.out.println(acc);
    }
}
