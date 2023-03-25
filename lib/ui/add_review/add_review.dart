import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/ui/widgets/my_appbar.dart';
import 'package:open_work/utils/color.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 3;
  TextEditingController reviewController = TextEditingController();
  String yesNo = "Yes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isCenter: true,
        title: 'Write a Review',
      ),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
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
                  const SizedBox(height: 16),
                  StarRating(
                    rating: _rating,
                    onRatingChanged: (rating) =>
                        setState(() => _rating = rating),
                    color: Colors.amber,
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
                  TextFormField(
                    controller: reviewController,
                    maxLines: 6,
                    maxLength: 250,
                    decoration: const InputDecoration(
                      hintText: 'Tell people about your experience',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: MyColors.neutral8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(color: MyColors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(color: MyColors.red),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a review';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Would you recommend Dr. Ibrohim Toxtasinov to your friends?'),
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
                    padding: const EdgeInsets.only(bottom: 40),
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
      ),
    );
  }
}

typedef RatingChangeCallback = void Function(int rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0,
    required this.onRatingChanged,
    required this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        // ignore: deprecated_member_use
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return GestureDetector(
      onTap: () => onRatingChanged(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
