part of '../product_category_screen.dart';

class _CategoryTagList extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const _CategoryTagList();

  @override
  State<_CategoryTagList> createState() => _CategoryTagListState();
}

class _CategoryTagListState extends State<_CategoryTagList> {
  @override
  Widget build(BuildContext context) {
    return Selector<ICategoryViewModel, List<CategoryUIModel>?>(
      selector: (_, vm) => vm.selectedSubcategory.subcategories,
      builder: (_, categoryTags, __) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...categoryTags?.map(
                  (subcategory) => _CategoryTagItem(category: subcategory),
                ) ??
                []
          ],
        );
      },
    );
  }
}
