part of '../category_screen.dart';

class _CategoryList extends StatefulWidget {
  final int initSelectedIndex;
  final List<CategoryUIModel> categories;
  final Function(CategoryUIModel category, int index) onItemPressed;

  // ignore: use_key_in_widget_constructors
  const _CategoryList({
    required this.initSelectedIndex,
    required this.categories,
    required this.onItemPressed,
  });

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<_CategoryList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.greyLight,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          for (int i = 0; i < widget.categories.length; i++)
            _CategoryItem(
              category: widget.categories[i],
              isSelected: _selectedIndex == i,
              onPressed: () {
                setState(() {
                  _selectedIndex = i;
                });
                widget.onItemPressed(widget.categories[i], i);
              },
            ),
        ],
      ),
    );
  }
}
