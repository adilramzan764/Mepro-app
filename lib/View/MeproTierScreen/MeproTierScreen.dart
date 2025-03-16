import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import '../../res/Images/MyImages.dart';



// This would be in your actual ScreenSize.dart file
class ScreenSize {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class MeproTierScreen extends StatefulWidget {
  const MeproTierScreen({Key? key}) : super(key: key);

  @override
  State<MeproTierScreen> createState() => _MeproTierScreenState();
}

class _MeproTierScreenState extends State<MeproTierScreen> {
  int _currentIndex = 3; // Start at Platinum (index 3)
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final ScrollController _levelScrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> tiers = [
    {
      'name': 'Basic',
      'points': '0',
      'level': 0,
      'badge': MyImageClass.basicBadge,
      'isCurrentLevel': false,
      'label': 'Welcome to Mepro!',
      'color': Colors.brown,
      'description': 'Welcome to Mepro! Access standard rewards.',
    },
    {
      'name': 'Silver',
      'points': '10,000',
      'level': 1,
      'badge': MyImageClass.silver,
      'color': Colors.blueGrey[300],
      'isCurrentLevel': false,
      'label': 'Unlock Silver!',
      'description': 'Unlock Silver! Enjoy early access to new rewards.',
    },
    {
      'name': 'Gold',
      'points': '50,000',
      'level': 3,
      'badge': MyImageClass.goldBadge,
      'color': Colors.orange,
      'isCurrentLevel': false,
      'label': 'You passed this level',
      'description': 'Congrats on Gold! Get enhanced rewards, exclusive offers.'
    },
    {
      'name': 'Platinum',
      'points': '100,000',
      'level': 4,
      'badge': MyImageClass.platinumBadge,
      'color': Colors.purple[300],
      'isCurrentLevel': true,
      'label': 'You are at this level now',
      'description': 'Platinum perks! Access premium rewards, personal service.'
    },
    {
      'name': 'Champion',
      'points': '500,000',
      'level': 5,
      'badge': MyImageClass.championBadge,
      'color': Colors.orange[700],
      'isCurrentLevel': false,
      'label': 'Collect 250,000 points',
      'description': 'Champion status! Enjoy VIP treatment, elite rewards.'
    },
    {
      'name': 'Ultimate',
      'points': '1,000,000',
      'level': 6,
      'badge': MyImageClass.ultimateBadge,
      'color': Colors.purple,
      'isCurrentLevel': false,
      'label': 'Collect more points',
      'description':
          'Ultimate rewards! Access the best perks, exclusive offerings.'
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentIndex();
    });
  }

  @override
  void dispose() {
    _levelScrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentIndex() {
    if (_levelScrollController.hasClients) {
      final screenWidth = MediaQuery.of(context).size.width;
      final scrollPosition =
          (_currentIndex * screenWidth * 0.33) - (screenWidth * 0.33);
      _levelScrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _autoScrollToIndex(int index) {
    if (_scrollController.hasClients) {
      double scrollTo = index * (MediaQuery.of(context).size.width * 0.42 + 16);
      _scrollController.animateTo(
        scrollTo,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: AppColors.red_mainColor2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Mepro Tier',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
          
                    // Tier Carousel
                    CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.23,
                        initialPage: 1,
                        viewportFraction: 0.47,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                          _autoScrollToIndex(index);
                        },
                      ),
                      items: tiers.map((tier) {
                        return Column(
                          children: [
                            Container(
                                height: ScreenSize.screenHeight(context) * 0.13,width: ScreenSize.screenWidth(context) * 0.3,
                                child: Image.asset(tier['badge'],fit: BoxFit.contain,)),
                            const SizedBox(height: 8),
                            Text(
                              '${tier['name']}\n${tier['points']} pts',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
          
                    // Scrollable Level Indicator
                    SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: _currentIndex == 0 ? 160 : 0,
                            right: _currentIndex == tiers.length - 1 ? 160 : 0),
                        child: Row(
                          children: List.generate(tiers.length, (index) {
                            return Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 8,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      decoration: BoxDecoration(
                                        color: _currentIndex == index
                                            ? Colors.white
                                            : Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index
                                            ? Colors.white
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Level ${index + 1}",
                                    style: TextStyle(
                                      color: _currentIndex == index
                                          ? Colors.white
                                          : Colors.grey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              // Points Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // Current Points
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Your Points',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '249,560',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '(\$249.56)',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Pending Points
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Pending Points',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '12,500',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '(\$12.50)',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
          
          
              // Tier List
              Container(
          
                height:   MediaQuery.of(context).size.height * 0.13 * tiers.length,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: tiers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            tiers[index]['badge'],
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          '${tiers[index]['name']} Tier (${tiers[index]['points']} pts)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          tiers[index]['description'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey[400],
                        ),
                        onTap: () {
                          // Handle tier selection
                          setState(() {
                            _currentIndex = index;
                          });
                          _carouselController.animateToPage(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
