import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/worker_profile/worker_profile_bloc.dart';

import '../../services/get_it.dart';

class ImagePickerService {
  showPicker(context) async {
    final ImagePicker picker = ImagePicker();
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              height: 180.h,
              padding: EdgeInsets.all(12.r),
              child: Column(
                children: [
                  const Text("Upload photo from"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          var some = await _getFromGallery(picker);
                          getIt<WorkerProfileBloc>().pickImage(some!);
                          // getIt<WorkerProfileBloc>().add(UpdateWorkerInfoEvent(password: password, phone: phone, email: email, surname: surname, name: name));
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.image,
                              size: 100,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          XFile? some = await _getFromCamera(picker);
                          // getIt<CourseBloc>().pickImage(some!);
                          getIt<WorkerProfileBloc>().pickImage(some!);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera,
                              size: 100,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<XFile?> _getFromGallery(ImagePicker picker) async {
    XFile? pickedFile = await picker.pickImage(
      maxWidth: 1200,
      maxHeight: 1200,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }

  Future<XFile?> _getFromCamera(ImagePicker picker) async {
    XFile? pickedFile = await picker.pickImage(
      maxWidth: 1200,
      maxHeight: 1200,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }
}
