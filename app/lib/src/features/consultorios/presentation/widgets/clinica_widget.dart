import 'package:almaodonto/src/features/app/domain/entities/clinicas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClinicaWidget extends StatelessWidget {
  const ClinicaWidget({super.key, required this.clinica});
  final Clinica clinica;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              clinica.name!,
              style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              clinica.address!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              '${clinica.district} - ${clinica.state}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              clinica.phone!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
