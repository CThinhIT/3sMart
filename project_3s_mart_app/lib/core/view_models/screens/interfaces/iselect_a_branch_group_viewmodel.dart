import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_group_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';

abstract class ISelectABranchGroupViewModel implements ChangeNotifier{
  List<BranchUIModel> get branchsList; 
  List<BranchUIModel> get branchsNearYouList; 
  List<BranchGroupUIModel> get branchGroupsList;
}