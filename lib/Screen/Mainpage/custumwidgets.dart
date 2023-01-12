import 'package:flutter/material.dart';
import '../../Const/global.dart';
import '../../Model/moviesmodel.dart';
import '../Details/detailspage.dart';

class customTitles extends StatelessWidget {
  customTitles({Key? key, required this.title, required this.whichList})
      : super(key: key);
  String title, whichList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              )),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.value,
  }) : super(key: key);

  final Movies value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                movieId: value.id!,
              ),
            ));
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: height1,
          width: width1,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    flex: 16,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0) +
                          const EdgeInsets.only(top: 7),
                      child: Container(
                        width: width1,
                        decoration: BoxDecoration(boxShadow: const [
                          BoxShadow(
                            blurRadius: 2.5,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                            offset: Offset(1, 1),
                          )
                        ], borderRadius: BorderRadius.circular(13)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.network(
                            "$imageBaseUrl${value.posterPath}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: padding2,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            value.title!,
                            style: const TextStyle(fontSize: textSize1),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
