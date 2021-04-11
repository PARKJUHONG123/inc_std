package com.example.inc_std.controller;

import com.example.inc_std.model.SearchParam;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api") //localhost:8080/api
public class GetController {
    @RequestMapping(method = RequestMethod.GET, path = "/getMethod") //localhost:8080/api/getMethod
    // localhost:8080/api/getMethod?id=1234 를 입력해도 똑같은 화면이 보임
    public String getRequest() {
        return "Hi, getMethod";
    }

    // @getMapping 어노테이션은 @RequestMapping과 다르게 메소드를 지정하지 않아도 되고, 주소만 설정해주면 됨
    @GetMapping("/getParameter") // localhost:8080/api/getParameter?id=1234&password=abcd
    public String getParameter(@RequestParam String id, @RequestParam String password) {
        // String password = "bbbb"; // 스프링에서는 매개변수와 지역변수 명이 같은 것을 허용하지 않음
        System.out.println("ID : " + id);
        System.out.println("PASSWORD : " + password);

        return id + password;
    }

    @GetMapping("/getLocalParameter") // localhost:8080/api/getParameterLocal?id=1234&password=abcd
    public String getLocalParameter(@RequestParam String id, @RequestParam(name = "password") String pwd) {
        String password = "bbbb"; // 굳이 재설정해야 겠다고 하면 위와 같이 password 로 설정된 parameter 가 pwd 매칭되게 함
        System.out.println("ID : " + id);
        System.out.println("PASSWORD : " + password);
        System.out.println("pwd : " + pwd);

        return id + password + pwd;
    }

    // localhost:8080/api/getMultiParameter?account=abcd&email=study&gmail.com&page=10
    // 뒤에 변수가 계속 늘어나는 상황 (계속해서 적어줄 수 없기 때문에 객체로 받음)
    @GetMapping("/getMultiParameter")
    public SearchParam getMultiParameter(SearchParam searchParam) {
        System.out.println(searchParam.getAccount());
        System.out.println(searchParam.getEmail());
        System.out.println(searchParam.getPage());

        // json 파일 형식으로 Spring 이 내려줌 {"account" : "", "email" : "", "page" : 0}
        return searchParam;

        // servlet 이나 spring 에서는 maven gradle 을 통해서 json library 를 통해 가져와야 했으나 spring boot 는 최근 표준 규약처럼 여겨지는 json 파일 양식으로 가져옴
    }

    /*
    HTTP - GET Method
    - 주소 창에 파라미터가 노출된다
    - 브라우저에서 주소에 대한 캐시가 이루어지므로, 정보를 얻을 때 사용함
     */
}
