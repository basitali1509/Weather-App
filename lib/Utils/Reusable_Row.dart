import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final title, value;
  const ReusableRow({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: .7,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
