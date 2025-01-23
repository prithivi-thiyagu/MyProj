package com.example.MyProj;

import com.bandhanbank.esb.common.util.BaseDTOs.ProviderBaseDTOs.Reason;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @RequestMapping("test")
    public String getData(){

        Reason reason = Reason.builder().build();
        return "Its Success";
    }
}
