package kr.ac.kopo.ctc.kopo28.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    @GetMapping("/")       // http://localhost:8080/
    public String home() { // 템플릿 쓰면 "index" 반환, 아니면 다른 뷰 이름
        return "redirect:/index.html";    // templates/index.html (Thymeleaf) 또는 JSP 설정에 맞게
    }
}