import 'package:onlytrips/budget.dart';

class Trip {
  String destination;
  int numTravelers;
  bool carTravel;
  bool planeTravel;

  List<BudgetItem> budgets = [];

  Trip({String destination, int numTravelers}) {
    this.destination = destination;
    this.numTravelers = numTravelers;

    budgets.add(BudgetItem("Travel Cost", 0));
    budgets.add(BudgetItem("Food Cost", 0));
    budgets.add(BudgetItem("Lodging Cost", 0));
    budgets.add(BudgetItem("Miscellaneous Cost", 0));
  }
}
