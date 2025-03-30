import 'package:get/get.dart';

import '../Model/Merchant.dart';
import '../res/Images/MyImages.dart';

class MerchantsController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;
  final RxList<String> categories = ['All', 'Restaurant', 'Thai massage', 'Vouchers'].obs;
  final RxString searchQuery = ''.obs;

  // Sample merchant data
  final List<Merchant> allMerchants = [
    Merchant('Thai Restaurant', 4.5, 1000, MyImageClass.thaicorner, MyImageClass.silver, 'Restaurant'),
    Merchant('Thai massage', 4.5, 1000, MyImageClass.thaicorner, MyImageClass.silver, 'Thai massage'),
    Merchant('McDonald\'s', 4.5, 1000, MyImageClass.macdonald, MyImageClass.silver, 'Restaurant'),
    Merchant('Thai massage 2', 4.5, 1000, MyImageClass.thaicorner, MyImageClass.silver, 'Thai massage'),
    Merchant('Burger King', 4.5, 1000, MyImageClass.burgerking, MyImageClass.silver, 'Restaurant'),
    Merchant('Thai Restaurant 2', 4.5, 1000, MyImageClass.thaicorner, MyImageClass.silver, 'Restaurant'),
  ];

  RxList<Merchant> get filteredMerchants {
    // Filter by category
    var filtered = allMerchants.where((merchant) {
      if (selectedCategoryIndex.value == 0) return true; // 'All' category
      return merchant.category == categories[selectedCategoryIndex.value];
    }).toList();

    // Filter by search query
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered.where((merchant) =>
          merchant.name.toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList();
    }

    return filtered.obs;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}