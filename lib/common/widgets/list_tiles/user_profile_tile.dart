import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: "assets/images/seif.jpg",height: 50,width: 50, padding: 0,
        backgroundColor: Colors.transparent,
      ),
      title: Text("Seif Salman",style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text("seifxofficial@gmail.com",style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: onPressed , icon: Icon(Icons.edit,color: TColors.white),),
    );
  }
}

