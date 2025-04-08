import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/controller/details_controller.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 20),

            Text('8-Days Brazil Adventure',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            // Expanded(child: _buildScheduleList()),
            // _buildBookButton(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      leading: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Iconic Brazil",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text("Wed, Oct 21 – Sun, Nov 1",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
          icon: const Icon(Icons.favorite_border, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 35,
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          _tabButton(true, 'Tour Schedule'),
          SizedBox(width: 8),
          _tabButton(false, 'Accommodation'),
          SizedBox(width: 8),
          _tabButton(false, 'Booking Details'),
        ],
      ),
    );
  }

  Container _tabButton(bool isSelected, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
