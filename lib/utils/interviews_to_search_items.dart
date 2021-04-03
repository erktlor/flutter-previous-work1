import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';

List<SearchContentModel> interviewsToSearchItems(
    List<SearchInterviewModel> interviews) {
  return interviews
      .map<SearchContentModel>((interview) => SearchContentModel(
          type: 'interview',
          name: interview.name,
          description: interview.description,
          parameters: 'interviewId=${interview.id}',
          subjects: interview.subjects,
          presenters: interview.presenters,
          watched: interview.watched,
          duration: interview.duration,
          imageUri: interview.featuredImageUri,
          favourite: interview.favourite,
          publishedAt: interview.publishedAt))
      .toList();
}
