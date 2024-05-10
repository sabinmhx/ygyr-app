import 'package:flutter/material.dart';
import 'package:ygyr/ui/warehouse_detail_view.dart';

class WarehouseView extends StatelessWidget {
  const WarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return _warehouseDetailContainer(context);
          }),
    );
  }

  _warehouseDetailContainer(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WarehouseDetailView(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 45, 45, 45),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: const Color.fromARGB(255, 160, 159, 159)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.height / 10,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  "Title/Classname",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  "data",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
