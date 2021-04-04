package com.example.inc_std.repository;

import com.example.inc_std.IncStdApplicationTests;
import com.example.inc_std.model.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

public class userRepositoryTest extends IncStdApplicationTests {

    @Autowired // Spring 의 DI (Dependency Injection) - 직접 객체를 만들지 않고, 스프링이 직접 관리함
    private UserRepository userRepository; // = new UserRepository(); 를 생략할 수 있음
    // Application 실행 시 스프링이 Autowired 로 Annotation 된 객체를 찾아서 자동으로 객체를 만들어 줌
    // Singleton 디자인 패턴을 사용함

    @Test // 테스트 코드임을 나타냄
    public void create() {
        // 예전 방식 : String sql = insert into user (%s, %s, %d) value (account, email, age);
        // 쿼리를 직접 작성했었지만, JPA 는 객체로 인식해서 동작함

        User user = new User(); // User 는 매번 새로운 값이 들어가기 때문에 Singleton 이 아님 = Autowired 불가
        user.setAccount("TestUser03");
        user.setEmail("TestUser03@gmail.com");
        user.setPhoneNumber("010-1234-5678");
        user.setCreatedAt(LocalDateTime.now());
        user.setCreatedBy("TestUser3");

        User userFromDB = userRepository.save(user); // JPA 에서 만든 user 를 연결된 DB 에 저장한 후, DB 내 저장된 객체를 return 함
        System.out.println(userFromDB);
    }

    public void read() {

    }

    public void update() {

    }

    public void delete() {

    }
}
