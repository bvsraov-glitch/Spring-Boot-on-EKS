package com.example.springbootoneks;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@SpringBootApplication
@RestController
public class SpringBootEksApplication {

    @GetMapping("/greetings")
    public String message() {
        return "Welcome to javatechie ! app deployed in AWS EKS";
    }
    
    @GetMapping("/")
    public String helloWorld() {
        return "helloworld";
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringBootEksApplication.class, args);
    }
}
