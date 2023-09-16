import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c9_sat_7pm/moduls/quran/quran_view.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran_Details";

  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetails;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    // anysnc
    if (content.isEmpty) readFiles(args.suraNumber);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_light.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامي"),
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 25,
            bottom: 120,
          ),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          height: mediaQuery.height,
          width: mediaQuery.width,
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${args.suraName}",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.play_circle,
                    size: 30,
                  )
                ],
              ),
              Divider(
                indent: 40,
                endIndent: 40,
                color: theme.primaryColor,
                thickness: 1.2,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    content,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  readFiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;

    setState(() {
      allVerses = content.split("\n");
    });

    print(text);
  }
}
