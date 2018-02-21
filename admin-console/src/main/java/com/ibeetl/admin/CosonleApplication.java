package com.ibeetl.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.web.WebApplicationInitializer;

@SpringBootApplication
@EnableCaching
public class CosonleApplication  extends SpringBootServletInitializer implements WebApplicationInitializer {
	
    public static void main(String[] args) {
    	
    	SpringApplication.run(CosonleApplication.class, args);
    }



}	