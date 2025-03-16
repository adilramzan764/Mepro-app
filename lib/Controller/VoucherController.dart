import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Model/Voucher.dart';
import '../../res/Images/MyImages.dart';

class VoucherController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  final List<String> tabs = ['Active', 'Used', 'Expired'];

  var isSearching = false.obs;
  var searchQuery = ''.obs;
  TextEditingController searchController = TextEditingController();

  final RxList<VoucherModel> vouchers = <VoucherModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadVouchers();
  }

  void loadVouchers() {
    List<VoucherModel> allVouchers = [
      VoucherModel(
        title: 'Get Free 1 Cup Coffee E-Voucher',
        validUntil: 'Dec 31, 2024',
        merchant: 'Starbucks',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.starbucks,
        redeemDate: 'Today, Dec 22, 2024 • 09:41AM',
        status: 'Active',
      ),
      VoucherModel(
        title: 'Get Free Burger E-Voucher',
        validUntil: 'Dec 31, 2024',
        merchant: 'McDonald\'s',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.macdonald,
        redeemDate: 'Yesterday, Dec 21, 2024 • 16:25 PM',
        status: 'Used',
      ),
      VoucherModel(
        title: 'Get 1 Free Bottle of Coca-Cola',
        validUntil: 'Dec 30, 2024',
        merchant: 'Coca-Cola',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.cocacola,
        redeemDate: 'Dec 20, 2024 • 10:08AM',
        status: 'Expired',
      ),
      VoucherModel(
        title: 'Get Box of Free Donuts',
        validUntil: 'Dec 30, 2024',
        merchant: 'Dunkin\' Donuts',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.macdonald,
        redeemDate: 'Dec 18, 2024 • 14:46 PM',
        status: 'Expired',
      ),
      VoucherModel(
        title: 'Get 1 Free Bottle of Pepsi',
        validUntil: 'Dec 28, 2024',
        merchant: 'Starbucks',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.starbucks,
        redeemDate: 'Dec 12, 2024 • 09:38AM',
        status: 'Expired',
      ),
      VoucherModel(
        title: 'Travel Hacks for Staying Safe',
        validUntil: 'Dec 31, 2024',
        merchant: 'Coca Cola',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.cocacola,
        redeemDate: '',
        status: 'Active',
      ),

      // Used Vouchers
      VoucherModel(
        title: 'Pizza Party Anyone? Get...',
        validUntil: 'Dec 20, 2024',
        merchant: 'Pizza Hut',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.pizzahut,
        redeemDate: 'Dec 16, 2024 • 12:44PM',
        status: 'Used',
      ),
      VoucherModel(
        title: 'Fuel Your Day with a Free...',
        validUntil: 'Dec 15, 2024',
        merchant: 'KFC',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.kfc,
        redeemDate: 'Dec 10, 2024 • 14:49PM',
        status: 'Used',
      ),
      VoucherModel(
        title: 'Elevate Your Travel Look...',
        validUntil: 'Dec 12, 2024',
        merchant: 'Airbnb',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.airbnb,
        redeemDate: 'Dec 08, 2024 • 06:26AM',
        status: 'Used',
      ),
      VoucherModel(
        title: 'Uncover Fashion Secrets...',
        validUntil: 'Dec 10, 2024',
        merchant: 'Nike',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.burgerking,
        redeemDate: 'Dec 04, 2024 • 20:53PM',
        status: 'Used',
      ),
      VoucherModel(
        title: 'Snag a Free Bottle of Coke...',
        validUntil: 'Dec 08, 2024',
        merchant: 'Coca-Cola',
        qrCode: MyImageClass.qrcode,
        logo: MyImageClass.cocacola,
        redeemDate: 'Dec 02, 2024 • 09:32AM',
        status: 'Used',
      ),

    ];

    vouchers.assignAll(allVouchers);
  }

  List<VoucherModel> getFilteredVouchers() {
    return vouchers.where((voucher) => voucher.status == tabs[selectedTabIndex.value]).toList();
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  // Update search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  // Clear search
  void clearSearch() {
    searchQuery.value = '';
    searchController.clear();
    isSearching.value = false;
  }


}
