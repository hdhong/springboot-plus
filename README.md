# springboot-plus
一个基于SpringBoot 2 的管理后台系统,包含了用户管理，组织机构管理，角色管理，功能点管理，菜单管理，权限分配，数据权限分配，代码生成等功能

系统基于Spring Boot2技术，前端采用了Layui2。数据库以MySQL为实例，理论上是跨数据库平台.

基本技术栈来源于我为电子工业出版社编写的的[<<Spring Boot 2 精髓 >>](http://ibeetl.com/sb2/#more) (这本书每一章也有各种例子，但Springboot-plus 更偏向于应用而不是教学)

技术交流群：219324263

开源地址：https://gitee.com/xiandafu/springboot-plus



![doc/readme/user.png](doc/readme/user.png)

![doc/readme/user.png](doc/readme/role.png)![doc/readme/user.png](doc/readme/data.png)![doc/readme/user.png](doc/readme/codegen.png)![doc/readme/user.png](doc/readme/codegen2.png)

# 1 使用说明

## 1.1 安装说明

从Git上获取代码后，通过IDE导入此Maven工程，包含俩个子工程

* admin-core  ，核心包，包含了缓存，数据权限，公用的JS和HTML页面。
* admin-console, 系统管理功能，包含了用户，组织机构，角色，权限，数据权限，代码生成等管理功能

com.ibeetl.admin.CosonleApplication 是系统启动类，在admin-console包下,在运行这个之前，还需要初始化数据库，位于doc/starter-mysql.sql,目前只提供mysql脚本。理论上支持所有数据库

还需要修改SpringBoot配置文件application.properties,修改你的数据库地址和访问用户

~~~properties
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/starter?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT%2B8&useSSL=false
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
~~~

运行CosonleApplication，然后访问http://127.0.0.1:8080/  输入admin/123456 则可以直接登录进入管理系统

> 建议在彻底熟悉plus系统之前，先暂时不要修改其他配置选项，免得系统无法访问
>
> 本系统基于Spring Boot 2 ，因此请务必使用JDK8，且打开编译选项[parameters](http://www.mamicode.com/info-detail-2162647.html)

## 1.2 创建子系统

SpringBoot-plus 是一个适合大系统拆分成小系统的架构，或者是一个微服务系统，因此，如果你需要创建自己的业务系统，比如，一个CMS子系统，建议你不要在SpringBoot-Plus 添加代码，应该是新建立一个maven工程，依赖admin-core，或者依赖admin-console（如果你有后台管理需求，通常都有，但不是必须的）

创建一个业务子系统，需要如下方式

* 在IDE里创建一个Maven工程
* 将Maven工程改造为Spring Boot工程，如果你不熟悉Spring Boot，可以参考SpringBoot-plus 或者copy如下片段

~~~xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.sample</groupId>
  <artifactId>cms</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <properties>
    <java.version>1.8</java.version>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.0.0.RC1</version>
  </parent>
  <!-- plus依赖 -->
  <dependency>
    <groupId>com.ibeetl</groupId>
    <artifactId>admin-core</artifactId>
    <version>1.0</version>
  </dependency>
  <dependency>
    <groupId>com.ibeetl</groupId>
    <artifactId>admin-console</artifactId>
    <version>1.0</version>
  </dependency>
  <!-- 其他Spring Boot依赖 -->
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
  </dependency>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <optional>true</optional>
  </dependency>

  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
  </dependency>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-aop</artifactId>
  </dependency>

  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-cache</artifactId>
  </dependency>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
  </dependency>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
  </dependency>
  <!-- 其他你自己需要的类库 -->
  <dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>6.0.5</version>
  </dependency>
  </dependencies>
<repositories>
  <repository>
    <id>spring-snapshots</id>
    <url>http://repo.spring.io/snapshot</url>
    <snapshots>
      <enabled>true</enabled>
    </snapshots>
  </repository>
  <repository>
    <id>spring-milestones</id>
    <url>http://repo.spring.io/milestone</url>
  </repository>
</repositories>
<pluginRepositories>
  <pluginRepository>
    <id>spring-snapshots</id>
    <url>http://repo.spring.io/snapshot</url>
  </pluginRepository>
  <pluginRepository>
    <id>spring-milestones</id>
    <url>http://repo.spring.io/milestone</url>
  </pluginRepository>
</pluginRepositories>
</project>

~~~

* 新创建一个CMSApplication 入口

~~~java
package com.sample.cms;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.WebApplicationInitializer;
@SpringBootApplication
@EnableCaching
@ComponentScan(basePackages= {"com.sample.cms","com.ibeetl.admin"})
public class CMSApplication  extends SpringBootServletInitializer implements WebApplicationInitializer {
  public static void main(String[] args) {
    SpringApplication.run(CMSApplication.class, args);
  }
}	

~~~



运行此程序，然后再次访问http://127.0.0.1:8080/  你会发现你的的CMS子系统已经具备了所有基础功能，你只需要向此工程添加跟CMS相关功能即可

## 1.3 代码生成

在介绍如何利用Plus开发系统之前，先介绍代码生成功能，此功能可以生成前后端代码总计14个文件，你可以通过预览功能了解如何开发这个系统

待续....

