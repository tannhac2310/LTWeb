package ConnectionDB;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


/**
 *
 * @author NHAC
 */
public class ConnectDB {
    public static EntityManager getEntityManager(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Medicine_MASTER_war_1PU");
        return emf.createEntityManager();
    }
}