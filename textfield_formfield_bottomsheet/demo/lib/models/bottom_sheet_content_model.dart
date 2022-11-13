class BottomSheetModel {
  int number1 = 0;
  int number2 = 0;
  DemoModel(int num1, int num2) {
    number1 = num1;
    number2 = num2;
  }

  int getSum() {
    return this.number1 + this.number2;
  }
}
