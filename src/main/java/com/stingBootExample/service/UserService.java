package com.stingBootExample.service;

import com.stingBootExample.entity.Role;
import com.stingBootExample.entity.User;
import com.stingBootExample.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;
@EnableAutoConfiguration
@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailSend mailSend;

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        return userRepository.findUserByUsername(name);
    }

    public boolean addUser(User user) {
        User byUserNameFromDb = userRepository.findUserByUsername(user.getUsername());
        if (byUserNameFromDb != null) {
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActovationCode(UUID.randomUUID().toString());
        userRepository.save(user);
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format("Hello %s!+\n" +
                            "Welcome to Sweater. Please to activate link : http:/localhost:8090/activate/%s",
                    user.getUsername(), user.getActovationCode());
            mailSend.send(user.getEmail(), "Activation code", message);
        }
        return true;
    }

    public boolean activatedUser(String code) {
        User user = userRepository.findByActivationCode(code);
        if (user == null) {
            return false;
        }
        user.setActovationCode(null);
        userRepository.save(user);
        return true;
    }
}
