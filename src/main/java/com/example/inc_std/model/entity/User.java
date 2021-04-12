package com.example.inc_std.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data // 객체로 사용할 것이기 때문에
@AllArgsConstructor // 파라미터를 모두 포함한 생성자와 각 인스턴스에 대해서 GET, SET METHOD 가 만들어짐
@NoArgsConstructor // 파라미터가 없는 생성자 자동 생성
@Entity // = DB의 table (해당 Class 가 Entity 임을 명시)
@Table(name = "user") // 와 같이 테이블을 지정해줄 수 있다 (이름이 다를 경우) (실제 DB 테이블의 이름 명시)
public class User {
    @Id // 구분자를 선언해줘야 함 (Index Primary Key)
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Primary key 식별키의 전략 설정 (Mysql 은 Identity)
    private Long id;

    // JPA 의 Entity 및 Column 은 자동으로 camelCase 를 DB 의 snake_case 로 매칭해줌
    @Column(name = "account") // 와 같이 칼럼을 지정해줄 수 있다 (이름이 다를 경우) (실제 DB Column 의 이름 명시)
    private String account;

    private String password;

    private String status;

    private String email;

    private String phoneNumber; // JPA 에서 자동으로 DB의 phone_number 를 phoneNumber 로 연결해줌

    private LocalDateTime registeredAt;

    private LocalDateTime unregisteredAt;

    private LocalDateTime createdAt;

    private String createdBy;

    private LocalDateTime updatedAt;

    private String updatedBy;

    /*

    // 1 : N
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<OrderDet> orderDetList;

     */
}



