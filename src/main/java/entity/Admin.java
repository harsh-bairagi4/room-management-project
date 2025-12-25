package entity;

import jakarta.persistence.*;
import util.DataConverter;
import util.PasswordHashUtil;

import java.util.List;

@Entity
@Table(name = "admins")
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "names", nullable = false)
    private String name;

    @Column(name = "emails", unique = true, nullable = false)
    @Convert(converter = DataConverter.class)
    private String email;

    @Column(name = "passwords",nullable = false)
    private String password;

    @OneToMany(mappedBy = "admin", cascade = CascadeType.ALL)
    private List<Room> rooms;

    public Admin(){}

    @PrePersist
    @PreUpdate
    public void hashPassword(){
        if(password !=null && !password.startsWith("$2a$")){
            password = PasswordHashUtil.hashPassword(password);
        }
    }

    public Admin(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Getters & Setters

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }
    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }

}
