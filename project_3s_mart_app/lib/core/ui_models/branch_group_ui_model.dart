class BranchGroupUIModel {
  String name;
  String image;

  BranchGroupUIModel({
    required this.name,
    required this.image,
  });

  static final List<BranchGroupUIModel> listBranchGroupsDemo = [
    BranchGroupUIModel(
      name: 'Big C',
      image: 'assets/images/bigc.png',
    ),
    BranchGroupUIModel(
      name: 'Co.op mart',
      image: 'assets/images/coop.png',
    ),
    BranchGroupUIModel(
      name: 'AE Mall',
      image: 'assets/images/aeon.png',
    ),
    BranchGroupUIModel(
      name: 'Bách hoá xanh',
      image: 'assets/images/bhx.png',
    ),
    BranchGroupUIModel(
      name: 'Lotte Mart',
      image: 'assets/images/lotte.png',
    ),
    BranchGroupUIModel(
      name: 'Satra foods',
      image: 'assets/images/satra.png',
    ),
    BranchGroupUIModel(
      name: 'Mega market',
      image: 'assets/images/mega.png',
    ),
    BranchGroupUIModel(
      name: 'Emart mall',
      image: 'assets/images/emart.png',
    ),
  ];
}
