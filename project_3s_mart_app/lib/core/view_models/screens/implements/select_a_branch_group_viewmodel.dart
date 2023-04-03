import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_group_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_a_branch_group_viewmodel.dart';

class SelectABranchGroupViewModel
    with ChangeNotifier
    implements ISelectABranchGroupViewModel {
  @override
  List<BranchGroupUIModel> get branchGroupsList =>
      BranchGroupUIModel.listBranchGroupsDemo;

  @override
  List<BranchUIModel> get branchsList => BranchUIModel.listBranchsDemo;

  @override
  
  List<BranchUIModel> get branchsNearYouList => BranchUIModel.listBranchsNearYouDemo;
}
