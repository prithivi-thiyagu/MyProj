package com.example.MyProj;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @RequestMapping("test")
    public String getData(){
        return "Its Success";
    }
}
