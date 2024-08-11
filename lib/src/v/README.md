# 视频字段说明

- platform

```text

```

- channel 

```text
电视剧 - tv
电影 - movie
动漫 - cartoon
综艺 - variety
少儿 - child
纪录片 - doco
短剧 - minidrama
```

| 字段           | 类型     | 说明               | 补充                           |
|--------------|--------|------------------|------------------------------|
| platform     | string | 视频平台             | qq/iqiyi                     |
| channel      | string | 视频频道             | tv/movie                     |
| link         | string | 视频实际地址，需要解析的视频链接 |                              |
| pid          | string | 解析视频的唯一ID        | 算法: md5(platformName + link) |
| cid          | string | 视频平台视频唯一ID       |                              |
| vid          | string | 视频某一剧集唯一ID       |                              |
| cover        | string | 视频封面             |                              |
| coverHz      | string | 视频横版封面           |                              |
| coverVt      | string | 视频竖版封面           |                              |
| title        | string | 视频标题             |                              |
| subTitle     | string | 视频副标题            |                              |
| info         | string | 视频描述             |                              |
| timeLong     | string | 视频时长             | 24集/2小时                      |
| year         | string | 视频年份             | 2024                         |
| genre        | string | 视频体裁             | 亲情/爱情                        |
| language     | string | 视频语言             | 普通话                          |
| area         | string | 视频地区             | 大陆/欧美                        |
| actors       | string | 视频演员             | 李星云·姬如雪                      |
| url          | string | 视频播放链接           | eg: mp4/m3u8                 |
| disposable   | int    | url可以使用的次数       | 0 - 永久; 1 - 只能使用一次           |
| status       | int    | 解析状态             | 0 - 未解析; 1 - 不能解析; 2 - 解析成功  |
| createTime   | int    | 创建时间戳            |                              |
| updateTime   | int    | 更新时间戳            |                              |
