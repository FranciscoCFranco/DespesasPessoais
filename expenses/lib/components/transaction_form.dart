import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String title, double value) onSubmit;
  TransactionForm(this.onSubmit);
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    onSubmit(title, value);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Nova transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
