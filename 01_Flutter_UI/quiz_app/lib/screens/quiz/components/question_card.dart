import 'package:flutter/material.dart';
import 'package:quiz_app/models/Questions.dart';

import '../../../constants.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            sample_data[0]['question'],
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: kBlackColor,
                ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Options(),
          Options(),
          Options(),
          Options(),
        ],
      ),
    );
  }
}
