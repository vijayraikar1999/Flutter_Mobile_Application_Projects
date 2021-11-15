import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '/constants.dart';
import '/screens/quiz/components/progress_bar.dart';
import '/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // so that we have access to our controller.
    QuestionController _questionController = Get.put(QuestionController());

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
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          'Question ${_questionController.questionNumber.value}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: kSecondaryColor,
                          ),
                      children: [
                        TextSpan(
                          text: '/${_questionController.questions.length}',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: kSecondaryColor,
                                  ),
                        ),
                      ],
                    ),
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
                  // Block swipe to next question.
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(
                      question: _questionController.questions[index],
                    );
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
