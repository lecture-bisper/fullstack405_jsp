package bitc.fullstack405.study07;

// 자바빈즈 생성 규칙
// 1. 인수가 없는 기본 생성자가 반드시 존재해야 함
// 2. 클래스의 필드는 모두 private 접근제한자를 사용
// 3. 클래스의 필드는 모두 getter/setter를 가지고 있어야 함
public class Person {
  private String name;
  private int age;

  public Person() {}

  public Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}












