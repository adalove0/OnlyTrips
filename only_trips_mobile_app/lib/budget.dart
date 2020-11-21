class BudgetItem {
  String name;
  double amount;

  BudgetItem(this.name, this.amount);

  increaseBudget(double increase) {
    amount += increase;
  }

  decreaseBudget(double decrease) {
    amount -= decrease;
  }

  changeName(String newName) {
    name = newName;
  }
}
