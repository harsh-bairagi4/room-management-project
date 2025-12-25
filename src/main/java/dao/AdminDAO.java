package dao;


import entity.Admin;
import entity.Room;
import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import util.JPAUtil;
import util.PasswordHashUtil;

import java.util.List;

public class AdminDAO {
    private static  EntityManagerFactory factory = JPAUtil.getFactory();
    public static Admin authenticate(Admin admin, String plainPassword) {

        try (EntityManager manager = factory.createEntityManager();){
            TypedQuery<Admin> query =  manager.createQuery("from Admin where email =:email",Admin.class);
            query.setParameter("email", admin.getEmail());
            List<Admin> list =  query.getResultList();
            if(list.size() == 0)
                return null;
            admin = list.get(0);

            boolean match = PasswordHashUtil.checkPassword(plainPassword, admin.getPassword());

            return match ? admin : null;
        }
        catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
    public static boolean register(Admin admin){
        EntityTransaction transaction = null;
        try(EntityManager manager = factory.createEntityManager();){
            transaction = manager.getTransaction();
            transaction.begin();
            manager.persist(admin);
            transaction.commit();
            return true;
        }
        catch(Exception e){
            if(transaction != null && transaction.isActive())
                transaction.rollback();
            return false;
        }
    }
    public static Admin getAdminById(int id){
        try(EntityManager manager = factory.createEntityManager();){
            Admin admin = manager.find(Admin.class, id);
            return admin;
        }
        catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }


    public static boolean removeRoom(int roomId, int adminId) {
        EntityTransaction transaction = null;

        try (EntityManager manager = factory.createEntityManager()) {

            Room room = manager.find(Room.class, roomId);

            if (room == null || room.getAdmin() == null || room.getAdmin().getId() != adminId) {
                return false; //
            }

            transaction = manager.getTransaction();
            transaction.begin();

            manager.remove(room);

            transaction.commit();
            return true;

        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
    public static boolean updateRoom(Room room) {
        EntityTransaction transaction = null;
        try (EntityManager manager = factory.createEntityManager()) {
            transaction = manager.getTransaction();
            transaction.begin();
            manager.merge(room);
            transaction.commit();
            return true;

        } catch (Exception e) {
            if (transaction != null && transaction.isActive())
                transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }


}