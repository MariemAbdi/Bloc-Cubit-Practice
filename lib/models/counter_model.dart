import 'package:state_management_cubit/constants.dart';

class Counter{
  final int counter;
  final String text;

  Counter({this.counter = 0, this.text = Constants.defaultMessage});
}