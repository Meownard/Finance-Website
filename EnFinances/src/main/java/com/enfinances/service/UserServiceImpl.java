package com.enfinances.service;

import java.util.Collections;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.enfinances.entity.Roles;
import com.enfinances.entity.User;
import com.enfinances.repository.RoleRepository;
import com.enfinances.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Override
	public User registerNewClient(String fname, String lname, String email, String contactNumber, String password) {
		if (emailExists(email)) {
            throw new RuntimeException("Email already exists");
        }

        // Encode the password
        String encodedPassword = passwordEncoder.encode(password);

        // Create new user
        User user = new User();
        user.setFname(fname);
        user.setLname(lname);
        user.setEmail(email);
        user.setContactNumber(contactNumber); 
        user.setPassword(encodedPassword);
        
        Roles userRole = roleRepository.findByRoleName("User");
        if (userRole == null) {
            throw new RuntimeException("Role 'User' not found. Please make sure it exists in the database.");
        } else {
        	
        	user.setRoles(Collections.singleton(userRole));

    		// Save user to the database
    		User savedUser = userRepository.save(user);
            return savedUser;
        }
	}

	@Override
	public boolean emailExists(String email) {
		 User User = userRepository.findByEmail(email);
	        return User != null; 
	}

	@Override
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		
	}
	
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
    
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}