import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/podcast.model.dart';
import 'package:flutter_web_app/widgets/custom_audio_player/custom_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';

class PodcastAudios extends StatefulWidget {
  final PodcastModel podcast;

  PodcastAudios({@required this.podcast});

  @override
  _PodcastAudiosState createState() => _PodcastAudiosState();
}

class _PodcastAudiosState extends State<PodcastAudios> {
  FileModel selectedAudio;

  @override
  void initState() {
    if (widget.podcast.audios.length > 0) {
      onAudioTap(widget.podcast.audios.first);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedAudio != null)
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CustomAudioPlayer(
                key: Key(selectedAudio.id),
                audioUri: selectedAudio.fileUri,
                title: selectedAudio.name,
              ),
            ),
          buildList()
        ],
      ),
    );
  }

  Widget buildList() {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: AppColors.gray9)),
      constraints: BoxConstraints(maxHeight: 300),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: widget.podcast.audios.length,
          itemBuilder: (_, index) {
            final file = widget.podcast.audios.elementAt(index);

            return buildAudio(file);
          },
          separatorBuilder: (_, __) =>
              Container(height: 1, color: AppColors.gray9)),
    );
  }

  void onAudioTap(FileModel file) {
    setState(() {
      selectedAudio = file;
    });
  }

  Widget buildAudio(FileModel file) {
    final selected = selectedAudio == file;

    return InkWell(
      onTap: () => onAudioTap(file),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Flexible(
              child: Text(
                file.name,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: selected ? FontWeight.w500 : FontWeight.w300,
                    color: AppColors.gray22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
