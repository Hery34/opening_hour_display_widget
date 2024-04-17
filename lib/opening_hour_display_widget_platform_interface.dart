import 'package:opening_hour_display_widget/opening_hour_display_widget_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class OpeningHourDisplayWidgetPlatform extends PlatformInterface {
  /// Constructs a OpeningHourDisplayWidgetPlatform.
  OpeningHourDisplayWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpeningHourDisplayWidgetPlatform _instance =
      MethodChannelOpeningHourDisplayWidget();

  /// The default instance of [OpeningHourDisplayWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpeningHourDisplayWidget].
  static OpeningHourDisplayWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpeningHourDisplayWidgetPlatform] when
  /// they register themselves.
  static set instance(OpeningHourDisplayWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
