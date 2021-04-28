package com.fastcampus.example.domain.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookSalesInfoVO {
    private Long id;

    private User seller;

    private BookMeta book;

    private Long stock;

    private boolean purchasable;

    private boolean exposable;
}
