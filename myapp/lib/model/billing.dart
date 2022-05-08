import 'package:flutter/material.dart';

class Billing extends StatefulWidget {
  // const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: const Text('Billing'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.red.shade800,
          width: 500,
          height: 200,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              const Text(
                'Add All',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 30,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "Amount",
              //         style: TextStyle(color: Colors.white),
              //
              //       ),
              //       hintText: "Enter Amount"),
              //
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Amount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //labelText: 'Amount',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Amount',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Submit"),
                //  minWidth: double.infinity,
                minWidth: 80,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = ['0112022', '0123022'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Container(
          color: Colors.red.shade800,
          width: 500,
          height: 400,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              const Text(
                'Student Bill',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Amount Paid',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //labelText: 'Amount',
                  fillColor: Colors.white,
                  filled: true,
                  //   hintText: 'ID',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Discount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //labelText: 'Amount',
                  fillColor: Colors.white,
                  filled: true,
                  //    hintText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Amount Owed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //labelText: 'Amount',
                  fillColor: Colors.white,
                  filled: true,
                  //  hintText: 'Amount',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Submit"),
                //  minWidth: double.infinity,
                minWidth: 80,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              )
            ],
          ),
        ),
      );
  //   Text(
  //     query,
  //     style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //   ),
  // );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;

              showResults(context);
            },
          );
        });
  }
}
