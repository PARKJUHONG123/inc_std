# Communication
## Socket
- 접속을 계속 유지하여, 데이터를 전달 한다.
- 서버의 자원에 따라서 연결될 수 있는 클라이언트의 숫자가 한정된다.
- 실시간 정보 교환에 사용하며 HTTP보다 속도가 빠르다.

## HTTP
- 클라이언트의 요청이 있을 때만 데이터 응답을 전달한다.
- 불필요한 자원의 점유를 없애 다른 접속을 원활하게 하여 많은 데이터를 처리한다.
- 데이터 요청 후 응답이 오면 연결은 끊어진다.

# Rest API
## HTTP – GET Method
- 주소 창에 파라미터가 노출 된다.
- Example www.localhost:8080/search?id=account&password=1234
 www.google.com/search?id=abcd
- 브라우저에서 주소에 대한 캐시가 이루어 지므로, 정보를 얻을 때 사용 한다

## HTTP – POST Method
- 주소 창에 파라미터가 노출 되지 않는다.
- Example www.localhost:8080/search
 www.google.com/search
- 주소 창에 사용자의 요청 사항이 노출 되지 않는다.
- Get 방식에서는 주소 길이 제한이 있지만 POST는 그보다 길게 사용 가능 (제한 존재)
- 브라우저가 주소 캐시를 하지 못 하는 특성이 있다

## HTTP – PUT/PATCH Method
- POST와 마찬가지로 BODY에 데이터가 들어감
- 주로 업데이트에 사용

## HTTP – DELETE Method
- GET과 마찬가지로 주소에 파라미터가 들어감
- 데이터를 삭제 할 때 사용

# JPA
- ORM ( Object Relational Mapping) 으로, RDB 데이터 베이스의 정보를 객체지향으로 손쉽게 활용할 수 있도록 도와주는 도구 이다.
- Object(자바객체)와 Relation(관계형 데이터베이스) 둘간의 맵핑을 통해서 보다 손쉽게 적용할 수 있는 기술을 제공해준다.
- 쿼리에 집중 하기 보다는 객체에 집중 함으로써, 조금 더 프로그래밍 적으로 많이 활용 할 수 있다.

## Entity
- JPA에서는 테이블을 자동으로 생성해주는 기능 존재.
- DB Table == JPA Entity
- Jpa의 Entity 및 column 은 자동으로 camel case -> DB 의 snake_case에 매칭

### Camel Case
- 단어를 표기할 때 첫 문자는 소문자로 시작하며 띄어쓰기 대신 ( 대문자 )로 단어를 구분
- Java의 변수를 선언할 때 camelCase 로 선언한다.
- ex) phoneNumber , createdAt, updatedAt

### Snake Case
- 단어를 표기할 때 모두 소문자로 표기하며, 띄어쓰기 대신 ( _ ) 로 표기
- DB 컬럼에 사용
- ex) phone_number, created_at, updated_at
- API를 정의하기에 따라 다르지만, 주로 API통신 규격에는 구간에서는 Snake Case를 많이 사용

|Annotation|용도|
|:--:|:--:|
|@Entity|해당 Class가 Entity임을 명시|
|@Table|실제 DB테이블의 이름을 명시|
|@Id|Index primary key를 명시|
|@Column|실제 DB Column의 이름을 명시|
|@GeneratedValue|Primary key 식별키의 전략 설정|

## Repository
- 따로 쿼리문 을 작성하지 않아도 기본적인 CRUD 제공

```
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
```

## JPA 연관관계

|관계|Annotation|
|:--:|:--:|
|일대일|@OneToOne|
|일대다|@OneToMany|
|다대일|@ManyToOne|
|다대다|@ManyToMany|