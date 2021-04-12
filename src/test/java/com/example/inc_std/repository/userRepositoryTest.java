package com.example.inc_std.repository;

import com.example.inc_std.IncStdApplicationTests;
import com.example.inc_std.model.entity.Item;
import com.example.inc_std.model.entity.User;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;

public class userRepositoryTest extends IncStdApplicationTests {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void create() {
        String account = "Test01";
        String password = "Test01";
        String status = "REGISTERED";
        String email = "Test01@gmail.com";
        String phoneNumber = "000-1111-2222";
        LocalDateTime registeredAt = LocalDateTime.now();
        LocalDateTime createdAt = LocalDateTime.now();
        String createdBy = "AdminServer";

        User user = new User();
        user.setAccount(account);
        user.setPassword(password);
        user.setStatus(status);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setRegisteredAt(registeredAt);
        user.setCreatedAt(createdAt);
        user.setCreatedBy(createdBy);

        User newUser = userRepository.save(user);
        Assertions.assertNotNull(newUser);
    }

    public void read() {
        Optional<User> user = userRepository.findFirstByPhoneNumberOrderByIdDesc("000-1111-2222");
        Assertions.assertNotNull(user);
    }

    /*

    @Autowired // Spring 의 DI (Dependency Injection) - 직접 객체를 만들지 않고, 스프링이 직접 관리함
    // 스프링 프레임워크에서 개발자가 객체들을 직접 만들지 않고 스프링이 직접 관리를 하는 것을 Dependency Injection ( DI ) 의존성 주입
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

    @Test
    @Transactional
    public void read() {
        Optional<User> user = userRepository.findByAccount("TestUser03"); // ID 가 LONG 이기 때문에
        user.ifPresent(selectUser -> { // user 가 있으면 (ifPresent) selectUser 로 찍어보겠음
            System.out.println("user : " + selectUser); // selectUser 라는 객체 명으로 user 가 return 됨
            System.out.println("email : " + selectUser.getEmail());
            selectUser.getOrderDetList().stream().forEach(detail -> {
                Item item = detail.getItem();
                System.out.println(item);
            });
        });
    }

    @Test
    @Transactional //
    public User read(@RequestParam Long id) {
        Optional<User> user = userRepository.findById(id); // ID 가 LONG 이기 때문에
        user.ifPresent(selectUser -> { // user 가 있으면 (ifPresent) selectUser 로 찍어보겠음
            System.out.println("user : " + selectUser); // selectUser 라는 객체 명으로 user 가 return 됨
            System.out.println("email : " + selectUser.getEmail());

            selectUser.getOrderDetList().stream().forEach(detail -> {
                // System.out.println(detail.getItem());
                Item item = detail.getItem();
                System.out.println(item);
            });
        });

        return user.get(); // REST 와 CRUD 를 연결해서 사용할 수 있음
    }

    @Test
    public void update() {
        Optional<User> user = userRepository.findById(2L);

        user.ifPresent(selectUser -> { // user 가 있으면 (ifPresent) selectUser 로 찍어보겠음
            selectUser.setAccount("ORANGE");
            selectUser.setUpdatedAt(LocalDateTime.now());
            selectUser.setUpdatedBy("update method()");

            userRepository.save(selectUser);
            // JPA 에서는 해당 ID 가 있는지 확인하고, 없으면 CREATE 와 마찬가지로 동작
        });
    }

    // @DeleteMapping("/api/user")
    @Test
    @Transactional // 실행은 되지만, 마지막에 ROLLBACK 을 해주는 기능
    public void delete() { // (@RequestParam Long id) {
        Optional<User> user = userRepository.findById(1L);

        Assertions.assertTrue(user.isPresent()); // 삭제할 데이터가 존재하는 경우 정상동작, 없을 경우 Error

        user.ifPresent(selectUser -> {
            userRepository.delete(selectUser);
        });

        Optional<User> deleteUser = userRepository.findById(1L);
        Assertions.assertFalse(deleteUser.isPresent());  // 삭제할 데이터가 존재하지 않는 경우 정상동작, 있을 경우 Error
    }
     */
}
