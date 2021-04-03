import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/resources/resources_list/resources_list_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourcesList extends StatefulWidget {
  final List<ResourceModel> resources;

  ResourcesList({this.resources});

  @override
  _ResourcesListState createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList> {
  String search = '';

  void onChanged(String value) {
    setState(() {
      search = value;
    });
  }

  List<ResourceModel> get filteredItems => widget.resources.where((resource) {
        final file = resource.files.firstWhere(
            (file) => file.name.toLowerCase().contains(search.toLowerCase()),
            orElse: () => null);
        return file != null;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    final textStyle = GoogleFonts.poppins(
        fontSize: mobile ? 16 : 24, color: AppColors.gray10);

    final border = OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.black, width: 1));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              TextField(
                onChanged: onChanged,
                style: textStyle,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(right: 40, left: 10),
                    fillColor: AppColors.white,
                    hoverColor: AppColors.white,
                    filled: true,
                    focusedBorder: border,
                    border: border,
                    hintText: 'Search templates',
                    hintStyle: textStyle),
              ),
              const Positioned(
                child: Center(child: Icon(Icons.search)),
                right: 10,
                top: 0,
                bottom: 0,
              )
            ],
          ),
          SizedBox(
            height: mobile ? 10 : 30,
          ),
          (filteredItems.length == 0)
              ? Text(
                  search.isEmpty
                      ? 'No templates and resources'
                      : 'No item found',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return ResourcesListItem(
                        search: search,
                        resource: filteredItems.elementAt(index));
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: filteredItems.length)
        ],
      ),
    );
  }
}
