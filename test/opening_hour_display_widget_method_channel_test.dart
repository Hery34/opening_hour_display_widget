import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opening_hour_display_widget/opening_hour_display_widget_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MethodChannelOpeningHourDisplayWidget', () {
    late MethodChannelOpeningHourDisplayWidget
        methodChannelOpeningHourDisplayWidget;

    setUp(() {
      methodChannelOpeningHourDisplayWidget =
          MethodChannelOpeningHourDisplayWidget();
    });

    test('getPlatformVersion', () async {
      const mockPlatformVersion = '1.0.0';
      const channel = MethodChannel('OpeningHourDisplayWidget');

      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getPlatformVersion') {
          return mockPlatformVersion;
        }
        return null;
      });

      final platformVersion =
          await methodChannelOpeningHourDisplayWidget.getPlatformVersion();

      expect(platformVersion, mockPlatformVersion);
    });
  });
}
