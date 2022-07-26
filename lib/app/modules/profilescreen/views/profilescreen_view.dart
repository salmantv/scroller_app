import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';
import 'package:scroller/app/modules/profilescreen/widget/edit_profileButton.dart';
import 'package:scroller/app/modules/profilescreen/widget/follow_button.dart';
import '../controllers/profilescreen_controller.dart';
import 'package:shimmer/shimmer.dart';

class ProfilescreenView extends StatefulWidget {
  var uid;
  bool isCurrentuser;

  ProfilescreenView({
    required this.uid,
    required this.isCurrentuser,
  });

  final profileStatecontroller = Get.put(ProfilescreenController());

  @override
  State<ProfilescreenView> createState() => _ProfilescreenViewState();
}

class _ProfilescreenViewState extends State<ProfilescreenView> {
  @override
  void initState() {
    super.initState();
    widget.profileStatecontroller.updateUderid(widget.uid);
  }

  final textEditingProfile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilescreenController>(builder: (controller) {
      if (widget.profileStatecontroller.user.isEmpty ||
          widget.profileStatecontroller.isdatathere.isFalse) {
        return Looding();
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "@ ${widget.profileStatecontroller.user["name"]}",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          actions: [
            SizedBox(
              width: 20,
            ),
            widget.isCurrentuser == true
                ? Icon(Icons.more_vert_rounded)
                : SizedBox(),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 500,
              child: Column(
                children: [
                  Expanded(
                    flex: 0,
                    child:
                        GetBuilder<ProfilescreenController>(builder: (context) {
                      return Container(
                        child: Column(
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                imageUrl: widget.profileStatecontroller
                                    .user["profilePhoto"],
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: buttonColor,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.profileStatecontroller.user["name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Actress & Singer",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 60,
                              child: AutoSizeText(
                                widget.profileStatecontroller.user["bio"],
                                maxFontSize: double.maxFinite,
                                overflowReplacement: Text(""),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    widget.profileStatecontroller
                                        .user["followers"],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    widget.profileStatecontroller
                                        .user["following"],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    widget.profileStatecontroller.user["likes"],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Followers",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                                Text("Following",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("Likes",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (widget.isCurrentuser == true)
                              EditingButton()
                            else
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Followbutton(
                                  circular: 30,
                                  hintText: 'Follow',
                                  colorbutton: Colors.transparent,
                                  isImage: false,
                                  Ontap: () => widget.profileStatecontroller
                                      .followerUser(),
                                ),
                              ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Divider(
                                height: 80,
                                thickness: 0.9,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Expanded(
                      child: GridView.builder(
                    itemCount:
                        widget.profileStatecontroller.user["cover"].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final thumbnile =
                          widget.profileStatecontroller.user["cover"][index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              imageUrl: thumbnile,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: buttonColor,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5 / 2.2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.profileStatecontroller.user.clear();
  }
}
