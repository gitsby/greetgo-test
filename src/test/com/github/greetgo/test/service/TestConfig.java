package com.github.greetgo.test.service;

import com.github.greetgo.test.config.data.DataConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Created by Kasyanov Maxim on 1/25/2017.
 */
@Configuration
@Import(DataConfig.class)
@ComponentScan(basePackages = "com.github.greetgo.test.service")
public class TestConfig {
}
