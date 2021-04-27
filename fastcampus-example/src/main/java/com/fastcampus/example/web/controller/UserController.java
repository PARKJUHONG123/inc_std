package com.fastcampus.example.web.controller;

import com.fastcampus.example.domain.entity.User;
import com.fastcampus.example.domain.repository.UserRepository;
import com.fastcampus.example.web.error.ApiException;
import com.fastcampus.example.web.error.ExceptionEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequiredArgsConstructor
public class UserController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/users/me") // FIXME
    public User read() {

    }

    @GetMapping("/users/{id}") // FIXME
    public User read(@PathVariable(name = "id") Long id) {
        return userRepository.findById(id)
            .orElseThrow( () -> new ApiException(ExceptionEnum.USER_NOT_FOUND) );
    }
//    @PostMapping("/users") // FIXME

//    @PutMapping("/users") // FIXME

//    @DeleteMapping("/users") // FIXME
}
