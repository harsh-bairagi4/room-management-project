package util;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static EntityManagerFactory entityManagerFactory = null;
    public static EntityManagerFactory getFactory(){
        try{
            if(entityManagerFactory == null)
                entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
            return entityManagerFactory;
        }
        catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}
