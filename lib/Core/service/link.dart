


import '../const/const_data.dart';

class Applink{
  //local address
  static String reg="127.0.0.1";
  //remoute address
  static String appRoot= "https://";

  static String imagewithRoot="$appRoot/storage/";
  static String imagewithoutRoot="$appRoot";
  static String serverApiRoot="$appRoot/api";

  static String login="$serverApiRoot/login";
static String home ="$serverApiRoot/home";


Map<String,String>getHeader(){
  Map<String,String> mainHeader={
    "Content-Type":"application/json",
    "Accept":"application/json",
    "x-Requested-with":"XML_HttpRequest"
  };
  return mainHeader;
}
  Map<String,String>getHeaderToken(){
    Map<String,String> mainHeader={
      "Content-Type":"application/json",
      "Accept":"application/json",
      "x-Requested-with":"XML_HttpRequest",
      "Authorization":"Bearer${ConstData.token}"
    };
    return mainHeader;
  }
}
