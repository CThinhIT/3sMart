part of '../category_screen.dart';

// ignore: use_key_in_widget_constructors
class _SubcategoryGridList extends StatelessWidget {
  final List<CategoryUIModel> categories;
  final ItemScrollController scrollController;

  // ignore: use_key_in_widget_constructors
  const _SubcategoryGridList({
    required this.categories,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ScrollablePositionedList.separated(
        itemScrollController: scrollController,
        // bottom = 0.5.sh = 50% of full height to make the last item can scroll to the top
        padding: EdgeInsets.only(top: 8.h, bottom: 0.5.sh),
        itemBuilder: (_, index) => _SubcategoryGrid(
          category: categories[index],
        ),
        separatorBuilder: (_, __) => Divider(
          height: 16.h,
          color: ColorUtils.divider,
          thickness: 4.h,
        ),
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
