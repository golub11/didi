import 'package:flutter/material.dart';
import 'package:untitled/Screens/vocabulary_list/vocabulary_list_screen.dart';
import 'package:untitled/Screens/word_details/word_details_screen.dart';

import 'horizontal_suggest.dart';

class HorizontalCards extends StatelessWidget {
  const HorizontalCards({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HorizontalSuggestionCard(size, 'assets/images/pic_homescreen_1.jpg','heading 1', 'heading 2', WordDetailsScreen.routeName ),
          HorizontalSuggestionCard(size, 'assets/images/pic_homescreen_2.jpg','heading 3', 'heading 4', VocabularyListScreen.routeName),
          HorizontalSuggestionCard(size, 'assets/images/pic_homescreen_3.jpg','heading 5', 'heading 6', WordDetailsScreen.routeName),

        ],
      ),
    );
  }
}
