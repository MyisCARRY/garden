import 'package:flutter/material.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/core/helper/widget_ext.dart';
import 'package:garden/core/style/border_radiuses.dart';
import 'package:garden/core/style/colors.dart';
import 'package:garden/core/style/paddings.dart';
import 'package:garden/core/style/text_styles.dart';

class OverlayListPicker<T> extends StatefulWidget {
  const OverlayListPicker({
    required this.values,
    required this.toText,
    required this.child,
    required this.onPicked,
    this.selected,
    Key? key,
  }) : super(key: key);

  final List<T> values;
  final String Function(T) toText;
  final Widget child;
  final void Function(T) onPicked;
  final T? selected;

  @override
  State<StatefulWidget> createState() => _OverlayListPickerState<T>();
}

class _OverlayListPickerState<T> extends State<OverlayListPicker<T>> {
  late final GlobalKey _key;
  OverlayEntry? overlayEntry;
  T? _selected;

  @override
  void initState() {
    _key = GlobalKey();
    _selected = widget.selected;

    super.initState();
  }

  @override
  void dispose() {
    if (overlayEntry != null && overlayEntry!.mounted) {
      overlayEntry?.remove();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!(overlayEntry?.mounted ?? false)) {
          overlayEntry = _createOverlayEntry();
          Overlay.of(context)?.insert(overlayEntry!);
        } else {
          overlayEntry?.remove();
        }
      },
      child: SizedBox(
        key: _key,
        child: widget.child,
      ),
    ).noSplash();
  }

  OverlayEntry? _createOverlayEntry() {
    final RenderBox? box = _key.currentContext?.findRenderObject() as RenderBox?;

    if (box != null) {
      final offset = box.localToGlobal(Offset.zero);

      return OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: Material(
                color: CustomColors.black.withOpacity(0.1),
                child: InkWell(
                  onTap: () {},
                  onTapDown: (_) => overlayEntry?.remove(),
                ).noSplash(),
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Material(
                color: CustomColors.white,
                borderRadius: BorderRadiuses.all16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    widget.values.length,
                    (int i) => Container(
                      decoration: BoxDecoration(
                        color: widget.values[i] == _selected ? CustomColors.black : CustomColors.white,
                        borderRadius: _getOverlayItemBorder(i),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selected = widget.values[i];
                              widget.onPicked(widget.values[i]);
                              overlayEntry?.remove();
                            });
                          },
                          child: Padding(
                            padding: Paddings.horizontal16.overrideZeros(EdgeInsets.only(
                              top: i == 0 ? 20.0 : 16.0,
                              bottom: i == widget.values.length - 1 ? 20.0 : 16.0,
                            )),
                            child: Row(
                              children: [
                                Text(
                                  widget.toText(widget.values[i]),
                                  style: roboto.s18.w500,
                                ),
                              ],
                            ),
                          ),
                        ).noSplash(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  BorderRadius _getOverlayItemBorder(int i) => BorderRadius.vertical(
        top: Radius.circular(i == 0 ? 18.0 : 0.0),
        bottom: Radius.circular(i == widget.values.length - 1 ? 18.0 : 0.0),
      );
}
