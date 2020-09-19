package com.docker.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DockerMicroservicesApplication
{

    @RequestMapping("/")
    public String home() {
        return "Hello Docker Microservices World";
    }

    public static void main(String[] args)
    {
        SpringApplication.run(DockerMicroservicesApplication.class, args);
    }

}
