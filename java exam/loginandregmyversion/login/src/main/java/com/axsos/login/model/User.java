package com.axsos.login.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

@NotEmpty
@Size(min=3 ,max = 30,message = "Username must be between 3 and 30")
private String username;

@NotEmpty(message = "Email is required!")
@Email(message = "must be a vail email")
private String email;

@NotEmpty(message = "password is required!")
@Size(min=8,max = 100, message = "password must be at least 8")
private String password;
 @ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name="team_id")
   
private Team team;

@Transient
@NotEmpty(message = "password is required!")
@Size(min=8,max = 100, message = "password must be at least 8")
private String confirmPass;

@Column(updatable = false)
@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

@DateTimeFormat(pattern = "yyy-MM-dd")
    private Date updatedAt;

public Team getTeam() {
    return team;
}
public void setTeam(Team team) {
    this.team = team;
}
public User() {
}

public User(String username, String email, String password,String confirmPass) {
    this.username = username;
    this.email = email;
    this.password = password;
    this.confirmPass = confirmPass;
}

public Long getId() {
    return id;
}

public void setId(Long id) {
    this.id = id;
}

public String getUsername() {
    return username;
}

public void setUsername(String username) {
    this.username = username;
}

public String getEmail() {
    return email;
}

public void setEmail(String email) {
    this.email = email;
}

public String getPassword() {
    return password;
}

public void setPassword(String password) {
    this.password = password;
}

public String getConfirmPass() {
    return confirmPass;
}

public void setConfirmPass(String confirmPass) {
    this.confirmPass = confirmPass;
}

@PrePersist
protected void onCreate() {
    this.createdAt = new Date();
}

@PreUpdate
protected void onUpdate() {
    this.updatedAt = new Date();
}

}
