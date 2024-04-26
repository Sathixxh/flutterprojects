final List<Map<String, dynamic>> popularItems = [
  {
    "id": 1,
    "name": "Cheeseburger",
    "description":
        "A classic cheeseburger with lettuce, tomato, onions, and melted cheese.",
    "price": 8.99,
    "image_url": "assets/illustration/download.jpeg",
    "delivery_time": "30 minutes",
    "discount": "5%",
    "tax": 0.75,
    "delivery_charge": 2.50,
    "order_id": "ABC123",
    "delivery_person_name": "A!",
    "ratings": 4.5
  },
  {
    "id": 2,
    "name": "Pepperoni Pizza",
    "description":
        "Delicious pepperoni pizza with mozzarella cheese and tomato sauce.",
    "price": 12.99,
    "image_url": "assets/illustration/images.jpeg",
    "delivery_time": "30 minutes",
    "discount": "5%",
    "tax": 0.75,
    "delivery_charge": 2.50,
    "order_id": "ABC123",
    "delivery_person_name": "Ironman ",
    "ratings": 4.5
  },
  {
    "id": 3,
    "name": "Chicken Tikka ",
    "description":
        "Tender chicken pieces cooked in a creamy tomato sauce with aromatic spices.",
    "price": 10.99,
    "image_url": "assets/illustration/images (2).jpeg",
    "delivery_time": "30 minutes",
    "discount": "5%",
    "tax": 0.75,
    "delivery_charge": 2.50,
    "order_id": "ABC123",
    "delivery_person_name": " Thor",
    "ratings": 4.5
  },
  {
    "id": 4,
    "name": "Falafel Wrap",
    "description":
        "A delicious wrap filled with falafel balls, lettuce, tomatoes, and tahini sauce.",
    "price": 7.99,
    "image_url": "assets/illustration/images (1).jpeg",
    "delivery_time": "30 minutes",
    "discount": "5%",
    "tax": 0.75,
    "delivery_charge": 2.50,
    "order_id": "ABC123",
    "delivery_person_name": "Hulk ",
    "ratings": 4.5
  },
];

final List<Map<String, dynamic>> offers = [
  {
    "text": "Wlcome Offers\nBurger+Cokakola\nFree Delivery",
    "imagePath": "assets/illustration/pngkey.com-combo-png-4209307.png",
  },
  {
    "text": "Wlcome Offers\nKfcRool+Cokakola\nFree Delivery",
    "imagePath": "assets/illustration/pngimg.com - kfc_food_PNG15.png",
  },
  {
    "text": "Wlcome Offers\nCrippyChicken+\nFrenchFries\nFree Delivery",
    "imagePath": "assets/illustration/pngwing.com (1).png",
  },
];

final List<Map<String, dynamic>> Categorise = [
  {
    "name": "Pizza",
    "imagePath": "assets/illustration/pizza.png",
  },
  {
    "name": "Burger",
    "imagePath": "assets/illustration/burger (1).png",
  },

  {
    "name": "Drinks",
    "imagePath": "assets/illustration/juice.png",
  },
  {
    "name": "Ice Creams",
    "imagePath": "assets/illustration/ice-cream.png",
  },
  // {
  //   "name": "BBQ",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Biryani",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Sandwich",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Salad",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Pasta",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Tacos",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Steak",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Sushi",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Soup",
  //   "imagePath": "",
  // },
  {
    "name": "Cake",
    "imagePath": "assets/illustration/cake.png",
  },
  // {
  //   "name": "Cookies",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Donuts",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Fries",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Nachos",
  //   "imagePath": "",
  // },
  // {
  //   "name": "Popcorn",
  //   "imagePath": "",
  // },
];



class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
