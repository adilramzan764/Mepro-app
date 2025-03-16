import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mepro_app/res/Images/MyImages.dart';
import '../Model/Acitivity.dart';

class ActivityController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxBool isSearching = false.obs;
  RxString searchQuery = ''.obs;
  TextEditingController searchController = TextEditingController();

  // Categories List
  final List<String> categories = [
    'All',
    'Redemption',
    'Receipt Photo',
    'Survey',
  ];

  // Sample Activities List
  RxList<ActivityModel> activities = <ActivityModel>[].obs;
  RxList<ActivityModel> filteredActivities = <ActivityModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivities();
  }

  // Fetch activities from API or local data
  void fetchActivities() {
    activities.assignAll([
      ActivityModel(
        type: 'Redemption',
        icon: MyImageClass.voucherIcon,
        description: 'You redeem points - Starbucks',
        points: -3750,
        dateTime: 'Today, Dec 22, 2024 • 09:41AM',
      ),
      ActivityModel(
        type: 'Receipt Photo',
        icon: MyImageClass.receipt,
        description: 'You upload a receipt - Starbucks',
        points: 1000,
        dateTime: 'Today, Dec 22, 2024 • 09:40 AM',
      ),
      ActivityModel(
        type: 'Survey',
        icon: MyImageClass.surveys,
        description: 'You complete the survey - Loyalify',
        points: 750,
        dateTime: 'Today, Dec 22, 2024 • 09:39AM',
      ),
      ActivityModel(
        type: 'Scan QR Code',
        icon: MyImageClass.scanqr,
        description: 'You scan the QR code - McDonald\'s',
        points: 2500,
        dateTime: 'Today, Dec 22, 2024 • 09:38AM',
      ),
      ActivityModel(
        type: 'Buy Points',
        icon: MyImageClass.buyPointsIcon,
        description: 'You buy points - 4679',
        points: 10000,
        dateTime: 'Today, Dec 22, 2024 • 09:37 AM',
      ),
      ActivityModel(
        type: 'Invite Friends',
        icon: MyImageClass.inviteFriendsIcon,
        description: 'Charlotte Hanlin has joined using your invite',
        points: 5000,
        dateTime: 'Today, Dec 22, 2024 • 09:36AM',
      ),
      ActivityModel(
        type: 'Cashing Points',
        icon: MyImageClass.cashingPointsIcon,
        description: 'You cashed out points',
        points: -100000,
        dateTime: '',
      ),
    ]);

    // Initially, show all activities
    filterActivities();
  }

  // Change tab and apply filter
  void changeTab(int index) {
    selectedTabIndex.value = index;
    filterActivities();
  }

  // Filter activities based on selected tab
  void filterActivities() {
    String selectedCategory = categories[selectedTabIndex.value];

    if (selectedCategory == 'All') {
      filteredActivities.assignAll(activities);
    } else {
      filteredActivities.assignAll(
        activities.where((activity) => activity.type == selectedCategory).toList(),
      );
    }
  }

  // Search query update
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterActivitiesBySearch();
  }

  // Filter activities by search query
  void filterActivitiesBySearch() {
    if (searchQuery.value.isEmpty) {
      filterActivities();
    } else {
      filteredActivities.assignAll(
        activities.where(
              (activity) =>
          activity.description.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
              activity.type.toLowerCase().contains(searchQuery.value.toLowerCase()),
        ).toList(),
      );
    }
  }

  // Clear search
  void clearSearch() {
    searchQuery.value = '';
    searchController.clear();
    isSearching.value = false;
    filterActivities();
  }
}
