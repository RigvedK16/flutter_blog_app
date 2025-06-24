import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:post_comments_using_localdb/features/post/model/post_model.dart';

class Showeditedstatus extends StatelessWidget {
  final PostModel post;

  const Showeditedstatus({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    DateTime? editedAt = post.updatedAt;
    if (editedAt != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 8),
          Text(
            'Edited: ${DateFormat("EEEE, d MMMM yyyy").format(editedAt)}',
            style: TextStyle(fontSize: 10, color: Colors.black45),
          ),
        ],
      );
    }
    return SizedBox();
  }
}
