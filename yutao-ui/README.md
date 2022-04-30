## 开发

```bash


# 进入项目目录
cd yutao-ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev
```

## 部署前注意事项
1.将后台中`yutao-admin/src/main/resources/application-druid.yml`中的mysql地址改为：
```shell
jdbc:mysql://yutao-mysql:3306/yutao_data?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
```
以上的`yutao-mysql:3306`是mysql容器名字，是在`docker-compose`中定义的；
`yutao_data` 是在`docker-compose`中定义的数据库名

2.将后台中`yutao-admin/src/main/resources/application.yml`中的redis地址改为:`yutao-redis`
这里的yutao-redis 是redis容器的服务名

3.在 `vue.config.js`中看一下请求的后端地址，要和 `yutao-admin/src/main/resources/application.yml`中定义的地址和端口号保持一致


## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```