import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/register_screen/model/userModel.dart';

class SearchscreenController extends GetxController {
  final Rx<List<Usermodel>> _SerchUsers = Rx<List<Usermodel>>([]);
  List<Usermodel> get searchuser => _SerchUsers.value;

  searchUser(String searchedUser) async {
    _SerchUsers.bindStream(firbasestore
        .collection("users")
        .where("name", isGreaterThanOrEqualTo: searchedUser)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Usermodel> returnvalu = [];
      for (var elment in snapshot.docs) {
        returnvalu.add(Usermodel.formSnap(elment));
      }
      return returnvalu;
    }));
  }
}
