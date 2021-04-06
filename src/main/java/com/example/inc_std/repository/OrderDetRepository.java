package com.example.inc_std.repository;

import com.example.inc_std.model.entity.OrderDet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetRepository extends JpaRepository<OrderDet, Long> {
}
