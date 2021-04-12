package com.example.inc_std.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class) // 클래스가 LoginUserAuditorAware 에 의해 감시받음

@Builder // 생성자 Pattern 으로, 원하는 만큼의 파라미터를 가진 생성자 생성가능
@Accessors(chain = true) // chaining 된 형태로 객체를 생성할 수 있음
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String status;

    private String name;

    private String title;

    private String content;

    private Integer price;

    private String brandName;

    private LocalDateTime registeredAt;

    private LocalDateTime unregisteredAt;

    @CreatedDate
    private LocalDateTime createdAt;

    @CreatedBy // LoginUserAuditorAware 의 adminUser 에 의해 적용됨
    private String createdBy;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @LastModifiedBy
    private String updatedBy;


    /*

    // 1 : N
    // LAZY = 지연로딩, EAGER = 즉시로딩

    // LAZY = SELECT * FROM ITEM WHERE ID = ?

    // EAGER (1 : 1 연관 관계일 때 사용함)
    // ITEM_ID = ORDER_DETAIL.ITEM_ID
    // USER-ID = ORDER_DETAIL.USER_ID
    // 연관 관계가 이루어진 모든 테이블에 대해서 조인을 걸어서 가져옴
    // FetchType 중 EAGER 타입은 연관관계로 설정된 모든 테이블에 대해서 Join이 일어나고, 모든 데이터를 가져오기 때문에 성능의 저하와 데이터를 가져오지 못하는 이슈가 생길 수 있음
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "item")
    private List<OrderDet> orderDetList;

     */

    // private Long partnerId;
    // Item N : 1 Partner
    @ManyToOne
    private Partner partner;

    // Item 1 : N OrderDetail
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "item")
    private List<OrderDetail> orderDetailList;
}
