import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/add/controller/add.dart';

class Open extends StatelessWidget {
  Open({super.key});

  AddController addController = Get.put(AddController());

// show a modal bottom sheet when the user taps the button and give option to pick image or video
  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Image'),
                  onTap: () async {
                    var f = await addController.pickimagefromgallery();
                    print(f?.path);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.video_collection),
                  title: const Text('Video'),
                  onTap: () async {
                    var f = await addController.pickvideofromgallery();
                    print(f?.path);
                    var d = await addController.uploadVideo(f!);
                    print(d);
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
