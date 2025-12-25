package entity;

import jakarta.persistence.*;
import util.DataConverter;
import util.PasswordHashUtil;


@Entity
@Table(name = "users")
public class User {
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


    public User(){}
    @PrePersist
    @PreUpdate
    public void hashPassword(){
        if(password !=null && !password.startsWith("$2a$")){
            password = PasswordHashUtil.hashPassword(password);
        }
    }

    public User(String name, String email, String password){
        this.name = name;
        this.email = email;
        this.password = password;
    }


    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

}

