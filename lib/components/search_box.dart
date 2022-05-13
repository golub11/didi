import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/repository/RepositoryWordDE.dart';
import 'package:untitled/Screens/word_details/word_details_screen.dart';
import 'package:untitled/constants.dart';

// TODO implement like StatelessWidget

class SearchBox extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SearchBoxState();
  }
}

class _SearchBoxState extends State<SearchBox>{

  // define the controller that is responsible for
  // listening action that occurs with searched word
  final myController = TextEditingController();

  // clean the resource memory
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myController.addListener(_FetchingTheWord);
  } // take new resource memory whilst initializing


  // what we are showing to the user
  @override
  Widget build(BuildContext context) {
    return // pocetak search box widget-a
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,10),
              blurRadius: 50,
              color: kPrimaryColor.withOpacity(0.23)
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
                decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: myController.clear,),
                    //border: OutlineInputBorder(),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5))
                ),
                textInputAction:TextInputAction.search,
                onSubmitted: (String word){
                  if (word.length != 0){
                  Navigator.pushNamed(context, WordDetailsScreen.routeName,
                  arguments:<String, String>{'searchedWord':word});
                  }
                  },
                controller: myController,
              ),
            )
          ],
        ),
      );
    // kraj search box widget-a
  }

  // functions that executes on submitting word in the search box
  void _FetchingTheWord() {
    print('I am sending entered word: ${myController.text} to database for querying/fetching...');
  }

  fetchData() {
    var searchedWord = myController.text;
    //Navigator.pushNamed(context, WordDetailsScreen.routeName);

    print('fetching the word... ${searchedWord}');
    if (searchedWord != ""){
      RepositoryWordDE repo = RepositoryWordDE();
      repo.fetchDEWord(searchedWord, true);
    }
  }

}