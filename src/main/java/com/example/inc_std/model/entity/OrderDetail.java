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

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity // order_detail 에 자동 MAPPING
@ToString(exclude = {"orderGroup", "item"}) // recursive 하게 서로 불러오는 것을 막기 위해
@EntityListeners(AuditingEntityListener.class) // 클래스가 LoginUserAuditorAware 에 의해 감시받음

@Builder // 생성자 Pattern 으로, 원하는 만큼의 파라미터를 가진 생성자 생성가능
@Accessors(chain = true) // chaining 된 형태로 객체를 생성할 수 있음
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String status;

    private LocalDateTime arrivalDate;

    private Integer quantity;

    private BigDecimal totalPrice;

    @CreatedDate
    private LocalDateTime createdAt;

    @CreatedBy // LoginUserAuditorAware 의 adminUser 에 의해 적용됨
    private String createdBy;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @LastModifiedBy
    private String updatedBy;




    /*

    // private Long userId;
    // N : 1
    @ManyToOne
    private User user; // Hibernate 가 user_id 를 찾아감

    // N : 1
    @ManyToOne
    private Item item;
    */

    // private Long orderGroupId;
    // OrderDetail N : 1 OrderGroup
    @ManyToOne
    private OrderGroup orderGroup;

    // private Long itemId;
    // OrderDetail N : 1 Item
    @ManyToOne
    private Item item;

}
