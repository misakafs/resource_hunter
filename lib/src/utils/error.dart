///
class ResourceHunterException implements Exception {
  /// 错误信息
  final String message;

  /// 错误栈
  final StackTrace? stackTrace;

  ///
  ResourceHunterException(this.message, [this.stackTrace]);

  @override
  String toString() {
    // 返回错误消息和堆栈跟踪
    return '[ResourceHunterException] $message\nStack Trace:\n$stackTrace';
  }
}
