import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';
import 'package:intl/intl.dart';


String formatRupiah(double amount) {
  final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return formatter.format(amount);
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
 
  final List<Item> availableItems = [
    Item(id: 1, name: "Facial Wash - Senka", price: 150000),
    Item(id: 2, name: "Moisturizer - Cetaphil", price: 250000),
    Item(id: 3, name: "Sunscreen - Skin Aqua", price: 500000),
    Item(id: 4, name: "Serum - The Ordinary Niacinamide", price: 1500000),
    Item(id: 5, name: "Toner - Some By Mi AHA BHA PHA", price: 1500000),
    Item(id: 6, name: "Essence - SK-II Facial Treatment", price: 2000000),
    Item(id: 7, name: "Eye Cream - Laneige Water Bank", price: 300000),
    Item(id: 8, name: "Clay Mask - Innisfree Jeju Volcanic", price: 350000),
    Item(id: 9, name: "Lip Balm - Vaseline", price: 50000),
    Item(id: 10, name: "Exfoliating Gel - Cure Natural Aqua Gel", price: 400000),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sociolla"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(formatRupiah(item.price.toDouble())),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
 