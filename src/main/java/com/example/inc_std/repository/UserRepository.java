package com.example.inc_std.repository;

import com.example.inc_std.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository // Repository 로 사용할 것임
public interface UserRepository extends JpaRepository<User, Long> { // User의 Repository 이며 식별자 Key 인 id index 는 Long 타입

    Optional<User> findFirstByPhoneNumberOrderByIdDesc(String phoneNumber);

    /*

    // CRUD 실행하기
    Optional<User> findByAccount(String account); // JPA 는 findBy 를 보고 SELECT 라는 것을 알아내고 Account 를 찾는 것을 알게 됨
    // SELECT * FROM WHERE ACCOUNT = ?

    Optional<User> findByEmail(String email);

    // SELECT * FROM WHERE ACCOUNT = ? AND EMAIL = ?
    // QueryMethod : 데이터베이스의 값을 가져올 때 값은 아래와 같이 여러 개의 값으로 불러올 수 있음
    Optional<User> findByAccountAndEmail(String account, String email);

     */
}
