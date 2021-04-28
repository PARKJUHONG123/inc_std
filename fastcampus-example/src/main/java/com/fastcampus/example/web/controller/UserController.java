package com.fastcampus.example.web.controller;

import com.fastcampus.example.domain.entity.User;
import com.fastcampus.example.domain.repository.UserRepository;
import com.fastcampus.example.web.error.ApiException;
import com.fastcampus.example.web.error.ExceptionEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Slf4j
@RestController
@RequiredArgsConstructor
public class UserController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/users/me") // FIXME
    public User readme(@RequestHeader(value = "X-USER-ID", required = false) Long id) {
        if (id == null) {
            throw new ApiException(ExceptionEnum.INVALID_HEADER);
        }

        return userRepository.findById(id)
                .filter(user -> !user.getId().equals(6L))
                .orElseThrow( () -> new ApiException(ExceptionEnum.ACCESS_DENIED) );
    }

    @GetMapping("/users/{id}") // FIXME
    public User read(@PathVariable(name = "id") Long id) {
        return userRepository.findById(id)
                .orElseThrow( () -> new ApiException(ExceptionEnum.USER_NOT_FOUND) );
    }

    @PostMapping("/users") // FIXME
    public User create(@RequestBody User user) {

        // 수정 필요함
        if (user.getName() == null) {
            throw new ApiException(ExceptionEnum.INVALID_PARAMETER);
        }

        return userRepository.save(User.builder()
                .id(user.getId())
                .name(user.getName())
                .build());
    }

    @PutMapping("/users") // FIXME
    public User update(@RequestHeader(value = "X-USER-ID", required = false) Long id, @RequestBody User user) {
        if (id == null) {
            throw new ApiException(ExceptionEnum.INVALID_HEADER);
        }

        return userRepository.findById(id)
                .map(newUser -> {
                        String name = user.getName();

                        if (name == null) {
                            throw new ApiException(ExceptionEnum.INVALID_PARAMETER);
                        }

                        return User.builder()
                                .id(id)
                                .name(name)
                                .build();
                    })
                .map(newUser -> userRepository.save(newUser))
                .orElseThrow(()->new ApiException(ExceptionEnum.INVALID_HEADER));

    }

    @DeleteMapping("/users") // FIXME
    public User delete(@RequestHeader(value = "X-USER-ID", required = false) Long id) {
        if (id == null) {
            throw new ApiException(ExceptionEnum.INVALID_HEADER);
        }

        User user = userRepository.findById(id)
                    .orElseThrow( () -> new ApiException(ExceptionEnum.USER_NOT_FOUND) );

        userRepository.delete(user);

        User deletedUser = new User();
        deletedUser.setDeletedAt(LocalDateTime.now());

        return deletedUser;
    }
}
