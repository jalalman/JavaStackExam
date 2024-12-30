package com.axsos.login.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.login.model.Team;

import jakarta.validation.constraints.AssertFalse;

@Repository
public interface TeamRepo extends CrudRepository<Team, Long> {
    List<Team> findAll();
    List<Team> findByTeamName(String teamName);

}
