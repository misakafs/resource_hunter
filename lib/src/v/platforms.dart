import 'v_platform.dart';

/// 该文件是由脚本生成，不需要改动
/// 生成脚本命令: dart run scripts/platforms.dart create
/// 生成时间: 2024-08-18 13:54:04.984505
/// version: 1723771962328

///
class VideoPlatforms {
  ///
  static final qq = VPlatform(
    'cXE=',
    '6IW+6K6v',
    'aHR0cHM6Ly92LnFxLmNvbQ==',
    const [
      VChannel('dHY=', '55S16KeG5Ymn'),
      VChannel('bW92aWU=', '55S15b2x'),
      VChannel('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'cXE=',
    'cXE=',
    'cXE=',
    'Z2VuZXJhbA==',
  );

  ///
  static final iqiyi = VPlatform(
    'aXFpeWk=',
    '54ix5aWH6Im6',
    'aHR0cHM6Ly93d3cuaXFpeWkuY29t',
    const [
      VChannel('dHY=', '55S16KeG5Ymn'),
      VChannel('bW92aWU=', '55S15b2x'),
      VChannel('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'aXFpeWk=',
    'aXFpeWk=',
    'aXFpeWk=',
    'Z2VuZXJhbA==',
  );

  ///
  static final youku = VPlatform(
    'eW91a3U=',
    '5LyY6YW3',
    'aHR0cHM6Ly95b3VrdS5jb20=',
    const [
      VChannel('dHY=', '55S16KeG5Ymn'),
      VChannel('bW92aWU=', '55S15b2x'),
      VChannel('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'eW91a3U=',
    'eW91a3U=',
    'eW91a3U=',
    'Z2VuZXJhbA==',
  );

  ///
  static final mgtv = VPlatform(
    'bWd0dg==',
    '6IqS5p6c',
    'aHR0cHM6Ly93d3cubWd0di5jb20=',
    const [
      VChannel('dHY=', '55S16KeG5Ymn'),
      VChannel('bW92aWU=', '55S15b2x'),
      VChannel('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'bWd0dg==',
    'bWd0dg==',
    'bWd0dg==',
    'Z2VuZXJhbA==',
  );

  ///
  static final bilibili = VPlatform(
    'YmlsaWJpbGk=',
    'QuermQ==',
    'aHR0cHM6Ly93d3cuYmlsaWJpbGkuY29t',
    const [
      VChannel('dmlkZW8=', '5o6o6I2Q'),
      VChannel('YW5pbWU=', '55Wq5Ymn'),
    ],
    'YmlsaWJpbGk=',
    'YmlsaWJpbGk=',
    'YmlsaWJpbGk=',
    'Z2VuZXJhbA==',
  );

  /// 获取所有支持的平台
  static List<VPlatform> get platforms => [
        qq,
        iqiyi,
        youku,
        mgtv,
        bilibili,
      ];

  /// 获取所有平台的名字
  static List<String> get platformNames =>
      platforms.map((value) => value.name).toList();

  /// 根据link匹配对应的平台
  static VPlatform? linkMatchPlatform(String link) {
    return platforms.firstWhere((value) => link.contains('${value.name}.com'));
  }

  /// 根据平台名字匹配对应的平台
  static VPlatform? getPlatform(String platformName) {
    return platforms.firstWhere((value) => value.name == platformName);
  }
}
