import 'product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Hope Diamond',
      description: 'Yowza!',
      price: 300000000.00,
      imageUrl:
          'https://www.telegraph.co.uk/content/dam/luxury/spark/harry-winston/hope-diamond-necklace-2-xlarge.jpg?imwidth=1200',
    ),
    Product(
      id: 'p2',
      title: 'Tom Brady\'s Used Jockstrap',
      description: 'fair condition',
      price: 420.00,
      imageUrl:
          'https://66.media.tumblr.com/57b0e0aa94169b50fb7313e5b815957e/tumblr_p6dzayVaCq1wyvrcao1_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Android Housekeeper',
      description: 'I am looking for John Connor',
      price: 199.99,
      imageUrl:
          'https://cdn.vox-cdn.com/thumbor/Et4R6LdLlEehUShCoP8AoQ6CiW8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/assets/4658579/terminator_endoskeleton_1020.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Lamborghini Aventador LP-700',
      description: 'I am speed!',
      price: 300000.00,
      imageUrl:
          'https://longislandexoticcars.com/wp-content/uploads/2019/03/2149_main_l-762x456.jpg',
    ),
  ];

//  var _showFavoritesOnly = false;

  List<Product> get items {
//    if (_showFavoritesOnly) {
//      return _items.where((item) => item.isFavorite).toList();
//  }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

/*
  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }
*/

  void addProduct() {
//    _items.add(value);
    notifyListeners();
  }
}
