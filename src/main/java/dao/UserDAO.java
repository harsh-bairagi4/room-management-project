package dao;


import entity.Room;
import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import util.JPAUtil;
import util.PasswordHashUtil;

import java.util.List;

public class UserDAO {
    private static EntityManagerFactory factory = JPAUtil.getFactory();
    public static User authenticate(User user, String plainPassword) {
        try (EntityManager manager = factory.createEntityManager();){
            TypedQuery<User> query =  manager.createQuery("from User where email =:email",User.class);
            query.setParameter("email", user.getEmail());
            List<User> list =  query.getResultList();
            if(list.size() == 0)
                return null;
            user = list.get(0);

            boolean match = PasswordHashUtil.checkPassword(plainPassword, user.getPassword());

            return match ? user : null;
        }
        catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
    public static boolean register(User user){
        EntityTransaction transaction = null;
        try(EntityManager manager = factory.createEntityManager();){
            transaction = manager.getTransaction();
            transaction.begin();
            manager.persist(user);
            transaction.commit();
            return true;
        }
        catch(Exception e){
            if(transaction != null && transaction.isActive())
                transaction.rollback();
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
    public static List<Room> getRoomsByAdmin(int adminId){
        try(EntityManager manager = factory.createEntityManager();) {

            TypedQuery<Room> query = manager.createQuery( "from Room where admin.id = :adminId",Room.class);
            query.setParameter("adminId", adminId);
            return query.getResultList();
        }
        catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
}