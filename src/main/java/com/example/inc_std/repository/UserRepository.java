package com.example.inc_std.repository;

import com.example.inc_std.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository // Repository 로 사용할 것임
public interface UserRepository extends JpaRepository<User, Long> { // User의 Repository 이며 식별자 Key 인 id index 는 Long 타입
    // CRUD 실행하기
    Optional<User> findByAccount(String account); // JPA 는 findBy 를 보고 SELECT 라는 것을 알아내고 Account 를 찾는 것을 알게 됨
    // SELECT * FROM WHERE ACCOUNT = ?

    Optional<User> findByEmail(String email);

    // SELECT * FROM WHERE ACCOUNT = ? AND EMAIL = ?
    Optional<User> findByAccountAndEmail(String account, String email);
}
