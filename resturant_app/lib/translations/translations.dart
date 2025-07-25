import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'learn_quick': 'Learn quick,\neasy & delicious',
      'recipes': 'Recipes..!',
      'skip': 'Skip',
    },
    'ar_SA': {
      'learn_quick': 'تعلم بسرعة،\nبسهولة و لذيذ',
      'recipes': 'وصفات..!',
      'skip': 'تخطي',
    },
  };
}
