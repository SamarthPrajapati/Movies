import 'package:flutter/material.dart';
import 'package:myapp/pages/fragments/buy_ticket.dart';
import 'package:myapp/pages/watch_list.dart';
import 'package:myapp/services/movie_model.dart';
import 'package:myapp/style/theme.dart' as Style;
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel currMovie;
  MovieDetails({@required this.currMovie});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/resim_yok.png",
                  image: widget.currMovie.poster,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.currMovie.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 17),
                      Text("Type: ",
                          style: GoogleFonts.overpass(
                              fontSize: 18,
                              color: Colors.white,
                              fontStyle: FontStyle.italic)),
                      Text(
                          widget.currMovie.type[0].toUpperCase() +
                              widget.currMovie.type.substring(1),
                          style: GoogleFonts.overpass(
                              fontSize: 18, color: Style.Colors.secondColor))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 17),
                      Text(
                        "Year: ",
                        style: GoogleFonts.overpass(
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(widget.currMovie.year,
                          style: GoogleFonts.overpass(
                              fontSize: 18, color: Style.Colors.secondColor))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 17),
                      Text(
                        "Seats: ",
                        style: GoogleFonts.overpass(
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                      Text("40",
                          style: GoogleFonts.overpass(
                              fontSize: 18, color: Style.Colors.secondColor))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 75,
                    width: 250,
                    child: ElevatedButton(
                      child: Text("Back".toUpperCase(),
                          style: TextStyle(fontSize: 20)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(color: Colors.blue)))),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    width: 250,
                    child: ElevatedButton(
                        child: Text("Book Ticket".toUpperCase(),
                            style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(color: Colors.blue)))),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyTicket(),
                              ),
                            )),
                  ),
                  buttonChoice(widget.currMovie),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonChoice(MovieModel item) {
    if (WatchList.watchList
        .where((element) =>
            element.title == item.title &&
            element.poster == item.poster &&
            element.year == item.year)
        .isEmpty) {
      return Flexible(
        child: SizedBox(
          height: 75,
          width: 250,
          child: ElevatedButton(
            child: Text("Add to List".toUpperCase(),
                style: TextStyle(fontSize: 20)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue)))),
            onPressed: () {
              {
                WatchList.addToList(item);
                WatchList.saveList();
                setState(() {});
              }
            },
          ),
        ),
      );
    } else {
      return Flexible(
        child: SizedBox(
          height: 75,
          width: 250,
          child: ElevatedButton(
            child: Text("Remove from List".toUpperCase(),
                style: TextStyle(fontSize: 20)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue)))),
            onPressed: () {
              {
                WatchList.watchList.removeWhere((element) =>
                    element.title == item.title &&
                    element.poster == item.poster &&
                    element.year == item.year);
                setState(() {});
                WatchList.saveList();
              }
            },
          ),
        ),
      );
    }
  }
}
