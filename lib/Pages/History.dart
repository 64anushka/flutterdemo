import 'package:flutter/material.dart';

class History extends StatefulWidget {
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isApiCallProcess = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text(
          'History',
        ),
      ),
      
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            " Deccan Education Society (DES) in 1884.The college held these classes, for almost ten years, in old Gadre Wada and other locations in Poona. A plot of about 37 acres (a portion of the present extensive   campus) was acquired on a 99 years lease in 1891 by the DES. The foundation stone of the Main building of the Fergusson College, was laid in 1892 and the building was completed in 1895. The college started  functioning on this campus in 1895. From then onwards, the college has grown from strength to strength   and acquired a reputation as a nation-building institution. While the founders have become legends, in the history of education and the freedom struggle  in India, it is a matter of great significance, that the college received active and moral support  from academicians and statesmen, such as Principal William Wordsworth, Principal F. G. Selby, Lord Rippon,   Sir William Wedderburn and Sir James Fergusson.Fergusson College was intended to be,    the seminary of the Indian educational missionares."),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
