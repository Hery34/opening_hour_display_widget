import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:opening_hour_display_widget/opening_hour_display_widget_platform_interface.dart';

/// An implementation of [OpeningHourDisplayWidgetPlatform] that uses method channels.
class MethodChannelOpeningHourDisplayWidget
    extends OpeningHourDisplayWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('OpeningHourDisplayWidget');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
