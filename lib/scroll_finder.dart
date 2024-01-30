import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_notification_test/scrollable_description.dart';

class ScrollableFinder {
  Iterable<ScrollableDescription> getAllScrollableDescriprionsOnScreen() {
    final scrollablesOnScreen =
        find.byType(Scrollable).hitTestable().evaluate();

    print(
        '🔥 All Scrollables retrieved: scrollablesOnScreen: $scrollablesOnScreen 🔥\n\n');
    final extractedScrollableDescriptions = scrollablesOnScreen
        .map((item) {
          try {
            print(
                '=====================> GET SCROLL DETAILS PROCESS ${item}\n\n');
            // (scrollablesOnScreen.first as Scrollable).state.position.pixels
            RenderBox renderBox = item.findRenderObject() as RenderBox;

            print('RenderBox: $renderBox');
            Offset globalPostion = renderBox.localToGlobal(Offset.zero);

            print('globalPosition: $globalPostion');

            // TASK: Get the scroll position here
            final position =
                (item.widget as Scrollable).controller?.positions.first ??
                    (item.widget as Scrollable).controller?.position;

            if (position != null) {
              final scrollExtentByPixels = position.pixels;
              final maxScrollExtentByPixels = position.maxScrollExtent;
              final axis = position.axis;
              final rect = Rect.fromPoints(
                globalPostion,
                globalPostion.translate(
                  renderBox.size.width,
                  renderBox.size.height,
                ),
              );

              print('=====================> END OF PROCESS (SUCCESS) ✅ \n\n\n');

              return ScrollableDescription(
                axis: axis,
                rect: rect,
                scrollExtentByPixels: scrollExtentByPixels,
                maxScrollExtentByPixels: maxScrollExtentByPixels,
              );
            } else {
              print(
                'scroll controller is null, we need to get the solution',
              );
              print('=====================> END OF PROCESS (FAILED) ❌ \n\n\n');
            }
          } catch (e) {
            print(e);
            print('=====================> END OF PROCESS (FAILED) ❌ \n\n\n');
            return null;
          }
        })
        .where((element) => element != null)
        .cast<ScrollableDescription>();

    print('extractedScrollableDescriptions: $extractedScrollableDescriptions');

    return extractedScrollableDescriptions;
  }
}
