package com.stingBootExample.repos;

import com.stingBootExample.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findUserByUsername(String username);


    User findByActivationCode(String code);
}
