import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/domain/model/details_model.dart';
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
            Expanded(child: _buildScheduleList()),
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

  Widget _buildScheduleList() {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.tourDays.length,
        itemBuilder: (context, index) =>
            _buildScheduleItem(index, controller.tourDays[index]),
      );
    });
  }

  Widget _buildScheduleItem(int index, DetailsModel tourDay) {
    return Card(
      elevation: 0,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(tourDay.imagePath,
                  width: 64, height: 64, fit: BoxFit.cover),
            ),
            title: Text(
              tourDay.title,
              style: const TextStyle(color: Colors.grey),
            ),
            subtitle:
                Text(tourDay.day, style: const TextStyle(color: Colors.black)),
            trailing: Icon(
                tourDay.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.black),
            onTap: () {
              controller.toggleExpand(index);
            },
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: tourDay.isExpanded
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _scheduleDetailItem('Morning', tourDay.morning),
                        _scheduleDetailItem('Afternoon', tourDay.afternoon),
                        _scheduleDetailItem('Evening', tourDay.evening),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _scheduleDetailItem(String time, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(text: TextSpan(children: [
        TextSpan(
            text: '$time: ',style: TextStyle(color: Colors.grey)),
            TextSpan(text: description,style: TextStyle(color: Colors.black)),
      ]))
    );
  }
}
