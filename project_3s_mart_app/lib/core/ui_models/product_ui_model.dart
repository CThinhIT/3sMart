import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:uuid/uuid.dart';

class ProductUIModel {
  final String id = const Uuid().v1(); // TODO: remove fake id
  final String nameVi;
  final String nameEn;
  final String imageUrl;
  final int discount;
  final double unitPrice;
  final double unitPriceAfterDiscount;
  final int quantity;
  final String categoryId;
  final String? description;
  ProductUnitType unitType;

  String get name => AppTranslation.switchViEnString(nameVi, nameEn);
  bool get isGramUnit =>
      unitType == ProductUnitType.gram || unitType == ProductUnitType.kg;

  ProductUIModel({
    required this.nameVi,
    required this.nameEn,
    required this.imageUrl,
    required this.unitPrice,
    required this.discount,
    required this.unitPriceAfterDiscount,
    required this.quantity,
    required this.categoryId,
    this.unitType = ProductUnitType.item,
    this.description,
  });

  static final List<ProductUIModel> listSelingProductsDemo = [
    ProductUIModel(
        imageUrl: 'assets/images/product1.png',
        nameVi: 'Thăn ngoại bò Hokube nhập khẩu 300gr',
        nameEn: 'Hokubee beef tenderloin imported from Japan 300gr',
        quantity: 300,
        unitPrice: 750000,
        discount: 30,
        unitPriceAfterDiscount: 700000,
        unitType: ProductUnitType.stray,
        categoryId: CategoryUIModel.beef.id,
        description:
            'Điểm đặc trưng của bò Hokubee là sự xen kẽ hoàn hảo giữa lớp thịt và lớp mỡ trên miếng thịt bò tạo nên những hình vân cẩm thạch rất là đẹp mắt. Thịt mềm “tan chảy” khi thưởng thức mà không hề bị khô hay có mùi hôi từ vân mỡ.'),
    ProductUIModel(
        imageUrl: 'assets/images/product2.png',
        nameVi: 'Thịt heo cốt lết FAU Nhập khẩu 300gr',
        nameEn: 'Australian beef shoulder 300gr',
        quantity: 300,
        unitPrice: 300000,
        discount: 30,
        unitPriceAfterDiscount: 270000,
        unitType: ProductUnitType.stray,
        categoryId: CategoryUIModel.pork.id,
        description:
            'Điểm đặc trưng của bò Hokubee là sự xen kẽ hoàn hảo giữa lớp thịt và lớp mỡ trên miếng thịt bò tạo nên những hình vân cẩm thạch rất là đẹp mắt. Thịt mềm “tan chảy” khi thưởng thức mà không hề bị khô hay có mùi hôi từ vân mỡ.'),
    ProductUIModel(
      imageUrl: 'assets/images/product3.png',
      nameVi: 'Thịt nguội hun khói 300gr',
      nameEn: 'Beef tenderloin 300gr',
      quantity: 300,
      unitPrice: 120000,
      discount: 30,
      unitPriceAfterDiscount: 100000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
        imageUrl: 'assets/images/product4.png',
        nameVi: 'Nạc vai bò Úc 300gr',
        nameEn: 'Beef shortloin 300gr',
        quantity: 300,
        unitPrice: 158000,
        discount: 30,
        unitPriceAfterDiscount: 150000,
        unitType: ProductUnitType.stray,
        categoryId: CategoryUIModel.beef.id,
        description:
            'Điểm đặc trưng của bò Hokubee là sự xen kẽ hoàn hảo giữa lớp thịt và lớp mỡ trên miếng thịt bò tạo nên những hình vân cẩm thạch rất là đẹp mắt. Thịt mềm “tan chảy” khi thưởng thức mà không hề bị khô hay có mùi hôi từ vân mỡ.'),
    ProductUIModel(
      imageUrl: 'assets/images/product5.png',
      nameVi: 'Thăn ngoại bò 300gr',
      nameEn: 'Beef sirloin 300gr',
      quantity: 300,
      unitPrice: 570000,
      discount: 30,
      unitPriceAfterDiscount: 550000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
  ];

  static final List<ProductUIModel> listVegetableAndFruitDemo = [
    ProductUIModel(
      nameVi: 'Ngò rí 30gr',
      nameEn: 'Coriander 30gr',
      imageUrl: 'assets/images/product6.png',
      unitPrice: 12000,
      discount: 20,
      quantity: 100,
      unitPriceAfterDiscount: 10000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.vegetables.id,
    ),
    ProductUIModel(
      nameVi: 'Cây xả 100gr',
      nameEn: 'Citronella 100gr',
      imageUrl: 'assets/images/product7.png',
      unitPrice: 12000,
      discount: 20,
      quantity: 100,
      unitPriceAfterDiscount: 10000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.vegetables.id,
    ),
    ProductUIModel(
      nameVi: 'Tỏi Lý Sơn 100gr',
      nameEn: 'Ly Son garlic 100gr',
      imageUrl: 'assets/images/product8.png',
      unitPrice: 12000,
      discount: 20,
      quantity: 100,
      unitPriceAfterDiscount: 10000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.tubers.id,
    ),
    ProductUIModel(
      nameVi: 'Khoai tây nâu Mỹ 1kg',
      nameEn: 'Brown potatoes 1kg',
      imageUrl: 'assets/images/product9.png',
      unitPrice: 12000,
      discount: 0,
      quantity: 1,
      unitPriceAfterDiscount: 12000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.tubers.id,
    ),
    ProductUIModel(
      nameVi: 'Su hào 500gr',
      nameEn: 'Kohlrabi 500gr',
      imageUrl: 'assets/images/product10.png',
      unitPrice: 12000,
      discount: 0,
      quantity: 500,
      unitPriceAfterDiscount: 12000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.tubers.id,
    ),
    ProductUIModel(
      nameVi: 'Củ cải 500gr',
      nameEn: 'Radish 500gr',
      imageUrl: 'assets/images/product11.png',
      unitPrice: 12000,
      discount: 0,
      quantity: 300,
      unitPriceAfterDiscount: 12000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.tubers.id,
    ),
  ];

  static final List<ProductUIModel> searchProducts = [
    ProductUIModel(
      imageUrl: 'assets/images/product1.png',
      nameVi: 'Thịt thăn ngoại bò Hokube nhập khẩu 500gr',
      nameEn: 'Hokubee beef tenderloin imported from Japan 500gr',
      quantity: 300,
      unitPrice: 750000,
      discount: 0,
      unitPriceAfterDiscount: 700000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product2.png',
      nameVi: 'Thịt heo cốt lết FAU Nhập khẩu 500gr',
      nameEn: 'Australian beef shoulder 500gr',
      quantity: 300,
      unitPrice: 150000,
      discount: 30,
      unitPriceAfterDiscount: 142000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.pork.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product3.png',
      nameVi: 'Thịt nguội hun khói 500gr',
      nameEn: 'Beef tenderloin 500gr',
      quantity: 300,
      unitPrice: 120000,
      discount: 30,
      unitPriceAfterDiscount: 100000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product5.png',
      nameVi: 'Thăn ngoại bò 500gr',
      nameEn: 'Beef sirloin 500gr',
      quantity: 300,
      unitPrice: 570000,
      discount: 30,
      unitPriceAfterDiscount: 550000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product4.png',
      nameVi: 'Nạc vai bò Úc 500gr',
      nameEn: 'Beef shortloin 500gr',
      quantity: 300,
      unitPrice: 158000,
      discount: 30,
      unitPriceAfterDiscount: 150000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product5.png',
      nameVi: 'Thăn ngoại bò 500gr',
      nameEn: 'Beef sirloin 500gr',
      quantity: 300,
      unitPrice: 570000,
      discount: 30,
      unitPriceAfterDiscount: 550000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.beef.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/product2.png',
      nameVi: 'Thịt heo cốt lết FAU Nhập khẩu 500gr',
      nameEn: 'Australian beef shoulder 500gr',
      quantity: 300,
      unitPrice: 300000,
      discount: 30,
      unitPriceAfterDiscount: 270000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.pork.id,
    ),
  ];

  static final List<ProductUIModel> comboProducts = [
    ProductUIModel(
      imageUrl: 'assets/images/tmp_combo_product1.png',
      nameVi: 'Lá thyme khô Simply organic 30gr',
      nameEn: 'Lá thyme khô Simply organic 30gr',
      quantity: 1,
      unitPrice: 14000,
      discount: 15,
      unitPriceAfterDiscount: 12000,
      unitType: ProductUnitType.bottle,
      categoryId: CategoryUIModel.vegetable.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/tmp_combo_product1.png',
      nameVi: 'Lá thyme khô Simply organic 100gr',
      nameEn: 'Lá thyme khô Simply organic 100gr',
      quantity: 1,
      unitPrice: 24000,
      discount: 0,
      unitPriceAfterDiscount: 24000,
      unitType: ProductUnitType.bottle,
      categoryId: CategoryUIModel.vegetable.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/tmp_combo_product2.png',
      nameVi: 'Tiêu đen xay 100gr',
      nameEn: 'Tiêu đen xay 100gr',
      quantity: 30,
      unitPrice: 65400,
      discount: 30,
      unitPriceAfterDiscount: 65000,
      unitType: ProductUnitType.bottle,
      categoryId: CategoryUIModel.vegetable.id,
    ),
    ProductUIModel(
      imageUrl: 'assets/images/tmp_combo_product3.png',
      nameVi: 'Sốt bơ tỏi Yo chef 500gr',
      nameEn: 'Sốt bơ tỏi Yo chef 500gr',
      quantity: 1,
      unitPrice: 13400,
      discount: 15,
      unitPriceAfterDiscount: 12900,
      unitType: ProductUnitType.bag,
      categoryId: CategoryUIModel.vegetable.id,
    ),
  ];

  static late final allProducts = [
    ...listSelingProductsDemo,
    ...listVegetableAndFruitDemo,

    /// poultry
    ProductUIModel(
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/8790/239604/bhx/dui-canh-ga-tuoi-cp-khay-500g-202106172309299750_300x300.jpeg',
      nameVi: 'Đùi cánh gà tươi CP 500gr',
      nameEn: 'Đùi cánh gà tươi CP 500gr',
      quantity: 300,
      unitPrice: 44000,
      discount: 10,
      unitPriceAfterDiscount: 40000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.poultry.id,
    ),
    ProductUIModel(
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/8790/226950/bhx/chan-ga-cp-khay-500g-202103041443287330_300x300.jpg',
      nameVi: 'Chân gà tươi sạch CP 500gr',
      nameEn: 'Chân gà tươi sạch CP 500gr',
      quantity: 300,
      unitPrice: 36000,
      discount: 10,
      unitPriceAfterDiscount: 33000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.poultry.id,
    ),
    ProductUIModel(
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/8790/239601/bhx/me-ga-tuoi-khay-500g-202105200032197483_300x300.jpeg',
      nameVi: 'Mề gà tươi sạch CP 500gr',
      nameEn: 'Mề gà tươi sạch CP 500gr',
      quantity: 300,
      unitPrice: 30000,
      discount: 10,
      unitPriceAfterDiscount: 27000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.poultry.id,
    ),

    /// Seafood
    ProductUIModel(
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/8780/248984/bhx/muc-ghim-nhap-khau-dong-lanh-tui-300g-202109281339356499_300x300.jpg',
      nameVi: 'Mực ghim nhập khẩu đông lạnh 500gr',
      nameEn: 'Mực ghim nhập khẩu đông lạnh 500gr',
      quantity: 300,
      unitPrice: 60000,
      discount: 10,
      unitPriceAfterDiscount: 51000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.cuttleFish.id,
    ),
    ProductUIModel(
      imageUrl:
          'https://dacsanbakien.com/wp-content/uploads/2021/07/muc-ong-tuoi-1.jpg',
      nameVi: 'Mực nang làm sạch Nghi Khánh 500gr',
      nameEn: 'Mực nang làm sạch Nghi Khánh 500gr',
      quantity: 300,
      unitPrice: 108000,
      discount: 50,
      unitPriceAfterDiscount: 54000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.cuttleFish.id,
    ),
    ProductUIModel(
      imageUrl:
          'https://file.hstatic.net/1000030244/file/z2634271839169_ff77f96dc244dab90ba3b344aaa8a895_2c1fffdb5a6b4a0892fa5914b42d4bf1_grande.jpg',
      nameVi: 'Tôm thẻ 500gr',
      nameEn: 'Tôm thẻ 500gr',
      quantity: 300,
      unitPrice: 108000,
      discount: 50,
      unitPriceAfterDiscount: 54000,
      unitType: ProductUnitType.stray,
      categoryId: CategoryUIModel.shrimp.id,
    ),
  ];
}
