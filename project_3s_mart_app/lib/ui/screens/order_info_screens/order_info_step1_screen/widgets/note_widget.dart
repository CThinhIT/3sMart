part of '../order_info_step1_screen.dart';

class _Note extends StatelessWidget {
  final TextEditingController noteController;
  const _Note({Key? key, required this.noteController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.note.tr,
            style: TextStyleUtils.title,
          ),
          SizedBox(
            height: 12.h,
          ),
          BuildTextFormFieldWidget(
            hintText: Strings.addNote.tr + '...',
            controller: noteController,
            textInputAction: TextInputAction.done,
            maxLine: 3,
            onChanged: (value) {
              context.read<IOrderInfoViewModel>().note = noteController.text;
            },
          )
        ],
      ),
    );
  }
}
