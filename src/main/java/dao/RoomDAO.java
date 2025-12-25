package dao;

import entity.Admin;
import entity.Room;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import util.JPAUtil;

import java.util.List;

public class RoomDAO {
    private static EntityManagerFactory factory = JPAUtil.getFactory();
    public static boolean save(Room room){
        EntityTransaction transaction = null;
        try(EntityManager manager = factory.createEntityManager();){
            transaction = manager.getTransaction();
            transaction.begin();
            manager.persist(room);
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
    public static Room getRoomById(int roomId) {
        try (EntityManager manager = factory.createEntityManager()) {
            Room room = manager.find(Room.class, roomId);
            return room;
        }
        catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
    public static List<Room> getRooms(){
        try(EntityManager manager = factory.createEntityManager();) {
            TypedQuery<Room> query = manager.createQuery("from Room",Room.class);
            return query.getResultList();
        }
        catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }


}