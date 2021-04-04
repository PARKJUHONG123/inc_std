package com.example.inc_std.controller;

import com.example.inc_std.model.SearchParam;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api") // 클래스가 다를 경우에는 같은 mapping 주소여도 사용 가능
public class PostController {

    // HTML 의 <form> 태그
    // ajax 의 검색 에 사용됨
    // 검색 파라미터가 많은 경우에 사용됨
    // http post body -> data
    // json, xml, multipart-form / text-plain

    // @PostMapping("/postMethod")     // @RequestMapping(method = RequestMethod.Post, path = "/postMethod") 와 같은 의미
    @PostMapping(value = "/postMethod", produces = {"application/json"}) // 어떠한 형태로 받을 것인지 결정 가능 (기본은 json)
    public SearchParam postMethod(@RequestBody SearchParam searchParam) {
        System.out.println("OK");
        return searchParam;
    }

    @PutMapping("/putMethod")
    public void put() {

    }

    @PatchMapping("/patchMethod")
    public void patch() {

    }
}

/*
    HTTP - POST
    - 주소 창에 파라미터가 노출되지 않음
    - ex) www.localhost:8080/search, www.google.com/search
    - 주소 차엥 사용자의 요청 사항이 노출되지 않음
    - Get 방식에서는 주소 길이 제한이 있지만 POST 는 그보다 길게 사용 가능 (제한 존재)
    - 브라우저가 주소 캐시를 하지 못하는 특성이 있음
 */

/*
    HTTP - PUT/PATCH
    - POST 와 마찬가지로 BODY 에 데이터가 들어 있음
    - 주로 연결된 DB의 데이터 업데이트에 사용됨
 */

/*
    HTTP - DELETE
    - GET 과 마찬가지로 주소에 파라미터가 들어 있음
    - 주로 연결된 DB의 데이터 삭제에 사용됨
 */

/*
    REST 의 개념
    - HTTP 프로토콜에 있는 METHOD 를 활용한 아키텍처 스타일
    - HTTP Method 를 통해서 Resource 를 처리함
    - CRUD 를 통한 Resource 조작을 할 때 사용함

    GET         조회 (SELECT * READ)      /user/{id}
    POST        생성 (CREATE)             /user
    PUT/PATCH   수정 (UPDATE) * CREATE    /user
    DELETE      삭제 (DELETE)             /user/{1}
 */