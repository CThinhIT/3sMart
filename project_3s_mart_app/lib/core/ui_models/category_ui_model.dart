import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:uuid/uuid.dart';

class CategoryUIModel {
  final String id = const Uuid().v1(); // TODO: remove fake id
  final String nameVi;
  final String nameEn;
  final String imageUrl;
  final List<CategoryUIModel>? subcategories;

  String get name => AppTranslation.switchViEnString(nameVi, nameEn);

  CategoryUIModel({
    // required this.nameEn,
    required this.nameVi,
    required this.nameEn,
    required this.imageUrl,
    this.subcategories,
  });

  static final List<CategoryUIModel> listPopularCategoriesDemo = [
    subcategoriesInSearchProducts[0],
    subcategoriesInSearchProducts[1],
    subcategoriesInSearchProducts[2],
    subcategoriesInSearchProducts[4],
    subcategoriesInSearchProducts[5],
    subcategoriesInSearchProducts[6],
    subcategoriesInSearchProducts[7],
  ];

  static CategoryUIModel get vegetable => categories[1];

  static final List<CategoryUIModel> categories = [
    CategoryUIModel(
      nameVi: 'THỰC PHẨM TƯƠI',
      nameEn: 'Fresh meat & poultry',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[0],
        subcategoriesInSearchProducts[1],
        subcategoriesInSearchProducts[2],
      ],
    ),
    CategoryUIModel(
      nameVi: 'RAU, CỦ, QUẢ',
      nameEn: 'Fresh vegetables & fruits',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[5],
      ],
    ),
    CategoryUIModel(
      nameVi: 'ĐỒ KHÔ',
      nameEn: 'Dried food',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[4],
        subcategoriesInSearchProducts[6],
      ],
    ),
    CategoryUIModel(
      nameVi: 'ĐỒ GIA ĐÌNH',
      nameEn: 'Home appliances',
      imageUrl: '',
      subcategories: [subcategoriesInSearchProducts[7]],
    ),
    CategoryUIModel(
      nameVi: 'BÁNH KẸO',
      nameEn: 'Sweets',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[0],
        subcategoriesInSearchProducts[1],
        subcategoriesInSearchProducts[2]
      ],
    ),
    CategoryUIModel(
      nameVi: 'THỨC UỐNG',
      nameEn: 'Beverages',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[0],
        subcategoriesInSearchProducts[1],
        subcategoriesInSearchProducts[2]
      ],
    ),
    CategoryUIModel(
      nameVi: 'ĐANG GIẢM GIÁ',
      nameEn: 'Sale off',
      imageUrl: '',
      subcategories: [
        subcategoriesInSearchProducts[0],
        subcategoriesInSearchProducts[1],
        subcategoriesInSearchProducts[2]
      ],
    ),
  ];

  /// meat's subcategories
  static final beef = CategoryUIModel(
      nameVi: 'Thịt bò', nameEn: 'Beef', imageUrl: 'assets/images/meat.png');
  static final pork = CategoryUIModel(
      nameVi: 'Thịt heo',
      nameEn: 'Pork',
      imageUrl: 'assets/images/tmp_subcategory2.png');
  static final poultry = CategoryUIModel(
      nameVi: 'Thịt gà',
      nameEn: 'Poultry',
      imageUrl: 'assets/images/tmp_subcategory4.png');

  /// seafood's subcategories
  static final cuttleFish =
      CategoryUIModel(imageUrl: '', nameEn: 'Cuttle-fish', nameVi: 'Mực');
  static final shrimp =
      CategoryUIModel(imageUrl: '', nameEn: 'Shrimp', nameVi: 'Tôm');
  static final crab =
      CategoryUIModel(imageUrl: '', nameEn: 'Crab', nameVi: 'Cua');

  /// edge milk's subcategories
  static final condensedMilk = CategoryUIModel(
      imageUrl: '', nameEn: 'Condensed milk', nameVi: 'Sữa đặc');
  static final egg =
      CategoryUIModel(imageUrl: '', nameEn: 'Egg', nameVi: 'Trứng gà');

  /// Soft drink's subcategories
  static final fruitJuice =
      CategoryUIModel(imageUrl: '', nameEn: 'Fruit juice', nameVi: 'Nước ép');

  /// vegetable and fruits's subcategories
  static final vegetables =
      CategoryUIModel(imageUrl: '', nameEn: 'Vegetables', nameVi: 'Rau xanh');
  static final fruits =
      CategoryUIModel(imageUrl: '', nameEn: 'Fruits', nameVi: 'Trái cây');
  static final tubers =
      CategoryUIModel(imageUrl: '', nameEn: 'Tubers', nameVi: 'Củ quả');

  static final List<CategoryUIModel> subcategoriesInSearchProducts = [
    CategoryUIModel(
      nameVi: 'Thịt',
      nameEn: 'Meat',
      imageUrl: 'assets/images/meat.png',
      subcategories: [all, beef, pork, poultry],
    ),
    CategoryUIModel(
      nameVi: 'Hải sản',
      nameEn: 'Seafood',
      imageUrl: 'assets/images/tmp_subcategory_seafood.png',
      subcategories: [all, cuttleFish, shrimp, crab],
    ),
    CategoryUIModel(
      nameVi: 'Trứng, sữa',
      nameEn: 'Egg, milk',
      imageUrl: 'assets/images/tmp_subcategory_edge_milk.png',
      subcategories: [all, condensedMilk, egg],
    ),
    CategoryUIModel(
      nameVi: 'Đồ uống',
      nameEn: 'Soft drink',
      imageUrl: 'assets/images/tmp_subcategory_soft_drink.png',
      subcategories: [all, fruitJuice],
    ),
    CategoryUIModel(
      nameVi: 'Gia vị',
      nameEn: 'Spices',
      imageUrl: 'assets/images/spices.png',
      subcategories: [
        all,
      ],
    ),
    CategoryUIModel(
      nameVi: 'Rau củ quả',
      nameEn: 'Vegetables',
      imageUrl: 'assets/images/tmp_subcategory_vegetable.png',
      subcategories: [all, vegetables, tubers, fruits],
    ),
    CategoryUIModel(
      nameVi: 'Đồ đóng hộp',
      nameEn: 'Canned goods',
      imageUrl: 'assets/images/canned.png',
      subcategories: [
        all,
      ],
    ),
    CategoryUIModel(
      nameVi: 'Dụng cụ',
      nameEn: 'Utensils',
      imageUrl: 'assets/images/utensils.png',
      subcategories: [
        all,
      ],
    ),
    CategoryUIModel(
      nameVi: 'Đồ uống',
      nameEn: 'Soft drink',
      imageUrl: 'assets/images/tmp_subcategory_soft_drink.png',
      subcategories: [all, fruitJuice],
    ),
  ];

  static final all = CategoryUIModel(
    nameVi: 'Tất cả',
    nameEn: 'All',
    imageUrl: '',
  );
}
