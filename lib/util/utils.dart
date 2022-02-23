import 'dart:developer';

void cLog(
  String body, {
  String n = 'oms',
}) {
  log('\x1B[32m$body\x1B[0m', name: n);
}
