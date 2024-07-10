package dev.ehyeon42.can;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String method() {
        return "노아 깃허브 액션으로 자동 배포 성공!";
    }
}
