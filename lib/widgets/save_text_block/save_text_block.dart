import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveTextBlock extends StatefulWidget {
  final String value;
  final Function(String value) onSave;
  final String title;
  final String placeholder;
  final bool saving;

  SaveTextBlock(
      {@required this.value,
      @required this.onSave,
      @required this.title,
      @required this.placeholder,
      this.saving = false});

  @override
  _SaveTextBlockState createState() => _SaveTextBlockState();
}

class _SaveTextBlockState extends State<SaveTextBlock> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    controller.value = controller.value.copyWith(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SaveTextBlock oldWidget) {
    if (oldWidget != widget) {
      if (widget.value != controller.text) {
        controller.value = controller.value.copyWith(text: widget.value);
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: 1, color: AppColors.gray14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.gray15,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray3),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: widget.placeholder,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(width: 1, color: AppColors.gray14))),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SelectedButton(
                    selected: true,
                    text: 'SAVE',
                    disabled: widget.saving,
                    onPressed: () {
                      widget.onSave(controller.text);
                      focusNode.unfocus();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
