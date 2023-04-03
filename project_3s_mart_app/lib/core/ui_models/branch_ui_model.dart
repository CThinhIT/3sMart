class BranchUIModel {
  String name;
  String address;
  double distance;
  String image;

  BranchUIModel({
    required this.name,
    required this.address,
    required this.distance,
    required this.image,
  });

  static final List<BranchUIModel> listBranchsDemo = [
    BranchUIModel(
      address: 'Big C Phú Thạch ',
      distance: 1.3,
      name: 'Big C Phú Thạch',
      image: 'assets/images/bigc_4.png',
    ),
    BranchUIModel(
      address: 'Big C Âu cơ ',
      distance: 1.6,
      name: 'Big C Âu cơ',
      image: 'assets/images/bigc_1.png',
    ),
    BranchUIModel(
      address: 'Big C Trường Chinh',
      distance: 2.2,
      name: 'Big C - Trường Chinh',
      image: 'assets/images/branch.png',
    ),
    BranchUIModel(
      address: 'Big C Gò Vấp',
      distance: 2.3,
      name: 'Big C Gò Vấp',
      image: 'assets/images/bigc_2.png',
    ),
    BranchUIModel(
      address: 'Big C Miền Đông',
      distance: 3.3,
      name: 'Big C Miền Đông',
      image: 'assets/images/bigc_3.png',
    ),
  ];

  static final List<BranchUIModel> listBranchsNearYouDemo = [
    BranchUIModel(
      address: '234 Trường Chinh,  HCM',
      distance: 1.6,
      name: 'Coopmart Trường Chinh',
      image: 'assets/images/coop_near.png',
    ),
    BranchUIModel(
      address: '1 Trường Chinh, HCM',
      distance: 2.3,
      name: 'Big C - Trường Chinh',
      image: 'assets/images/supermarket_branch.png',
    ),
    BranchUIModel(
      address: '36 Bờ bao Tân Thắng, TP HCM',
      distance: 2.6,
      name: 'AEON mall - Bình Tân',
      image: 'assets/images/aeon_near.png',
    ),
  ];

  static final List<BranchUIModel> applicablePromoStoreList = [
    BranchUIModel(
      address: '234 Trường Chinh,  HCM',
      distance: 1.6,
      name: 'Coopmart Trường Chinh',
      image: 'assets/images/coop_near.png',
    ),
    BranchUIModel(
      address: '1 Trường Chinh, HCM',
      distance: 2.3,
      name: 'Big C - Trường Chinh',
      image: 'assets/images/supermarket_branch.png',
    ),
    BranchUIModel(
      address: '36 Bờ bao Tân Thắng, TP HCM',
      distance: 2.6,
      name: 'AEON mall - Bình Tân',
      image: 'assets/images/aeon_near.png',
    ),
    BranchUIModel(
      address: 'Big C Phú Thạch ',
      distance: 5.3,
      name: 'Big C Phú Thạch',
      image: 'assets/images/bigc_4.png',
    ),
    BranchUIModel(
      address: 'Big C Âu cơ ',
      distance: 10.6,
      name: 'Big C Âu cơ',
      image: 'assets/images/bigc_1.png',
    ),
    BranchUIModel(
      address: 'Big C Trường Chinh',
      distance: 20.2,
      name: 'Big C - Trường Chinh',
      image: 'assets/images/branch.png',
    ),
    BranchUIModel(
      address: 'Big C Gò Vấp',
      distance: 30.3,
      name: 'Big C Gò Vấp',
      image: 'assets/images/bigc_2.png',
    ),
    BranchUIModel(
      address: 'Big C Miền Đông',
      distance: 40.3,
      name: 'Big C Miền Đông',
      image: 'assets/images/bigc_3.png',
    ),
  ];
}
