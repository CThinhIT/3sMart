part of '../product_category_screen.dart';

class _SubcategoryList extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const _SubcategoryList();

  @override
  State<_SubcategoryList> createState() => _SubcategoryListState();
}

class _SubcategoryListState extends State<_SubcategoryList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ICategoryViewModel>(
      builder: (_, vm, __) =>
          Selector<ICategoryViewModel, List<CategoryUIModel>>(
        selector: (_, viewmodel) => viewmodel.subcategories,
        builder: (_, subcategories, __) {
          return ListView.separated(
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemCount: subcategories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            controller: ScrollController(
              initialScrollOffset: vm.selectedIndex * 44.w,
            ),
            itemBuilder: (_, index) => _SubcategoryItem(
              subcategory: subcategories[index],
            ),
          );
        },
      ),
    );
  }
}
