import 'package:flutter/material.dart';

class AddPro extends StatefulWidget {
  const AddPro({Key? key}) : super(key: key);

  @override
  State<AddPro> createState() => _AddProState();
}

class _AddProState extends State<AddPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Project '),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Text('Enter the Project Details'),
        ),
      ),
    );
  }
}
