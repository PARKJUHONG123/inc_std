package com.example.inc_std.repository;

import com.example.inc_std.IncStdApplicationTests;
import com.example.inc_std.model.entity.OrderDetail;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

public class OrderDetailRepositoryTest extends IncStdApplicationTests {

    /*

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Test
    public void create() {
        OrderDetail orderDetail = new OrderDetail();

        orderDetail.setOrderAt(LocalDateTime.now());
//        orderDet.setUserId(4L); // 어떤 사람 // Long 에서 User 로 바뀌었기 때문
//        orderDet.setItemId(1L); // 어떤 상품

        OrderDetail newOrderDetail = orderDetailRepository.save(orderDetail);
        Assertions.assertNotNull(newOrderDetail);
    }

     */
}
