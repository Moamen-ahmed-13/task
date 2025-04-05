import 'package:get/get.dart';
import 'package:task/domain/model/details_model.dart';

class DetailsController extends GetxController {
  var tourDays = <DetailsModel>[
    DetailsModel(
      day: "Day 1",
      title: "Arrival to Rio de Janeiro",
      morning: "Arrive in Rio de Janeiro and transfer to your hotel",
      afternoon: "Free time to relax or explore the nearby area",
      evening: "Welcome dinner at a traditional Brazilian restaurant",
      imagePath: "assets/plane.jpg",
    ),
    DetailsModel(
      day: "Day 2",
      title: "Rio de Janeiro Highlights",
      morning: "Explore famous landmarks in the city",
      afternoon: "Visit Christ the Redeemer and Sugarloaf Mountain",
      evening: "Enjoy a night at a samba club",
      imagePath: "assets/rio.jpg",
    ),
  ].obs;

  void toggleExpand(int index) {
    tourDays[index].isExpanded = !tourDays[index].isExpanded;
    tourDays.refresh();
  }
}
