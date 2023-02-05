import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/add/controller/add.dart';
import 'package:money_goes_brr/add/views/post.dart';
import 'package:money_goes_brr/user/controller/user.dart';

class Open extends StatelessWidget {
  Open({super.key});
  UserController userController = Get.put(UserController());
  AddController addController = Get.put(AddController());

// show a modal bottom sheet when the user taps the button and give option to pick image or video
  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Image'),
                  onTap: () async {
                    var f = await addController.pickimagefromgallery();
                    addController.pickedFile.value = f;
// go to post screen
                    addController.pickedFile.refresh();
                    Get.to(() => PostScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.video_collection),
                  title: const Text('Video'),
                  onTap: () async {
                    addController.isVideoo.value = true;
                    addController.isVideoo.refresh();
                    var f = await addController.pickvideofromgallery();
                    addController.pickedFile.value = f;
                    var thumbnail = await addController.getThumbnail(f!);
                    addController.thumbnail.value = thumbnail;

                    addController.pickedFile.refresh();
                    addController.thumbnail.refresh();

                    print(thumbnail.path);
                    Get.to(() => PostScreen());
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            _showModalBottomSheet(context);
          },
          child: const Text('Add Post'),
        ),
      ),
    );
  }
}
