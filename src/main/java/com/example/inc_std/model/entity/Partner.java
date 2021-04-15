package com.example.inc_std.model.entity;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@ToString(exclude = {"itemList", "category"})
@EntityListeners(AuditingEntityListener.class) // 클래스가 LoginUserAuditorAware 에 의해 감시받음

@Builder // 생성자 Pattern 으로, 원하는 만큼의 파라미터를 가진 생성자 생성가능
@Accessors(chain = true) // chaining 된 형태로 객체를 생성할 수 있음
public class Partner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String status;

    private String address;

    private String callCenter;

    private String partnerNumber;

    private String businessNumber;

    private String ceoName;

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


    // private Long categoryId;
    @ManyToOne
    private Category category;

    // Partner 1 : N Item
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "partner")
    private List<Item> itemList;

}
