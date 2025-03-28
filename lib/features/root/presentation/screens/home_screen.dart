import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/assets/data/sample_post_repository.dart';
import 'package:offgrid_nation_app/core/ui_share/post_widget.dart';
import 'package:offgrid_nation_app/core/helpers/share_helper.dart';
import 'package:offgrid_nation_app/features/root/wrapper/main_wrapper.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap your feed content in MainWrapper
    return MainWrapper(
      currentTabIndex: 0,
      child: const FeedScreenContent(),
      onTabSelected: (index) => {},
    );
  }
}

/// The updated FeedScreenContent now removes the extra scaffold.
class FeedScreenContent extends StatefulWidget {
  const FeedScreenContent({super.key});

  @override
  State<FeedScreenContent> createState() => _FeedScreenContentState();
}

class _FeedScreenContentState extends State<FeedScreenContent> {
  final ScrollController _scrollController = ScrollController();
  final SamplePostRepository _repository = SamplePostRepository();
  List<Map<String, String>> posts = [];
  bool isLoadingMore = false;
  bool hasMore = true;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchInitialPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
              _scrollController.position.maxScrollExtent - 300 &&
          !isLoadingMore &&
          hasMore) {
        _fetchMorePosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchInitialPosts() async {
    final fetchedPosts = await _repository.loadSamplePosts();
    setState(() {
      posts = fetchedPosts;
      currentPage = 1;
      hasMore = fetchedPosts.length >= 3;
    });
  }

  Future<void> _fetchMorePosts() async {
    setState(() => isLoadingMore = true);
    final nextPage = currentPage + 1;
    final fetchedPosts = await _repository.loadSamplePosts();
    setState(() {
      currentPage = nextPage;
      posts.addAll(fetchedPosts);
      isLoadingMore = false;
      hasMore = fetchedPosts.length >= 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Simply return the scrollable content without a nested scaffold.
    return SafeArea(child: _buildContent());
  }

  Widget _buildContent() {
    if (posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return RefreshIndicator(
      onRefresh: () async {
        await _fetchInitialPosts();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: isLoadingMore ? posts.length + 1 : posts.length,
        itemBuilder: (context, index) {
          if (index < posts.length) {
            final post = posts[index];
            return PostWidget(
              userName: post['userName'] ?? 'Unknown',
              userAvatarUrl: post['avatarUrl'] ?? '',
              timeText: post['timeText'] ?? '',
              postImageUrl: post['postImageUrl'] ?? '',
              description: post['description'] ?? '',
              onThunderPressed: () {
                // TODO: Implement thunder action.
              },
              onCommentPressed: () {
                // TODO: Navigate to comments screen.
              },
              onSharePressed: () {
                ShareHelper.showShareOptions(context);
              },
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
