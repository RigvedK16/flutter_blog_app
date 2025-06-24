import 'package:flutter/material.dart';
import 'package:post_comments_using_localdb/features/comment/view/Widgets/comment_loader_screen.dart';
import 'package:post_comments_using_localdb/features/comment/view_model/comment_view_model.dart';
import 'package:provider/provider.dart';

class CommentLoaderWrapper extends StatelessWidget {
  final Widget child;

  const CommentLoaderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentViewModel>(
      builder: (context, vm, _) {
        bool isLoading = vm.isLoading;
        return Stack(children: [child, if (isLoading) CommentLoaderScreen()]);
      },
    );
  }
}
