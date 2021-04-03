import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/footer/footer.dart';

class PageLayoutBody extends StatefulWidget {
  final Widget child;
  final BoxConstraints constraints;
  final Function(bool) onScrollChanged;

  PageLayoutBody(
      {@required this.child,
      @required this.constraints,
      @required this.onScrollChanged});

  @override
  _PageLayoutBodyState createState() => _PageLayoutBodyState();
}

class _PageLayoutBodyState extends State<PageLayoutBody> {
  final controller = ScrollController();
  bool scrolled = false;
  int _scrollThreshold = 10;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.pixels > _scrollThreshold && !scrolled) {
        widget.onScrollChanged(true);
        setState(() {
          scrolled = true;
        });
      }
      if (controller.position.pixels <= _scrollThreshold && scrolled) {
        widget.onScrollChanged(false);
        setState(() {
          scrolled = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(minHeight: widget.constraints.maxHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.child,
            const SizedBox(
              height: 20,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
