import 'package:flutter/material.dart';
import 'package:flutter_application/core/utils/assets/assets.dart';
import 'package:flutter_application/core/utils/texts/caption.text.dart';
import 'package:flutter_application/core/widgets/image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorWidget extends ConsumerWidget {
  final String? msg;

  const ErrorWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Photo(image: Assets.error, size: width * .75),
      AppCaptionText(data: msg, maxLines: 3, textAlign: TextAlign.center),
    ]);
  }
}
