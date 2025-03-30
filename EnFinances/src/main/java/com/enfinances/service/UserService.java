package com.enfinances.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.enfinances.entity.User;

@Service
public interface UserService {

	User registerNewClient(String fname, String lname, String email, String contactNumber, String password);

	boolean emailExists(String email);

	void setPasswordEncoder(PasswordEncoder passwordEncoder);

	User getUserById(Long id);

	User findByEmail(String email);
}