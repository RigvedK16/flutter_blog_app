import 'package:flutter/material.dart';
import 'package:post_comments_using_localdb/features/post/view/Widgets/post_loader_screen.dart';
import 'package:post_comments_using_localdb/features/post/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

class PostLoaderWrapper extends StatelessWidget {
  final Widget child;

  const PostLoaderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostViewModel>(
      builder: (context, vm, _) {
        bool isLoading = vm.isLoading;
        return Stack(children: [child, if (isLoading) PostLoaderScreen()]);
      },
    );
  }
}
