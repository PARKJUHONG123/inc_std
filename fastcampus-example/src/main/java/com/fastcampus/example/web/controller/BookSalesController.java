package com.fastcampus.example.web.controller;

import com.fastcampus.example.domain.entity.BookMeta;
import com.fastcampus.example.domain.entity.BookSalesInfo;
import com.fastcampus.example.domain.entity.BookSalesInfoVO;
import com.fastcampus.example.domain.entity.User;
import com.fastcampus.example.domain.repository.BookMetaRepository;
import com.fastcampus.example.domain.repository.BookSalesInfoRepository;
import com.fastcampus.example.domain.repository.UserRepository;
import com.fastcampus.example.domain.type.SalesStatus;
import com.fastcampus.example.web.error.ApiException;
import com.fastcampus.example.web.error.ExceptionEnum;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class BookSalesController {
    @Autowired
    BookSalesInfoRepository bookSalesInfoRepository;

    @GetMapping("/sales/{id}") // FIXME
    public BookSalesInfoVO read(@PathVariable(name = "id") Long id) {
        BookSalesInfo bookSalesInfo = bookSalesInfoRepository.findById(id)
                .orElseThrow(() -> new ApiException(ExceptionEnum.NOT_FOUND));

        if (bookSalesInfo.getStatus() == SalesStatus.HIDDEN) {
            throw new ApiException(ExceptionEnum.NOT_FOUND);
        }

        BookSalesInfoVO bookSalesInfoVO = new BookSalesInfoVO();
        bookSalesInfoVO.setId(bookSalesInfo.getId());
        bookSalesInfoVO.setBook(bookSalesInfo.getBookMeta());
        bookSalesInfoVO.setSeller(bookSalesInfo.getUser());
        bookSalesInfoVO.setStock(bookSalesInfo.getSalesVolume());
        bookSalesInfoVO.setExposable(bookSalesInfo.getStatus() != SalesStatus.HIDDEN);
        bookSalesInfoVO.setPurchasable(bookSalesInfo.getStatus() == SalesStatus.ON_SALE);

        return bookSalesInfoVO;
    }

    @PutMapping("/sales/{id}") // FIXME
    public BookSalesInfo update(@PathVariable(name = "id") Long id) {
        if (id == null) {
            throw new ApiException(ExceptionEnum.INVALID_HEADER);
        }

        BookSalesInfo bookSalesInfo = bookSalesInfoRepository.findById(id)
                .orElseThrow(() -> new ApiException(ExceptionEnum.NOT_FOUND));

        return null;

    }
}
