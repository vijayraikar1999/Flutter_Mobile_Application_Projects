import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/constants.dart';
import '/screens/quiz/components/progress_bar.dart';
import '/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text.rich(
                  TextSpan(
                    text: 'Question 1',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kSecondaryColor,
                        ),
                    children: [
                      TextSpan(
                        text: '/10',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: kSecondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.4,
                color: Colors.white,
              ),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, snapshot) {
                    return QuestionCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
