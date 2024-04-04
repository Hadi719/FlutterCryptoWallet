import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/config/utils/constants/firebase_strings.dart';
import '../dev_coin_bloc/dev_coin_bloc.dart';

class ChangeIcon extends StatefulWidget {
  final Function() onPressed;

  const ChangeIcon({super.key, required this.onPressed});

  @override
  State<ChangeIcon> createState() => _ChangeIconState();
}

class _ChangeIconState extends State<ChangeIcon>
    with SingleTickerProviderStateMixin {
  double turn = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turn,
      duration: const Duration(milliseconds: 500),
      child: IconButton(
        icon: const Icon(
          Icons.change_circle,
          size: 40,
        ),
        onPressed: () {
          setState(() {
            widget.onPressed();
            turn += 0.5;
          });
        },
      ),
    );
  }
}

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DevCoinBloc, DevCoinState>(
          builder: (BuildContext context, DevCoinState state) {
            switch (state.status) {
              case DevCoinStatus.initial:
                return const Center(
                  child: Text(
                    'Click a button',
                    style: TextStyle(color: Colors.green),
                  ),
                );
              case DevCoinStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case DevCoinStatus.failure:
                return Center(
                  child: SelectableText(
                    'Failed to get data\n${state.error.toString()}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              case DevCoinStatus.success:
                if (state.data.runtimeType == UploadTask) {
                  return UploadTaskListTile(task: state.data);
                }

                return Scrollbar(
                  interactive: true,
                  child: SingleChildScrollView(
                    child: SelectableText(state.data.toString()),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile({super.key, required this.task});

  final Task task;

  /// Displays the current transferred bytes of the task.
  String _bytesTransferred(TaskSnapshot snapshot) {
    return '${snapshot.bytesTransferred}/${snapshot.totalBytes}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (
        BuildContext context,
        AsyncSnapshot<TaskSnapshot> asyncSnapshot,
      ) {
        TaskSnapshot? snapshot = asyncSnapshot.data;
        TaskState? taskState = snapshot?.state;
        String? msg;

        if (asyncSnapshot.hasError) {
          if (asyncSnapshot.error is FirebaseException &&
              (asyncSnapshot.error as FirebaseException).code == 'canceled') {
            msg = 'Upload canceled';
          } else {
            // ignore: avoid_print
            print(asyncSnapshot.error);
            msg = 'Something went wrong.';
          }
        } else if (snapshot != null && taskState == TaskState.running) {
          msg = '$taskState: ${_bytesTransferred(snapshot)} bytes sent';
        }
        if (msg == null && snapshot != null) {
          msg = '${taskState.toString()}\n'
              '${_bytesTransferred(snapshot)} bytes sent';
        }

        return ListView(
          children: [
            ListTile(
              title: Text('Upload Task #${task.hashCode}'),
              subtitle: FittedBox(
                fit: BoxFit.scaleDown,
                child: SelectableText(msg ?? 'Message is null'),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (taskState == TaskState.running)
                    IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: task.pause,
                    ),
                  if (taskState == TaskState.running)
                    IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: task.cancel,
                    ),
                  if (taskState == TaskState.paused)
                    IconButton(
                      icon: const Icon(Icons.file_upload),
                      onPressed: task.resume,
                    ),
                  if (taskState == TaskState.success)
                    IconButton(
                      icon: const Icon(Icons.file_download),
                      tooltip: 'Download',
                      onPressed: snapshot?.ref.fullPath == null
                          ? null
                          : () {
                              String? fullPath = snapshot?.ref.fullPath;
                              if (fullPath == null) return;
                              if (fullPath
                                  .contains(kStorageNameGeckoMarketsList)) {
                                context.read<DevCoinBloc>().add(
                                    DevCoinGeckoFsDownloadCoinsMarketsList());
                              } else if (fullPath
                                  .contains(kStorageNameGeckoHistory)) {
                                context
                                    .read<DevCoinBloc>()
                                    .add(DevCoinGeckoFsDownloadCoinHistory());
                              }
                            },
                    ),
                  if (taskState == TaskState.success)
                    IconButton(
                      icon: const Icon(Icons.link),
                      tooltip: 'Download Link',
                      onPressed: () async {
                        String? downloadLink;
                        try {
                          downloadLink = await snapshot?.ref.getDownloadURL();
                        } catch (e) {
                          downloadLink = e.toString();
                        }

                        if (context.mounted) {
                          context.read<DevCoinBloc>().add(
                                DevCoinGetDownloadLink(
                                  downloadLink:
                                      downloadLink ?? 'Download link is null',
                                ),
                              );
                        }
                      },
                    ),
                  if (taskState == TaskState.success)
                    IconButton(
                      icon: const Icon(Icons.delete_forever),
                      tooltip: 'Delete Download Link',
                      onPressed: () {
                        context
                            .read<DevCoinBloc>()
                            .add(const DevCoinGetDownloadLink(
                              downloadLink: '',
                            ));
                      },
                    ),
                ],
              ),
            ),
            Visibility(
              visible: context.select(
                  (DevCoinBloc bloc) => bloc.state.downloadLink != null),
              child: SelectableText(
                context.select((DevCoinBloc bloc) =>
                    bloc.state.downloadLink ?? 'Waiting for download link'),
              ),
            )
          ],
        );
      },
    );
  }
}
