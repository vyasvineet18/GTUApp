package com.gtuapp.swagger;

import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

//setup from - http://www.baeldung.com/swagger-2-documentation-for-spring-rest-api
//url - http://localhost:8080/gtuapp/swagger-ui.html

@EnableSwagger2
public class ApplicationSwaggerConfig {
	@Bean
    public Docket api() { 
        return new Docket(DocumentationType.SWAGGER_2)  
          .select()                                  
          .apis(RequestHandlerSelectors.basePackage("com.gtuapp.rest"))             
          //.paths(PathSelectors.ant("/rest/*"))                          
          .build()
          .apiInfo(apiInfo());
    }
	
	private ApiInfo apiInfo() {
	    ApiInfo apiInfo = new ApiInfo(
	      "GTU APP REST API",
	      "These are the rest apis for gtu mobile application and other applications.",
	      "API V1.0",
	      "Terms of service",
	      "vyasvineet18@gmail.com",
	      "License of API",
	      "http://www.bitzscript.com");
	    return apiInfo;
	}
}
