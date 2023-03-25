import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:open_work/ui/add_review/widgets/text_form_field_widget.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController reviewController = TextEditingController();
  String yesNo = "Yes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(
        isCenter: true,
        title: 'Write a Review',
      ),
      body: KeyboardDismisser(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.002),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png"),
                        fit: BoxFit.contain),
                  ),
                  alignment: Alignment.center,
                ),
                const Text(
                  'How was your experience\nwith Dr.Ibrohim Toxtasinov?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Write a comment'),
                    Text('Max 250 words'),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormFieldWidget(reviewController: reviewController),
                const SizedBox(height: 10),
                const Text('Are you satisfied with the work of the worker?'),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        title: const Text("Yes"),
                        value: "Yes",
                        groupValue: yesNo,
                        onChanged: (value) {
                          setState(() {
                            yesNo = value.toString();
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        title: const Text("No"),
                        value: "No",
                        groupValue: yesNo,
                        onChanged: (value) {
                          setState(() {
                            yesNo = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: GlobalButton(
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   // submit the review
                      // }
                      // context.read<AddReviewBloc>().add(
                      //   AddReview(
                      //     reviewModel: ReviewModel(
                      //       comment: reviewController.text,
                      //       createdAt: DateTime.now().toString(),
                      //       doctorId: widget.model.doctorId,
                      //       reviewId: "",
                      //       starCount: _rating,
                      //       userId: '',
                      //       // context
                      //       //     .read<UserBloc>()
                      //       //     .userModel!
                      //       //     .userId,
                      //       userImage:
                      //       "https://source.unsplash.com/random/10",
                      //       userName: "Ibrohim",
                      //     ),
                      //   ),
                      // );
                      // // ignore: prefer_const_constructors
                      // showDialog(
                      //     context: context,
                      //     builder: ((context) {
                      //       return const AlertDialog(
                      //         title: CircularProgressIndicator(),
                      //       );
                      //     }));
                      // Future.delayed(const Duration(seconds: 3)).then(
                      //         (value) => Navigator.popUntil(
                      //         context, (route) => route.isFirst));

                      // Navigator.pushNamedAndRemoveUntil(context,
                      //     myAppointmentDetailRoute, (route) => false);
                    },
                    buttonText: 'Submit Review',
                    isActive: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
