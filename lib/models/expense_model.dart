import 'package:sales_control/models/activity_model.dart';

class TravelExpense extends Activity {
  /*String? departure;
  String? destination;
  String? reason;*/

  TravelExpense(String? description, DateTime? date, double? price, String? type
      /*{this.departure, this.destination, this.reason}*/
      ) {
    this.date = date;
    this.description = description;
    this.price = price;
    this.type = type;
  }
}

class Bill extends Activity {
  //String? observations;

  Bill(String? description, DateTime? date, double? price, String? type
      /*{this.observations}*/
      ) {
    this.date = date;
    this.description = description;
    this.price = price;
    this.type = type;
  }
}

class Achievement extends Activity {
  /*String? typeOfItem;
  String? observation;
  int? quantity;*/

  Achievement(String? description, DateTime? date, double? price, String? type
      /*{this.typeOfItem, this.observation, this.quantity}*/
      ) {
    this.date = date;
    this.description = description;
    this.price = price;
    this.type = type;
  }
}
