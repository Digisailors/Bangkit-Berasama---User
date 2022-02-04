import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/feedback.dart';
import 'package:bangkit/services/firebase.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddFeedback extends StatelessWidget {
  AddFeedback({Key? key}) : super(key: key);

  final title = TextEditingController();
  final description = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Help us improve..", style: Theme.of(context).textTheme.headline4),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    labelText: "Title",
                    controller: title,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    labelText: "Description",
                    controller: description,
                    validator: (value) {
                      value = value ?? '';
                      if (value.isEmpty) {
                        return "This is a required field";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          var object = MyFeedback(title: title.text, description: description.text, raiseddDate: DateTime.now(), starRatings: 5);
                          showFutureDialog(
                              context: context,
                              future: object.addFeedback(),
                              callback: () {
                                title.clear();
                                description.clear();
                                Navigator.of(context).pop();
                              });
                        }
                      },
                      child: const Text("Submit")),
                ),
                const Divider(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Your Feedbacks.."),
                  ),
                ),
                const MyFeedBackList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyFeedBackList extends StatelessWidget {
  const MyFeedBackList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: MyFeedback.myFeedbacks(),
      // initialData: initialData,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          snapshot.data!.docs.sort((a, b) => a.id.compareTo(b.id));
          var documents = snapshot.data!.docs;
          var feedbacks = documents.map((e) => MyFeedback.fromJson(e.data() as Map<String, dynamic>)).toList();
          if (feedbacks.isNotEmpty) {
            return Column(children: feedbacks.map((e) => FeedbackViewTile(myFeedback: e)).toList());
          } else {
            return const Text("You haven't shared any feedback yet.");
          }
        }
        return Container();
      },
    );
  }
}

class FeedbackViewTile extends StatelessWidget {
  const FeedbackViewTile({
    Key? key,
    required this.myFeedback,
  }) : super(key: key);

  final MyFeedback myFeedback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: getWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title", style: Theme.of(context).textTheme.subtitle1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(myFeedback.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Description", style: Theme.of(context).textTheme.subtitle1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(myFeedback.description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Date", style: Theme.of(context).textTheme.subtitle1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(myFeedback.raiseddDate.toString().substring(0, 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
