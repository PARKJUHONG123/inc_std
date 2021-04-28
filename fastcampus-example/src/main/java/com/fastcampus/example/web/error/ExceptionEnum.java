package com.fastcampus.example.web.error;

import lombok.Getter;
import lombok.ToString;
import org.springframework.http.HttpStatus;

@Getter
@ToString
public enum ExceptionEnum {
    BOOK_META_NOT_FOUND (HttpStatus.INTERNAL_SERVER_ERROR, "BOOK_META_NOT_FOUND", "책이 존재하지 않음"),
    BOOK_META_INVALID_PARAMETER (HttpStatus.INTERNAL_SERVER_ERROR, "BOOK_META_INVALID_PARAMETER", "파라미터가 비어져 있음"),
    USER_NOT_FOUND (HttpStatus.NOT_FOUND, "USER_NOT_FOUND", "유저가 존재하지 않음"),
    INVALID_HEADER (HttpStatus.BAD_REQUEST,"INVALID_HEADER", "헤더를 넣지 않음"),
    ACCESS_DENIED (HttpStatus.FORBIDDEN,"ACCESS_DENIED", "탈퇴한 회원이 본인 정보를 조회할 수 없음"),
    INVALID_PARAMETER (HttpStatus.BAD_REQUEST,"INVALID_PARAMETER", "파라미터가 비어져 있음"),
    NOT_FOUND (HttpStatus.NOT_FOUND, "NOT_FOUND", "판매중인 상품이 없거나 숨김처리 되어 있음");

    private final HttpStatus status;
    private final String code;
    private String message;
    ExceptionEnum(HttpStatus status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
