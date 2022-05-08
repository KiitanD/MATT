import 'package:flutter/material.dart';

class EditEvents extends StatefulWidget {
  @override
  State<EditEvents> createState() => _EditEventsState();
}

class _EditEventsState extends State<EditEvents> {
  // const EditEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  // const Form({Key? key}) : super(key: key);
  TextEditingController eventname = TextEditingController();

  TextEditingController location = TextEditingController();

  TextEditingController textDate = TextEditingController();

  TextEditingController textTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Text('Add Event'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: eventname,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: location,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: textDate,
              decoration: InputDecoration(
                //  labelText: 'Date',
                hintText: 'Select a Date',
                hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                setState(() {
                  if (date != null) {
                    textDate.text = "${date.day}.${date.month}.${date.year}";
                  }
                });
              },
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: textTime,
              decoration: InputDecoration(
                //  labelText: 'Time',
                hintText: 'Select a Time',
                hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              readOnly: true,
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if (time != null) {
                    textTime.text = time.format(context);
                  }
                });
              },
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("Done"),
              minWidth: 80,
              height: 40,
              elevation: 10,
              color: Colors.red.shade800,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
