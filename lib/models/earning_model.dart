import 'package:sales_control/models/activity_model.dart';

class Sale extends Activity {
  Sale(String? description, DateTime? date, double? price, String? type) {
    this.date = date;
    this.description = description;
    this.price = price;
    this.type = type;
  }
}

class Payment extends Activity {
  Payment(String? description, DateTime? date, double? price, String? type) {
    this.date = date;
    this.description = description;
    this.price = price;
    this.type = type;
  }
}
