import 'package:qr_menu/model/menu.dart';

const sampleCategories = [
  MenuCategory(
    name: "Coffee",
    items: [
      MenuItem(
        name: "Coffee",
        description: "Fresh Ethiopian brewed coffee.",
        image: "lib/assets/b.jpg",
        price: 50,
        kcal: 5,
      ),

      MenuItem(
        name: "Espresso",
        description: "Strong and bold espresso shot.",
        image: "lib/assets/c.jpg",
        price: 80,
        kcal: 5,
      ),
      MenuItem(
        name: "Double Espresso",
        description: "Two shots of strong and bold espresso.",

        price: 130,
        kcal: 5,
      ),
      MenuItem(
        name: "Lungo",
        description: "A longer espresso with more water for a milder flavor.",
        image: "lib/assets/lungo.jpg",
        price: 140,
        kcal: 5,
      ),
      MenuItem(
        name: "Turkish Coffee",
        description:
            "Turkish style coffee brewed with finely ground coffee and cardamom.",
        image: "lib/assets/tur.jpg",
        price: 140,
        kcal: 5,
      ),
      MenuItem(
        name: "Moka Pot 2 Cup",
        description:
            "Rich and aromatic coffee brewed using a stovetop moka pot.",

        price: 200,
        kcal: 5,
      ),
      MenuItem(
        name: "French Press",
        description:
            "Full-bodied coffee brewed using a French press for a rich and robust flavor.",

        price: 180,
        kcal: 5,
      ),
    ],
  ),

  //
  //
  //
  MenuCategory(
    name: "Tea",
    items: [
      MenuItem(
        name: "Black Tea",
        price: 60,
        description: "Classic Ethiopian black tea.",
        image: "lib/assets/tea.png",
        kcal: 2,
      ),

      MenuItem(
        name: "Milk Tea",
        price: 70,
        description: "Tea served with fresh milk.",
        image: "lib/assets/milk.jpg",
        kcal: 40,
      ),

      MenuItem(
        name: "Special Tea",
        price: 90,
        description: "Tea with cinnamon, ginger, and cardamom.",

        kcal: 45,
      ),

      MenuItem(
        name: "Lemon Tea",
        price: 80,
        description: "Hot tea served with fresh lemon.",
        image: "lib/assets/lemon.jpg",
        kcal: 10,
      ),

      MenuItem(
        name: "Green Tea",
        price: 85,
        description: "Healthy green tea.",
        image: "lib/assets/green.jpg",
        kcal: 3,
      ),
    ],
  ),
  //
  //
  //
  MenuCategory(
    name: "SoftDrink",
    items: [
      MenuItem(name: "1L water", price: 100),

      MenuItem(name: "1/2L water", price: 50),
      MenuItem(name: "Ambo Mineral Water 500ml", price: 130),
      MenuItem(name: "Arada ", price: 200),
      MenuItem(
        name: "Turkish Coffee",
        description:
            "Turkish style coffee brewed with finely ground coffee and cardamom.",

        price: 140,
        kcal: 5,
      ),
    ],
  ),

  //
  //
  //
  MenuCategory(
    name: "Juices",
    items: [
      MenuItem(
        name: "Mango Juice",
        price: 180,
        description: "Fresh blended mango juice.",
        image: "lib/assets/manjo.jpg",
        kcal: 150,
      ),

      MenuItem(
        name: "Avocado Juice",
        price: 200,
        description: "Creamy avocado blended with milk.",
        image: "lib/assets/avo.jpg",
        kcal: 220,
      ),

      MenuItem(
        name: "Papaya Juice",
        price: 170,
        description: "Sweet papaya juice.",
        kcal: 140,
      ),

      MenuItem(
        name: "Mixed Juice",
        price: 220,
        description: "Combination of mango, avocado and papaya.",
        kcal: 260,
      ),

      MenuItem(
        name: "Pineapple Juice",
        price: 190,
        description: "Fresh pineapple juice.",
        kcal: 160,
      ),
    ],
  ),
  //
  //
  //
  MenuCategory(
    name: "Burgers",
    items: [
      MenuItem(
        name: "Beef Burger",
        price: 420,
        description: "Juicy beef burger with fresh vegetables.",
        image: "lib/assets/beef.jpg",
        kcal: 520,
      ),

      MenuItem(
        name: "Chicken Burger",
        price: 390,
        description: "Grilled chicken burger with sauce.",
        image: "lib/assets/a.jpg",
        kcal: 480,
      ),

      MenuItem(
        name: "Cheese Burger",
        price: 450,
        description: "Beef burger topped with melted cheese.",
        image: "lib/assets/beef.jpg",
        kcal: 560,
      ),

      MenuItem(
        name: "Double Burger",
        price: 520,
        description: "Double beef patty burger.",

        image: "lib/assets/dou.jpg",
        kcal: 720,
      ),

      MenuItem(
        name: "Veggie Burger",
        price: 360,
        description: "Vegetarian burger made with fresh vegetables.",
        kcal: 430,
        isAvailable: false,
      ),
    ],
  ),
];
