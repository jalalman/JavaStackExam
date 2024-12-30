package com.axsos.login.service;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.axsos.login.model.LoginUser;
import com.axsos.login.model.User;
import com.axsos.login.repository.UserRepo;

@Service
public class UserService {
    @Autowired
    UserRepo userRepo;

    public User register(User newUser,BindingResult result){
    // Check if email is already taken
    Optional<User> possibleUser=userRepo.findByEmail(newUser.getEmail());
     if(possibleUser.isPresent()){
        result.rejectValue("email","email.taken","email is already taken");
     }
     // Check if passwords match
     if(!newUser.getPassword().equals(newUser.getConfirmPass())){
        result.rejectValue("confirmPass", "Matches", "The Confirm Password must match Password!");
     }
    // Return null if result has errors
     if(result.hasErrors()){
        return null;
     }
     String hashPass=BCrypt.hashpw(newUser.getPassword(),BCrypt.gensalt());
     newUser.setPassword(hashPass);
     return userRepo.save(newUser);
    // Hash and set password, save user to database
    }

    public User login(LoginUser newLoginUser ,BindingResult result){
        Optional<User> possibleUser=userRepo.findByEmail(newLoginUser.getEmail());
        if(possibleUser.isEmpty()){
            result.rejectValue("email","not exsist","email not found");
            return null;
        }
         // Get the user object
         User user=possibleUser.get();
         if(!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())){
            result.rejectValue("password", "Invalid", "Invalid Password!");
         }
         if (result.hasErrors()) {
            
            return null;
        }
        else{
            return user;
        }
    }

}
