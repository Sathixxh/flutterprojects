
class User {
  final String userName;
  final String password;
  final String roleId;

  User({required this.userName, required this.password, required this.roleId});

  static fromJson(user) {}
}
List<User> users = [
    User(userName: "vijay", password: "123", roleId: "biller"),
      User(userName: "sathish", password: "123", roleId: "biller"),
    User(userName: "vikram", password: "123", roleId: "manager"),
    User(userName: "vinoth", password: "123", roleId: "inventory"),
    User(userName: "vignesh", password: "123", roleId: "admin"),
  ];





class LoginHistory {
  String username;
  String type;
  DateTime date;

  LoginHistory({
    required this.username,
    required this.type,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'type': type,
      'date': date.toIso8601String(),
    };
  }

  factory LoginHistory.fromJson(Map<String, dynamic> json) {
    return LoginHistory(
      username: json['username'],
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }
}


class BillMaster {
  final String billNo;
  final String billDate;
  final double totalBillAmount;
  final double gstAmount;
  final double netPayableAmount;
  final String userName;

  BillMaster({
    required this.billNo,
    required this.billDate,
    required this.totalBillAmount,
    required this.gstAmount,
    required this.netPayableAmount,
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    return {
      'billNo': billNo,
      'billDate': billDate,
      'totalBillAmount': totalBillAmount,
      'gstAmount': gstAmount,
      'netPayableAmount': netPayableAmount,
      'userid': userName,
    };
  }

  factory BillMaster.fromJson(Map<String, dynamic> json) {
    return BillMaster(
      billNo: json['billNo'],
      billDate: json['billDate'],
      totalBillAmount: json['totalBillAmount'],
      gstAmount: json['gstAmount'],
      netPayableAmount: json['netPayableAmount'],
      userName: json['userid'],
    );
  }
}


class BillDetail {
  final String medicineName;
  final int quantity;
  final double unitPrice;
  final double amount;
  final String billNo;

  BillDetail({
    required this.medicineName,
    required this.quantity,
    required this.unitPrice,
    required this.amount,
    required this.billNo,
  });

  // Create a factory constructor to deserialize a JSON object into a BillDetail instance
  factory BillDetail.fromJson(Map<String, dynamic> json) {
    return BillDetail(
      medicineName: json['medicineName'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'].toDouble(),
      amount: json['amount'].toDouble(),
      billNo: json['billNo'],
    );
  }

  // Create a method to serialize a BillDetail instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'medicineName': medicineName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'amount': amount,
      'billNo': billNo,
    };
  }
}
















class StockItem {
  final String medicinename;
  double quantity;
  double unitprice;

  StockItem({
    required this.medicinename,
    this.quantity=0,
  this.unitprice=0, 
  });

  StockItem.fromJson(Map<String, dynamic> json)
      : medicinename = json['medicinename'],
        quantity = json['quantity'] ?? 0,
        unitprice = json['unitprice'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'medicinename': medicinename,
      'quantity': quantity,
      'unitprice': unitprice,
    };
  }
}
List<StockItem> stock = [
  StockItem(medicinename: "Medicine1", quantity: 50, unitprice: 1),
  StockItem(medicinename: "Medicine2", quantity: 50, unitprice: 20),
    StockItem(medicinename: "Medicine3", quantity: 50, unitprice: 1),
  StockItem(medicinename: "Medicine4", quantity:  50, unitprice: 10),
  StockItem(medicinename: "Medicine5", quantity: 50, unitprice: 10),
    StockItem(medicinename: "Medicine6", quantity: 50, unitprice: 100),
  StockItem(medicinename: "Medicine7", quantity: 50, unitprice: 200),
    StockItem(medicinename: "Medicine8", quantity: 50, unitprice: 10),
  StockItem(medicinename: "Medicine9", quantity: 50, unitprice: 10),
    StockItem(medicinename: "Medicine10", quantity: 50, unitprice: 1),
  StockItem(medicinename: "Medicine11", quantity: 50, unitprice: 10),
    StockItem(medicinename: "Medicine12", quantity: 50, unitprice: 10),
  StockItem(medicinename: "Medicine13", quantity: 50, unitprice: 10),
    StockItem(medicinename: "Medicine14", quantity: 50, unitprice: 10),
  StockItem(medicinename: "Medicine15", quantity: 50, unitprice: 20),
];

  class MedicineMaster {
  String medicineName;
  String brand;

  MedicineMaster({
    required this.medicineName,
    required this.brand,
  });
   Map<String, dynamic> toJson() {
    return {
      'medicineName': medicineName,
      'brand': brand,
    };
  }


  factory MedicineMaster.fromJson(Map<String, dynamic> json) {
    return MedicineMaster(
      medicineName: json['medicineName'],
      brand: json['brand'],
    );
  }


}



