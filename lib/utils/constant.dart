import 'dart:convert';
import 'dart:math';

String userName = 'user1';
String password = '123456';

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
