import 'package:flutter/material.dart';

import '../models/task.dart';

class PopUpMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopUpMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        if (task.isDeleted == false) {
          return [
            PopupMenuItem(
              onTap: null,
              child: TextButton.icon(
                onPressed: editTaskCallback,
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
            ),
            PopupMenuItem(
              onTap: likeOrDislikeCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: task.isFavorite == false
                    ? const Icon(Icons.bookmark_add_outlined)
                    : const Icon(Icons.bookmark_remove),
                label: task.isFavorite == false
                    ? const Text('Add to \nbookmark')
                    : const Text('Remove from \nbookmark'),
              ),
            ),
            PopupMenuItem(
              onTap: cancelOrDeleteCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
              ),
            ),
          ];
        } else {
          return [
            PopupMenuItem(
              onTap: restoreTaskCallback,
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.restore_from_trash),
                label: const Text('Restore'),
              ),
            ),
            PopupMenuItem(
              onTap: () => cancelOrDeleteCallback(),
              child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete Forever'),
              ),
            ),
          ];
        }
      },
    );
    // return PopupMenuButton(
    //   itemBuilder: task.isDeleted == false
    //       ? ((context) => [
    //             PopupMenuItem(
    //               onTap: null,
    //               child: TextButton.icon(
    //                 onPressed: editTaskCallback,
    //                 icon: const Icon(Icons.edit),
    //                 label: const Text('Edit'),
    //               ),
    //             ),
    //             PopupMenuItem(
    //               onTap: likeOrDislikeCallback,
    //               child: TextButton.icon(
    //                 onPressed: null,
    //                 icon: task.isFavorite == false
    //                     ? const Icon(Icons.bookmark_add_outlined)
    //                     : const Icon(Icons.bookmark_remove),
    //                 label: task.isFavorite == false
    //                     ? const Text('Add to \nbookmark')
    //                     : const Text('Remove from \nbookmark'),
    //               ),
    //             ),
    //             PopupMenuItem(
    //               onTap: cancelOrDeleteCallback,
    //               child: TextButton.icon(
    //                 onPressed: null,
    //                 icon: const Icon(Icons.delete),
    //                 label: const Text('Delete'),
    //               ),
    //             ),
    //           ])
    //       : ((context) => [
    //             PopupMenuItem(
    //               onTap: restoreTaskCallback,
    //               child: TextButton.icon(
    //                 onPressed: null,
    //                 icon: const Icon(Icons.restore_from_trash),
    //                 label: const Text('Restore'),
    //               ),
    //             ),
    //             PopupMenuItem(
    //               child: TextButton.icon(
    //                 onPressed: null,
    //                 icon: const Icon(Icons.delete_forever),
    //                 label: const Text('Delete Forever'),
    //               ),
    //               onTap: () => cancelOrDeleteCallback,
    //             ),
    //           ]),
    // );
  }
}


// enum PopupMenuAction {
//   edit,
//   favorite,
//   delete,
//   restore,
// }

// class PopUpMenu extends StatelessWidget {
//   final Task task;
//   final VoidCallback onDelete;
//   final VoidCallback onFavorite;
//   final VoidCallback onEdit;
//   final VoidCallback onRestore;

//   final Map<PopupMenuAction, VoidCallback> _actions;

//   PopUpMenu({
//     Key? key,
//     required this.task,
//     required this.onDelete,
//     required this.onFavorite,
//     required this.onEdit,
//     required this.onRestore,
//   })  : _actions = {
//           PopupMenuAction.edit: onEdit,
//           PopupMenuAction.favorite: onFavorite,
//           PopupMenuAction.delete: onDelete,
//           PopupMenuAction.restore: onRestore,
//         },
//         super(key: key);

//   void _onSelected(PopupMenuAction action) {
//     // action is one of the PopupMenuAction enum values.
//     final VoidCallback callback = _actions[action]!;

//     callback();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<PopupMenuAction>(
//       icon: const Icon(Icons.more_vert),
//       onSelected: _onSelected,
//       itemBuilder: task.isDeleted == false
//           ? (context) => [
//                 const PopupMenuItem(
//                   value: PopupMenuAction.edit,
//                   child: Text('Edit'),
//                 ),
//                 PopupMenuItem(
//                   value: PopupMenuAction.favorite,
//                   child: task.isFavorite == false
//                       ? const Text('Add to bookmarks')
//                       : const Text('Remove from bookmarks'),
//                 ),
//                 const PopupMenuItem(
//                   value: PopupMenuAction.delete,
//                   child: Text('Delete'),
//                 ),
//               ]
//           : (context) => [
//                 const PopupMenuItem(
//                   value: PopupMenuAction.restore,
//                   child: Text('Restore'),
//                 ),
//                 const PopupMenuItem(
//                   value: PopupMenuAction.delete,
//                   child: Text('Delete permanently'),
//                 ),
//               ],
//     );
//   }
// }