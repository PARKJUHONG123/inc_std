package com.fastcampus.example.domain.repository;

import com.fastcampus.example.domain.entity.BookMeta;
import com.fastcampus.example.domain.entity.BookSalesInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookMetaRepository extends JpaRepository<BookMeta, Long> {
}
