package com.axsos.login.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.axsos.login.model.Team;
import com.axsos.login.model.User;
@Repository
public interface UserRepo extends CrudRepository<User,Long>{
    Optional<User> findByEmail(String email);
    List<User> findAll();
}
