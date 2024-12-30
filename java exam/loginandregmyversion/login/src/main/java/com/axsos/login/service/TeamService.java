package com.axsos.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.login.model.Team;
import com.axsos.login.repository.TeamRepo;

@Service
public class TeamService {
    @Autowired
    private TeamRepo teamRepo;
    public List<Team> allTeams(){
        return teamRepo.findAll();
    }
    public Team createTeam(Team team) {
        return teamRepo.save(team);
    }
    public Team findTeam(Long id) {
        return teamRepo.findById(id).orElse(null);
    }
    public Team updateTeam(Team team) {
        return teamRepo.save(team);
    }
    public void deleteTeam(Long id) {
        teamRepo.deleteById(id);
    }
}
