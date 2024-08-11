/// 该文件是由脚本生成，不需要改动
/// 生成脚本命令: dart run scripts/platform.dart create
/// 生成时间: 2024-08-11 13:49:25.619788
/// version: 1723355348339
part of 'video_platform.dart';

class _VideoPlatform {
  final qq = VPlatform(
    'cXE=',
    '6IW+6K6v',
    'aHR0cHM6Ly92LnFxLmNvbQ==',
    const [
      VTab('dHY=', '55S16KeG5Ymn'),
      VTab('bW92aWU=', '55S15b2x'),
      VTab('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'cXE=',
    'cXE=',
    'cXE=',
    'Z2VuZXJhbA==',
  );

  final iqiyi = VPlatform(
    'aXFpeWk=',
    '54ix5aWH6Im6',
    'aHR0cHM6Ly93d3cuaXFpeWkuY29t',
    const [
      VTab('dHY=', '55S16KeG5Ymn'),
      VTab('bW92aWU=', '55S15b2x'),
      VTab('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'aXFpeWk=',
    'aXFpeWk=',
    'aXFpeWk=',
    'Z2VuZXJhbA==',
  );

  final youku = VPlatform(
    'eW91a3U=',
    '5LyY6YW3',
    'aHR0cHM6Ly95b3VrdS5jb20=',
    const [
      VTab('dHY=', '55S16KeG5Ymn'),
      VTab('bW92aWU=', '55S15b2x'),
      VTab('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'eW91a3U=',
    'eW91a3U=',
    'eW91a3U=',
    'Z2VuZXJhbA==',
  );

  final mgtv = VPlatform(
    'bWd0dg==',
    '6IqS5p6c',
    'aHR0cHM6Ly93d3cubWd0di5jb20=',
    const [
      VTab('dHY=', '55S16KeG5Ymn'),
      VTab('bW92aWU=', '55S15b2x'),
      VTab('Y2FydG9vbg==', '5Yqo5ryr'),
    ],
    'bWd0dg==',
    'bWd0dg==',
    'bWd0dg==',
    'Z2VuZXJhbA==',
  );

  final bilibili = VPlatform(
    'YmlsaWJpbGk=',
    'QuermQ==',
    'aHR0cHM6Ly93d3cuYmlsaWJpbGkuY29t',
    const [
      VTab('dmlkZW8=', '5o6o6I2Q'),
      VTab('YW5pbWU=', '55Wq5Ymn'),
    ],
    'YmlsaWJpbGk=',
    'YmlsaWJpbGk=',
    'YmlsaWJpbGk=',
    'Z2VuZXJhbA==',
  );

  /// 获取所有支持的平台
  List<VPlatform> get platforms => [
        qq,
        iqiyi,
        youku,
        mgtv,
        bilibili,
      ];

  /// 获取所有平台的名字
  List<String> get platformNames =>
      platforms.map((value) => value.name).toList();

  /// 根据link匹配对应的平台
  VPlatform? linkMatchPlatform(String link) {
    return platforms.firstWhere((value) => link.contains('${value.name}.com'));
  }

  /// 根据平台名字匹配对应的平台
  VPlatform? getPlatform(String platformName) {
    return platforms.firstWhere((value) => value.name == platformName);
  }
}
