import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Model/Word.dart';
import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/repository/DataConversion.dart';
import 'package:untitled/repository/RepositoryWordEN.dart';

class LastAddedWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LastAddedWordsState();
  }
}

class _LastAddedWordsState extends State {
  // const MyApp({Key? key}) : super(key: key);

  // data for testing
  //
  // List<Word> testWordsEN = [
  //   WordEN("pi_word", "pi_phon", "pi_def", "pi_type"),
  //   WordEN("da_word", "da_phon", "da_def", "da_type")
  // ];

  static DataConversion enableConversion = DataConversion();
  RepositoryWordEN rep = RepositoryWordEN(enableConversion);

  dynamic _future;

  @override
  void initState() {
    //_future = rep. selectAll();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // pocetak dinamicke liste sa recima widget-a
    return Column(children: [
      // FutureBuilder<List<Word>>(
      //   future: _future,
      //   builder: (BuildContext context, AsyncSnapshot<List<Word>> snapshot) {
      //     return processDataLineView(snapshot);
      //   },
      // ),
      // kraj dinamicke liste sa recima widget-a
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(children: [_recentWordAddedWidget(), _recentWordAddedWidget(), actionCardWidget()])),
    ]);
  }

  Widget processDataLineView(AsyncSnapshot<List<Word>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        // physics: , Expanded, SizedBox
        itemCount: snapshot.data?.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Word item = snapshot.data![index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              rep.deleteWord(item);
            },
            child: ListTile(
                // title: Text(item.definition.toString()),
                // leading: Text(item.type.toString()),
                ),
          );
        },
      );
      //);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class actionCardWidget extends StatelessWidget {
  const actionCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text("You've added N words"),
            subtitle: Text("Let's refresh you memory!"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('SEE WORDS'),
                onPressed: () {
                  /* ... */
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('PRACTICE'),
                onPressed: () {
                  /* ... */
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}

class _recentWordAddedWidget extends StatelessWidget {
  const _recentWordAddedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.whatshot_rounded),
      title: Text("Future last [0]"),
      subtitle: Text("German"),
      // onLongPress: ,
      // onTap; ,
      // selected: ,
      trailing: Icon(Icons.book_outlined),
      dense: true,
    );
  }
}
