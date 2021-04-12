package com.example.inc_std.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
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

    private LocalDateTime createdAt;

    private String createdBy;

    private LocalDateTime updatedAt;

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
}
