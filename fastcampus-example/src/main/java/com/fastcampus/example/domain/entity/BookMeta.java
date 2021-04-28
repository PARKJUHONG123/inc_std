package com.fastcampus.example.domain.entity;

import com.fastcampus.example.domain.BaseEntity;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name = "book_meta")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookMeta extends BaseEntity {
    @Id
    @GeneratedValue
    private Long id;

    @Column
    private String name;

    @Column
    private Long price;

    @Column(name = "isbn13")
    private String isbn;

    // image category 등등...다양한 정보
}
