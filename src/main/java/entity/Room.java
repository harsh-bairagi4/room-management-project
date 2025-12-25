package entity;

import jakarta.persistence.*;

@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "room_types", nullable = false)
    private String roomType;
    @Column(name = "locations", nullable = false)
    private String location;
    @Column(name = "prices", nullable = false)
    private int price;
    @Column(name = "phone_numbers", nullable = false)
    private String phone;
    @Column(nullable = false)
    private boolean wifi;
    @Column(name = "available", nullable = false)
    private boolean isAvailable = true;
    @Column(name = "ro_water", nullable = false)
    private boolean roWater;

    @ManyToOne
    @JoinColumn(name = "admin_id")
    private Admin admin;  // relationship

    public Room(){}

    public Room(String roomType, String location, int price, String phone, boolean wifi, boolean roWater, Admin admin){
        this.roomType = roomType;
        this.location = location;
        this.price = price;
        this.phone = phone;
        this.wifi = wifi;
        this.roWater = roWater;
        this.admin = admin;
    }

    // Getters & Setters

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getRoomType() { return roomType; }

    public void setRoomType(String roomType) { this.roomType = roomType; }

    public String getLocation() { return location; }

    public void setLocation(String location) { this.location = location; }

    public int getPrice() { return price; }

    public void setPrice(int price) { this.price = price; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public boolean isWifi() { return wifi; }

    public void setWifi(boolean wifi) { this.wifi = wifi; }

    public boolean isRoWater() { return roWater; }

    public void setRoWater(boolean roWater) { this.roWater = roWater; }
    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public Admin getAdmin() { return admin; }

    public void setAdmin(Admin admin) { this.admin = admin; }
}
