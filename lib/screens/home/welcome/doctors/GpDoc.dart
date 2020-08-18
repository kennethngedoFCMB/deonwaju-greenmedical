// Flutter code sample for ListTile

// Here is an example of an article list item with multiline titles and
// subtitles. It utilizes [Row]s and [Column]s, as well as [Expanded] and
// [AspectRatio] widgets to organize its layout.
//
// ![Custom list item b](https://flutter.github.io/assets-for-api-docs/assets/widgets/custom_list_item_b.png)

import 'file:///C:/FlutterVS/deon_greenmed/lib/screens/home/welcome/doctors/doctor_details/barney_stinson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This Widget is the main application widget.
class GpDocList extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyStatelessWidget(),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  '$title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top:5.0 ,bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,

                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  CustomListItemTwo({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.endthumbnail

  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final Widget endthumbnail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:15.0),
              child: Container(
                height: 60,
                width: 60,
                child: endthumbnail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => BarneyStinson());


            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CustomListItemTwo(
                thumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset('assets/images/manoo.jpg'),
                  ),
                ),
                title: 'Dr. Charles Babbage',
                subtitle: 'Dermatologist',
                endthumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset('assets/svg/rectangleSvg.svg'),
                  ),
                ),

              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => BarneyStinson());

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CustomListItemTwo(
                thumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset('assets/images/womantwo.png'),
                  ),
                ),
                title: 'Dr. Jaime Levy',
                subtitle: 'Pediatrician',
                endthumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset('assets/svg/rectangleSvg.svg'),
                  ),
                ),

              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarneyStinson()),
              );

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CustomListItemTwo(
                thumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset('assets/images/mantwo.png'),
                  ),
                ),
                title: 'Dr. Barney Stinson',
                subtitle: 'Gynecologist',
                endthumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset('assets/svg/rectangleSvg.svg'),
                  ),
                ),

              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => BarneyStinson());


            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CustomListItemTwo(
                thumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset('assets/images/manone.png'),
                  ),
                ),
                title: 'Dr. James Gosling',
                subtitle: 'Surgeon',
                endthumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset('assets/svg/rectangleSvg.svg'),
                  ),
                ),

              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              MaterialPageRoute(builder: (context) => BarneyStinson());


            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: CustomListItemTwo(
                thumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Image.asset('assets/images/manoo.jpg'),
                  ),
                ),
                title: 'Dr. Charles Babbage',
                subtitle: 'Dermatologist',
                endthumbnail: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset('assets/svg/rectangleSvg.svg'),
                  ),
                ),

              ),
            ),
          ),
        ),



      ],
    );
  }
}
