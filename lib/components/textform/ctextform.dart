import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/components/textform/ctextform_controller.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class CTextForm extends StatelessWidget {
  const CTextForm(
      {super.key, required this.label, this.isPassword, this.textController});
  final String label;
  final bool? isPassword;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    final controller =
        CTextFormController(initialIsPassword: isPassword ?? false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: CColors.labelinput,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 7.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: CColors.bginput,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 44,
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => TextFormField(
                    controller: textController,
                    obscureText: controller.isPassword.value,
                    decoration: const InputDecoration(
                      fillColor: CColors.bginput,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              isPassword == true
                  ? InkWell(
                      onTap: () {
                        controller.visiblityIcon();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => Icon(
                            controller.isPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CColors.labelinput,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
