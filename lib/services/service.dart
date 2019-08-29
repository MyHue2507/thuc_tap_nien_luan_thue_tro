import 'package:get_it/get_it.dart';
import 'package:nhatro/services/call.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}