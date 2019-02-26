package com.stingBootExample.repos;

import com.stingBootExample.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestBody;


public interface UserRepository extends JpaRepository<User, Long> {
    User findUserByName(String name);
}
