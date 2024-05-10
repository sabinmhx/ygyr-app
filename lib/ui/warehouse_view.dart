import 'package:flutter/material.dart';

class WarehouseView extends StatelessWidget {
  const WarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _topContainer(),
            ),
            Expanded(
              child: _bottomContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topContainer() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("ClassName"),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _warehouseTextButton('Contact'),
            ),
            const Spacer(),
            Expanded(
              child: _warehouseTextButton('Quantity'),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Container _bottomContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: const Column(
        children: [
          Text('How to recycle?'),
        ],
      ),
    );
  }

  TextButton _warehouseTextButton(String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
