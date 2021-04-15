package com.example.inc_std.model.entity;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@ToString(exclude = {"user", "orderDetailList"})
@EntityListeners(AuditingEntityListener.class) // 클래스가 LoginUserAuditorAware 에 의해 감시받음

@Builder // 생성자 Pattern 으로, 원하는 만큼의 파라미터를 가진 생성자 생성가능
@Accessors(chain = true) // chaining 된 형태로 객체를 생성할 수 있음
public class OrderGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String status;

    private String orderType;

    private String revAddress;

    private String revName;

    private String paymentType;

    private BigDecimal totalPrice;

    private Integer totalQuantity;

    private LocalDateTime orderAt;

    private LocalDateTime arrivalDate;

    @CreatedDate
    private LocalDateTime createdAt;

    @CreatedBy // LoginUserAuditorAware 의 adminUser 에 의해 적용됨
    private String createdBy;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @LastModifiedBy
    private String updatedBy;


    // private Long userId;
    // OrderGroup N : 1 User
    @ManyToOne
    private User user; // OrderGroup 의 OneToMany 의 MappedBy 의 변수명과 일치해야 함

    // OrderGroup 1 : N OrderDetail
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "orderGroup")
    private List<OrderDetail> orderDetailList;

}
