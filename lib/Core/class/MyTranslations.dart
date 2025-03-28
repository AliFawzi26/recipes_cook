import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_us':{
      'hello':'hello world'
    },
  'ar_SA':{
      'hello':'مرحبا في العالم'
  }
  };


}