package org.mistah.steem4kids.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SigninController {
    @RequestMapping(value = "signin")
    public String signin() {
        return "signin/login";
    }
}
