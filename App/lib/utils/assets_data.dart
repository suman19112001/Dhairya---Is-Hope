import 'package:dhairya/models/story_model.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

class AssetIcons {
  static const String address = "assets/images/icons/address.png";
  static const String collection = "assets/images/icons/collection.png";
  static const String coupons = "assets/images/icons/coupons.png";
  static const String support = "assets/images/icons/support.png";
  static const String logout = "assets/images/icons/logout.png";
  static const String privacyPolicy = "assets/images/icons/privacy_policy.png";
}

class Rewards {
  List<String> rewardIcons = [
    "assets/images/rewards/fighter.png",
    'assets/images/rewards/gifting.png',
    'assets/images/rewards/goal.png',
    'assets/images/rewards/success.png',
    'assets/images/rewards/goal1.png',
    'assets/images/rewards/target.png',
    'assets/images/rewards/trophy.png',
    'assets/images/rewards/winner.png',
    'assets/images/rewards/success1.png'
  ];

  List<String> rewardLabel = [
    'Fighter',
    'Quit & Win',
    'Fresh Breath',
    'Nicotine-Free',
    'Quitter Cirle',
    'Quit Ribbon',
    'Health Hero',
    'Smokless',
    'Breath Easy'
  ];
}

class TobaccoImages {
  static const List<String> tobacoo = [
    "https://cdn.who.int/media/images/default-source/who-campaigns/world-no-tobacco-day-2022/wntd2022_web-banner_1920x892px_website.jpg?sfvrsn=607b263_16",
    "https://www.who.int/images/default-source/imported/world-no-tobacco-day/wntd19-banner.tmb-1920v.jpg?Culture=en&sfvrsn=7f835436_19",
    "https://cdn.stumagz.com/images/56f659e771783stryimg"
  ];
}

final List<StoryModel> storyData = [
  StoryModel(
      title: 'Amanda B.’s Story',
      subTitle: 'Meet Amanda B.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/Amanda-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/amanda.html',
      desc:
          'Amanda, age 30, lives in Wisconsin and began smoking in 5th grade. She smoked during pregnancy, and her baby was born 2 months early. Her tiny girl spent weeks in an incubator.'),
  StoryModel(
      title: "Bill B.’s Story",
      subTitle: 'Meet Bill B.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/Bill-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/bill.html',
      desc:
          'Bill lived in Michigan and had diabetes. He started smoking at age 15 and quit at age 39, after his leg was amputated due to poor circulation—made worse from smoking. Bill died from heart disease at age 42.'),
  StoryModel(
      title: 'Meet Annette S.',
      subTitle: 'Meet Annette S.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/Annette-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/annette.html',
      desc:
          'Annette, age 57, lives in New York and began smoking in her teens. At age 52, she was diagnosed with lung cancer, which required removal of one of her lungs. She was later diagnosed with oral cancer.'),
  StoryModel(
      title: 'Brandon C.’s Story',
      subTitle: 'Meet Brandon C.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/Brandon-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/brandon.html',
      desc:
          'Brandon, age 31, lives in North Dakota and began smoking at age 15. At 18, he was diagnosed with Buerger’s disease, which resulted in the amputation of both his legs and several fingertips.'),
  StoryModel(
      title: 'Beatrice R.’s Story',
      subTitle: 'Meet Beatrice R.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/beatrice-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/beatrice.html',
      desc:
          'Beatrice, age 40, lives in New York and formerly served in the U.S. Navy. She began smoking regularly at age 13. A mother of two, Beatrice quit smoking in 2010 because she wanted to be around for her family.'),
  StoryModel(
      title: 'Brett P.’s Story',
      subTitle: 'Meet Brett P.',
      image:
          'https://www.cdc.gov/tobacco/campaign/tips/stories/images/Brett-600x579-1.jpg',
      url: 'https://www.cdc.gov/tobacco/campaign/tips/stories/brett.html',
      desc:
          ' Brett, age 49, lives in New Mexico and started smoking cigarettes as a teenager. He had gum disease by his mid-30s but didn’t quit smoking until after most of his teeth were removed.')
];

List<TaskModel> task = [
  TaskModel(
    image: "assets/images/extra_doodle/t3.png",
    text: "Puzzles",
    color: Colors.red.withOpacity(0.5),
  ),
  TaskModel(
    image: "assets/images/extra_doodle/t1.png",
    text: "Breathing Exercises",
    color: Colors.purple.withOpacity(0.5),
  ),
  TaskModel(
    image: "assets/images/extra_doodle/yoga.png",
    text: "Meditation",
    color: Colors.teal.withOpacity(0.5),
  ),
  TaskModel(
    image: "assets/images/extra_doodle/t2.png",
    text: "Reading Articles",
    color: Colors.green.withOpacity(0.5),
  ),
];
