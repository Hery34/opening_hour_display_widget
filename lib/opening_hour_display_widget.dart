import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpeningHourDisplayWidget extends StatelessWidget {
  final String openTitle;
  final String closeTitle;
  final String openDescription;
  final String closeDescription;
  final Color openColor;
  final Color closeColor;
  final double boxWidth;
  final double iconSize;
  final double textSize;
  final int openHour;
  final int closeHour;
  final Color openHourBackgroundColor;
  final Color closeHourBackgroundColor;

  const OpeningHourDisplayWidget({
    super.key,
    this.openTitle = 'Open',
    this.closeTitle = 'Closed',
    this.openDescription = 'Closed at 18h00',
    this.closeDescription = 'Open at 9h00',
    this.openColor = Colors.green,
    this.closeColor = Colors.red,
    this.boxWidth = 220,
    this.iconSize = 15,
    this.textSize = 12,
    this.openHour = 9,
    this.closeHour = 18,
    this.openHourBackgroundColor = Colors.white,
    this.closeHourBackgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return getBoxStatusText();
  }

  Widget getBoxStatusText() {
    var now = DateTime.now();
    var openTime = DateTime(now.year, now.month, now.day, openHour);
    var closeTime = DateTime(now.year, now.month, now.day, closeHour);

    Widget boxStatusWidget;
    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      boxStatusWidget = _buildOpenBox();
    } else {
      boxStatusWidget = _buildCloseBox();
    }

    return boxStatusWidget;
  }

  Widget _buildOpenBox() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: SizedBox(
            width: boxWidth,
            child: Row(
              children: [
                Icon(CupertinoIcons.clock_solid,
                    color: openColor, size: iconSize),
                const SizedBox(width: 4),
                Center(
                  child: Column(
                    children: [
                      Text(
                        openTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: openColor,
                          fontFamily: 'Poppins',
                          fontSize: textSize,
                        ),
                      ),
                      Text(
                        openDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: openColor,
                          fontFamily: 'Poppins',
                          fontSize: textSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseBox() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: SizedBox(
            width: boxWidth,
            child: Row(
              children: [
                Icon(CupertinoIcons.clock_solid,
                    color: closeColor, size: iconSize),
                const SizedBox(width: 12),
                Center(
                  child: Column(
                    children: [
                      Text(
                        closeTitle,
                        style: TextStyle(
                          color: closeColor,
                          fontFamily: 'Poppins',
                          fontSize: textSize,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        closeDescription,
                        style: TextStyle(
                          color: closeColor,
                          fontFamily: 'Poppins',
                          fontSize: textSize,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
