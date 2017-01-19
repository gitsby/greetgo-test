package com.github.greetgo.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Kasyanov Maxim on 1/19/2017.
 */
@Controller
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String homeView(){
        return "index";
    }
}