List<MedicineMaster> medicineMaster = [
  MedicineMaster(medicineName: "Medicine1", brand: "Brand 1"),
  MedicineMaster(medicineName: "Medicine2", brand: "Brand 2"),
  MedicineMaster(medicineName: "Medicine3", brand: "Brand 3"),
  MedicineMaster(medicineName: "Medicine4", brand: "Brand 4"),
  MedicineMaster(medicineName: "Medicine5", brand: "Brand 5"),
  MedicineMaster(medicineName: "Medicine6", brand: "Brand 6"),
  MedicineMaster(medicineName: "Medicine7", brand: "Brand 7"),
  MedicineMaster(medicineName: "Medicine8", brand: "Brand 8"),
  MedicineMaster(medicineName: "Medicine9", brand: "Brand 9"),
  MedicineMaster(medicineName: "Medicine10", brand: "Brand 10"),
  MedicineMaster(medicineName: "Medicine11", brand: "Brand 11"),
  MedicineMaster(medicineName: "Medicine12", brand: "Brand 12"),
  MedicineMaster(medicineName: "Medicine13", brand: "Brand 13"),
  MedicineMaster(medicineName: "Medicine14", brand: "Brand 14"),
  MedicineMaster(medicineName: "Medicine15", brand: "Brand 5"),
  MedicineMaster(medicineName: "Medicine16", brand: "Brand 16"),

];

  List<String> getDrawerItems(String roleId) {
    switch (roleId) {
      case 'biller':
        return ['Dashboard', 'Bill Entry', 'Stockview', 'Logout'];
      case 'manager':
        return ['Dashboard', 'Stock Entry', 'Stock View', 'Sales Report', 'Logout'];
      case 'inventory':
        return ['Dashboard', 'Stock Entry', 'Stock View', 'Logout'];
      case 'admin':
        return ['Dashboard', 'Add User','Login History', 'Logout'];
      default:
        return [];
    }
  }











class MedicineDetails {
  String medicinename;
  String precaution;
  String usage;
  String manufacturingDate;
  String expiryDate;
  String dosage;

  MedicineDetails({
    required this.medicinename,
    required this.precaution,
    required this.usage,
    required this.manufacturingDate,
    required this.expiryDate,
    required this.dosage,
  });

  Map<String, dynamic> toJson() {
    return {
      'medicinename': medicinename,
      'precaution': precaution,
      'usage': usage,
      'manufacturingDate': manufacturingDate,
      'expiryDate': expiryDate,
      'dosage': dosage,
    };
  }

  factory MedicineDetails.fromJson(Map<String, dynamic> json) {
    return MedicineDetails(
      medicinename: json['medicinename'],
      precaution: json['precaution'],
      usage: json['usage'],
      manufacturingDate: json['manufacturingDate'],
      expiryDate: json['expiryDate'],
      dosage: json['dosage'],
    );
  }
}


List<MedicineDetails> medicineDetails = [
  MedicineDetails(
    medicinename: 'Medicine1',
    precaution: 'Keep out of reach of children',
    usage: 'Take as directed by a physician',
    manufacturingDate: '2023-01-01',
    expiryDate: '2024-12-31',
    dosage: '500mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine2',
    precaution: 'Take with a full glass of water',
    usage: 'Antibiotic to treat bacterial infections',
    manufacturingDate: '2023-03-10',
    expiryDate: '2024-03-10',
    dosage: '250mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine3',
    precaution: 'Store in a cool, dry place',
    usage: 'Pain relief medication',
    manufacturingDate: '2023-05-15',
    expiryDate: '2024-05-15',
    dosage: '600mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine4',
    precaution: 'Avoid sunlight exposure',
    usage: 'Treatment for common cold and flu',
    manufacturingDate: '2023-02-28',
    expiryDate: '2024-02-28',
    dosage: '200mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine5',
    precaution: 'Keep away from moisture',
    usage: 'Allergy relief medication',
    manufacturingDate: '2023-08-10',
    expiryDate: '2024-08-10',
    dosage: '10mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine6',
    precaution: 'Store in a cool place',
    usage: 'Antacid for digestion',
    manufacturingDate: '2023-07-20',
    expiryDate: '2024-07-20',
    dosage: '1000mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine7',
    precaution: 'Keep in a dry place',
    usage: 'Vitamin supplement',
    manufacturingDate: '2023-06-05',
    expiryDate: '2024-06-05',
    dosage: '50mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine8',
    precaution: 'Protect from heat',
    usage: 'Anti-inflammatory medication',
    manufacturingDate: '2023-04-15',
    expiryDate: '2024-04-15',
    dosage: '150mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine9',
    precaution: 'Keep in a dark place',
    usage: 'Sleep aid',
    manufacturingDate: '2023-09-25',
    expiryDate: '2024-09-25',
    dosage: '5mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine10',
    precaution: 'Keep out of reach of pets',
    usage: 'Supplement for joint health',
    manufacturingDate: '2023-11-30',
    expiryDate: '2024-11-30',
    dosage: '75mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine11',
    precaution: 'Keep in a cool place',
    usage: 'Antibiotic ointment',
    manufacturingDate: '2023-10-12',
    expiryDate: '2024-10-12',
    dosage: '100mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine12',
    precaution: 'Avoid direct sunlight',
    usage: 'Heartburn relief',
    manufacturingDate: '2023-12-05',
    expiryDate: '2024-12-05',
    dosage: '50mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine13',
    precaution: 'Store in a dry place',
    usage: 'Allergy nasal spray',
    manufacturingDate: '2023-11-20',
    expiryDate: '2024-11-20',
    dosage: '5mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine14',
    precaution: 'Keep away from moisture',
    usage: 'Cough suppressant',
    manufacturingDate: '2023-10-28',
    expiryDate: '2024-10-28',
    dosage: '200mg',
  ),
  MedicineDetails(
    medicinename: 'Medicine15',
    precaution: 'Store in a cool place',
    usage: 'Fever reducer',
    manufacturingDate: '2023-09-15',
    expiryDate: '2024-09-15',
    dosage: '250mg',
  ),
  // Add more MedicineDetails for other medicines in a similar manner
];

 

 