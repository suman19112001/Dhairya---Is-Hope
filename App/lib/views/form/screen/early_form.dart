import 'package:dhairya/views/form/screen/save_form.dart';
import 'package:dhairya/views/form/widgets/customForm.dart';
import 'package:flutter/material.dart';

import '../../../common/round_buttons.dart';
import '../../../utils/app_color.dart';

class BuildEarlyForm extends StatefulWidget {
  const BuildEarlyForm({super.key});

  @override
  State<BuildEarlyForm> createState() => _BuildEarlyFormState();
}

class _BuildEarlyFormState extends State<BuildEarlyForm> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ActionChip(
                    label: const Text('x'),
                    backgroundColor: Colors.white,
                    elevation: 2,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  children: [
                    BuildCustomForm(
                      text1: 'Hey there!!',
                      text2: 'What can we call you?',
                      controller: _nameController,
                      hintText: 'Enter your name',
                      image: 'assets/images/extra_doodle/s10.png',
                    ),
                    BuildCustomForm(
                      text1: 'Hey there!!',
                      text2: 'What is your daily consumption?',
                      controller: _nameController,
                      hintText: 'Enter quantity',
                      image: 'assets/images/extra_doodle/s9.png',
                    ),
                    BuildCustomForm(
                      text1: 'Hey there!!',
                      text2: 'How much your each cigarette cost?',
                      controller: _nameController,
                      hintText: 'Enter price',
                      image: 'assets/images/extra_doodle/s4.png',
                    ),
                    BuildCustomForm(
                      text1: 'Hey there!!',
                      text2: 'How many years have you been smoking?',
                      controller: _nameController,
                      hintText: 'Enter in years',
                      image: 'assets/images/extra_doodle/s5.png',
                    ),
                    BuildCustomForm(
                      text1: 'Hey there!!',
                      text2: 'Why do you want to quit smoking?',
                      controller: _nameController,
                      hintText: 'Tell in detail',
                      image: 'assets/images/extra_doodle/s4.png',
                    ),
                  ],
                ),
              ),
              Center(
                child: _currentPage > 3
                    ? RoundButton(
                        text: 'Continue',
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SaveForm()))),
                        color: AppColors.textColor1,
                      )
                    : RoundButton(
                        text: 'Next',
                        onPressed: () {
                          _pageController.jumpToPage(_currentPage + 1);
                        },
                        color: AppColors.textColor1),
              )
            ],
          ),
        ));
  }
}
