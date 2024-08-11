import 'package:resource_hunter/resource_hunter.dart';

void main() async {
  final startTime = DateTime.now();

  final v = VideoPlatform();

  final r = await v.query(VideoQueryParam(
    platform: v.qq.name,
    channel: '100113',
  ));

  final endTime = DateTime.now();

  // 计算并输出运行时长
  final duration = endTime.difference(startTime);
  print('运行时长: ${duration.inMilliseconds}毫秒');

  print(r.next);

  print(r.items.length);

  r.items.forEach((v) {
    print('${v.title}, ${v.cid}, ${v.link}');
  });
}

// 英雄联盟, mzc00200o6bdt4b,
// https://v.qq.com/x/cover/mzc00200o6bdt4b.html
// https://v.qq.com/x/cover/mzc00200o6bdt4b/x410079u0rr.html
