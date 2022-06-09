import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_ui/data.dart';
import 'package:youtube_ui/screens/nav_screen.dart';
import 'package:youtube_ui/widgets/widgets.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, watch, _) {
                  final selectedVideo = watch(selectedVideoProvider).state;
                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              selectedVideo!.thumbnailUrl,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              iconSize: 30.0,
                              onPressed: () => context
                                  .read(miniPlayerControllerProvider)
                                  .state
                                  .animateToHeight(state: PanelState.MIN),
                              icon: const Icon(Icons.keyboard_arrow_down),
                            )
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                        VideoInfo(video: selectedVideo),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = suggestedVideos[index];
                  return VideoCard(video: video, hasPadding: true);
                },
                childCount: suggestedVideos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
