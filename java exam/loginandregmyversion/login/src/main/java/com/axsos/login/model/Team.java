package com.axsos.login.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.*;


@Entity
@Table(name = "teams")
public class Team {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
@NotNull(message = "Team Name is required")
@Size(min = 2, max = 200, message = "Team Name must be between 2 and 200 characters")
private String teamName;
@NotNull(message = "Skill Level is required")
@Min(value = 1, message = "Skill Level must be at least 1")
@Max(value = 5, message = "Skill Level must be at most 5")
private Long skillLevel;

@NotEmpty(message = "Game day is required")
private String gameDay;

@NotEmpty(message = "Added by is required")
private String addedBy;

@OneToMany(mappedBy="team", fetch = FetchType.LAZY)
private List<User> users;

@Column(updatable=false)
@DateTimeFormat(pattern="yyyy-MM-dd")
private Date createdAt;
@DateTimeFormat(pattern="yyyy-MM-dd")
private Date updatedAt;

public String getAddedBy() {
    return addedBy;
}
public void setAddedBy(String addedBy) {
    this.addedBy = addedBy;
}
public Team() {
}
public Team(String teamName, Long skillLevel, String gameDay) {
    this.teamName = teamName;
    this.skillLevel = skillLevel;
    this.gameDay = gameDay;
}
public Long getId() {
    return id;
}
public void setId(Long id) {
    this.id = id;
}

public List<User> getUsers() {
    return users;
}
public void setUsers(List<User> users) {
    this.users = users;
}
public String getTeamName() {
    return teamName;
}
public void setTeamName(String teamName) {
    this.teamName = teamName;
}
public Long getSkillLevel() {
    return skillLevel;
}
public void setSkillLevel(Long skillLevel) {
    this.skillLevel = skillLevel;
}
public String getGameDay() {
    return gameDay;
}
public void setGameDay(String gameDay) {
    this.gameDay = gameDay;
}


@PrePersist
protected void onCreate(){
    this.createdAt = new Date();
}
@PreUpdate
protected void onUpdate(){
    this.updatedAt = new Date();
}


}


