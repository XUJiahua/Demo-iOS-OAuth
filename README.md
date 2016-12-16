# Demo-iOS-OAuth
iOS应用间通信，使用App授权其他App登录

模拟浏览器上的OAuth登录：

1. App1 使用 App2 登录，传client_id、callback url 给App2；
2. App2 到 App2后台 /authorize，传client_id，取得grant_code（长时间不用，应该过期）；
3. App2 将 grant_code 回传给 App1，通过callback url；
4. App1 到 App1后台，传client_id，（也可以客户端直接连），App1后台访问App2后台 /token，传client_id, client_secret, grant_code，获得App2用户的accessToken。

client_id, client_secret, grant_code全部存在，才能获取用户的accessToken。client_secret尽量服务端存。
