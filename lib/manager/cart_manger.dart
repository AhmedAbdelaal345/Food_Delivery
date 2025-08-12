import 'package:flutter/material.dart';
import 'package:task/models/cart_model.dart';
import 'package:task/models/food_item_model.dart';

class CartManger extends ChangeNotifier {
  List<CartModel> cartItems = [];

  int get cartItemCount => cartItems.length;

  double get totalPrice {
    return cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity));
  }

  int get totalQuantity {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }

  void addToCart(CartModel item) {
    int existingIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    
    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += item.quantity;
    } else {

      cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartModel item) {
    cartItems.remove(item);
    notifyListeners();
  }

  void removeFromCartById(int id) {
    cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void increaseQuantity(int id) {
    for (var item in cartItems) {
      if (item.id == id) {
        item.quantity++;
        notifyListeners();
        break;
      }
    }
  }

  void decreaseQuantity(int id) {
    for (var item in cartItems) {
      if (item.id == id) {
        if (item.quantity > 1) {
          item.quantity--;
          notifyListeners();
        } else {
          // If quantity is 1, remove the item entirely
          removeFromCartById(id);
        }
        break;
      }
    }
  }

  // Added: Check if item is in cart (needed for ProductListWidget)
  bool isItemInCart(int id) {
    return cartItems.any((item) => item.id == id);
  }

  // Added: Get cart item by ID
  CartModel? getCartItem(int id) {
    try {
      return cartItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  // Added: Update item quantity directly
  void updateQuantity(int id, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCartById(id);
      return;
    }
    
    for (var item in cartItems) {
      if (item.id == id) {
        item.quantity = newQuantity;
        notifyListeners();
        break;
      }
    }
  }

  // Debug method to print cart contents
  void printCartContents() {
    print('=== CART CONTENTS ===');
    if (cartItems.isEmpty) {
      print('Cart is empty');
    } else {
      for (var item in cartItems) {
        print('ID: ${item.id}, Title: ${item.title}, Quantity: ${item.quantity}, Price: \$${item.price}');
      }
    }
    print('Total items: $cartItemCount');
    print('Total quantity: $totalQuantity');
    print('Total price: \$${totalPrice.toStringAsFixed(2)}');
    print('====================');
  }
}