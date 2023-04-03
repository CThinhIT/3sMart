part of '../category_screen.dart';

class _SubcategoryGrid extends StatelessWidget {
  final CategoryUIModel category;

  // ignore: use_key_in_widget_constructors
  const _SubcategoryGrid({required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.w / 1.4.h, // radio = width / height
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      children: category.subcategories!
          .map(
            (subcategory) => _SubcategoryItem(
              subcategory: subcategory,
            ),
          )
          .toList(),
    );
  }
}
