package dev.ehyeon42.can;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String method() {
        return "노아 롤링 배포 성공!";
    }
}
