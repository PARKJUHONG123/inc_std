package com.example.inc_std.repository;

import com.example.inc_std.IncStdApplicationTests;
import com.example.inc_std.model.entity.OrderDet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

public class OrderDetRepositoryTest extends IncStdApplicationTests {

    @Autowired
    private OrderDetRepository orderDetRepository;

    @Test
    public void create() {
        OrderDet orderDet = new OrderDet();

        orderDet.setOrderAt(LocalDateTime.now());
//        orderDet.setUserId(4L); // 어떤 사람 // Long 에서 User 로 바뀌었기 때문
//        orderDet.setItemId(1L); // 어떤 상품

        OrderDet newOrderDet = orderDetRepository.save(orderDet);
        Assertions.assertNotNull(newOrderDet);
    }
}
