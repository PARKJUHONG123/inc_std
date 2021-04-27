package com.fastcampus.example.web.controller;

import com.fastcampus.example.domain.entity.BookMeta;
import com.fastcampus.example.domain.repository.BookMetaRepository;
import com.fastcampus.example.web.error.ApiException;
import com.fastcampus.example.web.error.ExceptionEnum;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor

public class BookMetaController {
    @Autowired
    BookMetaRepository bookMetaRepository;

    @GetMapping("/books/{id}") // FIXME
    public BookMeta read(@PathVariable(name = "id") Long id) {
        return bookMetaRepository.findById(id)
                .orElseThrow( () -> new ApiException(ExceptionEnum.BOOK_META_NOT_FOUND) );
    }

    @PostMapping("/books")  // FIXME
    public BookMeta create(@RequestBody BookMeta bookMeta) {

        // 수정 필요함
        if (bookMeta.getName() == null) {
            throw new ApiException(ExceptionEnum.BOOK_META_INVALID_PARAMETER);
        }

        return bookMetaRepository.save(BookMeta.builder()
                    .id(bookMeta.getId())
                    .name(bookMeta.getName())
                    .price(bookMeta.getPrice())
                    .isbn(bookMeta.getIsbn())
                    .build());
    }

    @PutMapping("/books/{id}")  // FIXME
    public BookMeta update(@PathVariable(name = "id") Long id, @RequestBody BookMeta bookMeta) {

        return bookMetaRepository.findById(id).map(book -> {
            String name = bookMeta.getName();
            Long price = bookMeta.getPrice();
            String isbn = bookMeta.getIsbn();

            if (name == null && price == null && isbn == null) {
                throw new ApiException(ExceptionEnum.BOOK_META_INVALID_PARAMETER);
            }

            return BookMeta.builder()
                    .id(id)
                    .name(name)
                    .price(price)
                    .isbn(isbn)
                    .build();
        })
                .map(book -> bookMetaRepository.save(book))
                .orElseThrow(()->new ApiException(ExceptionEnum.BOOK_META_INVALID_PARAMETER));

    }
}
