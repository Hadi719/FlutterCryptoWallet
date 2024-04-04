import 'package:flutter/material.dart'
    show
        BuildContext,
        CircleAvatar,
        Icon,
        Icons,
        NetworkImage,
        StatelessWidget,
        Widget;

const double _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  final String? photo;

  const Avatar({super.key, this.photo});

  @override
  Widget build(BuildContext context) {
    final String? photo = this.photo;
    return CircleAvatar(
      radius: _avatarSize,
      backgroundImage: photo != null ? NetworkImage(photo) : null,
      child: photo == null
          ? const Icon(Icons.person_outline, size: _avatarSize)
          : null,
    );
  }
}
