
package com.enfinances.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import com.enfinances.entity.User;

public class CustomUserDetails extends org.springframework.security.core.userdetails.User {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private final User user;

    public CustomUserDetails(User user, Collection<? extends GrantedAuthority> authorities) {
        super(user.getEmail(), user.getPassword(), authorities);
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
