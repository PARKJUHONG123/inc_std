package com.example.inc_std.repository;

import com.example.inc_std.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Repository 로 사용할 것임
public interface UserRepository extends JpaRepository<User, Long> { // User의 Repository 이며 식별자 Key 인 id index 는 Long 타입
    // CRUD 실행하기
}
