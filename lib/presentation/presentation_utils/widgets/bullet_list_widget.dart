import 'package:flutter/material.dart';

class BulletListWidget extends StatelessWidget {
  final List<String> texts;
  final List<Widget>? optionalWidgets;
  final double? spacing;
  final Widget? bulletPointWidget;
  final List<Widget>? customTextWidget;
  final Color? bulletPointColor;
  final TextStyle? textStyle;
  final TextStyle? bulletStyle;
  final bool? shouldShowIndex;

  const BulletListWidget({
    required this.texts,
    this.optionalWidgets,
    this.spacing,
    this.bulletPointWidget,
    this.customTextWidget,
    this.bulletPointColor,
    this.textStyle,
    this.bulletStyle,
    this.shouldShowIndex,
    super.key,
  }) : assert(optionalWidgets != null
      ? customTextWidget != null
      ? customTextWidget.length == optionalWidgets.length
      : texts.length == optionalWidgets.length
      : true);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];

    if (customTextWidget != null) {
      for (int i = 0; i < customTextWidget!.length; i++) {
        // Add list item
        widgetList.add(
          UnorderedListItem(
            index: (i + 1).toString(),
            textStyle: textStyle,
            bulletStyle: bulletStyle,
            bulletPointColor: bulletPointColor,
            bulletPointWidget: bulletPointWidget,
            shouldShowIndex: shouldShowIndex ?? false,
            optionalWidget: optionalWidgets?[i],
            customTextWidget: customTextWidget?[i],
          ),
        );

        // Add space between items
        widgetList.add(
          SizedBox(
            height: spacing ?? 4.0,
          ),
        );
      }
    } else {
      for (int i = 0; i < texts.length; i++) {
        // Add list item
        widgetList.add(
          UnorderedListItem(
            text: texts[i],
            index: (i + 1).toString(),
            textStyle: textStyle,
            bulletStyle: bulletStyle,
            bulletPointColor: bulletPointColor,
            bulletPointWidget: bulletPointWidget,
            shouldShowIndex: shouldShowIndex ?? false,
            optionalWidget: optionalWidgets?[i],
            customTextWidget: customTextWidget?[i],
          ),
        );
        // Add space between items
        widgetList.add(
          SizedBox(
            height: spacing ?? 4.0,
          ),
        );
      }
    }

    return Column(
      children: widgetList,
    );
  }
}

class UnorderedListItem extends StatelessWidget {
  final String? text;
  final String index;
  final Color? bulletPointColor;
  final TextStyle? textStyle;
  final TextStyle? bulletStyle;
  final Widget? bulletPointWidget;
  final Widget? optionalWidget;
  final Widget? customTextWidget;
  final bool shouldShowIndex;

  const UnorderedListItem({
    this.text,
    required this.index,
    this.bulletPointColor,
    this.textStyle,
    this.bulletStyle,
    this.bulletPointWidget,
    this.customTextWidget,
    this.optionalWidget,
    required this.shouldShowIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: optionalWidget != null,
          child: Padding(
            padding: EdgeInsets.only(
              right: 8.0,
            ),
            child: optionalWidget,
          ),
        ),
        bulletPointWidget ??
            Text(
              shouldShowIndex ? '$index. ' : "• ",
              style: bulletStyle ??
                  TextStyle(
                    color: bulletPointColor ?? Theme.of(context).colorScheme.secondary,
                  ),
            ),
        customTextWidget ??
            Expanded(
              child: Text(
                text!,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
      ],
    );
  }
}
