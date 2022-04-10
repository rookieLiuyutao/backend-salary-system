package com.yutao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author yutao
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class YuTaoApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(YuTaoApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  启动成功  ");
    }
}
