import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/widgets/wishlist_card.dart';

class AfterSearch extends StatelessWidget {
  const AfterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) {
            return const WishlistCard();
          },
        ),
      ),
    );
  }
}
