/// 该文件是由脚本生成，不需要改动
/// 生成脚本命令: dart run scripts/platform.dart create
/// 生成时间: 2024-08-04 17:14:55.146687
/// version: 1722762889852
part of 'video_platform.dart';

class _VideoPlatform {
  final qq = VPlatform(
    'cXE=',
    '6IW+6K6v',
    'aHR0cHM6Ly92LnFxLmNvbQ==',
    const [
      VTab('tv', '电视剧'),
      VTab('movie', '电影'),
      VTab('cartoon', '动漫'),
    ],
    'cXE=',
    'cXE=',
    'Z2VuZXJhbA==',
  );

  final iqiyi = VPlatform(
    'aXFpeWk=',
    '54ix5aWH6Im6',
    'aHR0cHM6Ly93d3cuaXFpeWkuY29t',
    const [
      VTab('tv', '电视剧'),
      VTab('movie', '电影'),
      VTab('cartoon', '动漫'),
    ],
    'aXFpeWk=',
    'aXFpeWk=',
    'Z2VuZXJhbA==',
  );

  final mgtv = VPlatform(
    'bWd0dg==',
    '6IqS5p6c',
    'aHR0cHM6Ly93d3cubWd0di5jb20=',
    const [
      VTab('tv', '电视剧'),
      VTab('movie', '电影'),
      VTab('cartoon', '动漫'),
    ],
    'bWd0dg==',
    'bWd0dg==',
    'Z2VuZXJhbA==',
  );

  final bilibili = VPlatform(
    'YmlsaWJpbGk=',
    'QuermQ==',
    'aHR0cHM6Ly93d3cuYmlsaWJpbGkuY29t',
    const [
      VTab('video', '推荐'),
      VTab('anime', '番剧'),
    ],
    'YmlsaWJpbGk=',
    'YmlsaWJpbGk=',
    'Z2VuZXJhbA==',
  );

  /// 获取所有支持的平台
  List<VPlatform> get platforms => [
        qq,
        iqiyi,
        mgtv,
        bilibili,
      ];

  /// 获取所有平台的名字
  List<String> get platformNames =>
      platforms.map((value) => value.name).toList();

  /// 根据link匹配对应的平台
  VPlatform? linkMatchPlatform(String link) {
    return platforms.firstWhere((value) => link.contains('${value.key}.com'));
  }
}
