package com.enfinances.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private long userId;
	
	@Column(name = "f_name")
	private String fname;
	
	@Column(name = "l_name")
	private String lname;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "contact_number")
	private String contactNumber;
	
	@Column(name = "password")
	private String password;
	
	@ManyToMany
	@JoinTable( name = "user_role",
				joinColumns = @JoinColumn(name = "user_id"),
				inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Roles> roles = new HashSet<>();
	
	// Add this to User.java
	// Add this to User.java
		@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
		private List<CurrencyExchange> exchanges = new ArrayList<>();
	
	public User() {}
	
	public User(String email, String password, Set<Roles> roles) {
		super();
		this.email = email;
		this.password = password;
		this.roles = roles;
	}

	public User(int userId, String fname, String lname, String email, String contactNumber, String password) {
		this.userId = userId;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.contactNumber = contactNumber;
		this.password = password;
	}
	
	public User(int userId, String fname, String lname, String email, String contactNumber, String password,
			Set<Roles> roles) {
		super();
		this.userId = userId;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.contactNumber = contactNumber;
		this.password = password;
		this.roles = roles;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Roles> getRoles() {
		return roles;
	}

	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User User = (User) o;
        return email.equals(User.email) && password.equals(User.password);
    }

    // HashCode method to generate a hash code based on email and password
    @Override
    public int hashCode() {
        return Objects.hash(email, password);
    }
    
    public String getUserName() {
		return email;
	}
    
    public String getRoleNames() {
        return roles.stream()
                .map(role -> role.getRoleName())
                .collect(Collectors.joining(", "));
    }
}
