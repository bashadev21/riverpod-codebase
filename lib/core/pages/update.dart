import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/core/styles/dimenstions.style.dart';
import 'package:flutter_application/core/utils/assets/assets.dart';
import 'package:flutter_application/core/utils/buttons/primary_text_button.dart';
import 'package:flutter_application/core/utils/texts/body.text.dart';
import 'package:flutter_application/core/widgets/image.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class UpdatePage extends ConsumerStatefulWidget {
  const UpdatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdatePageState();
}

class _UpdatePageState extends ConsumerState<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Dimen.scaffoldMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppBodyText(data: 'New version available !'),
            const SizedBox(height: Dimen.space * 2),
            const Photo(image: Assets.code01),
            const SizedBox(height: Dimen.space * 2),
            const Text(
              'Update your app to enhance experience and\nexplore new features',
              style: TextStyle(fontSize: Dimen.icon * .75),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimen.space * 4),
            PrimaryTextButton(
              
              text: 'Update Now',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
