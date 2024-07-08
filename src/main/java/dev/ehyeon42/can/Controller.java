package dev.ehyeon42.can;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String method() {
        return "KCS-task-13-noah, Hello, world!";
    }
}
