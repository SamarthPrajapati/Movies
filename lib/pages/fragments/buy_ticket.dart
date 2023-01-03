import 'package:flutter/material.dart';
import 'package:myapp/pages/watch_list.dart';
import 'package:myapp/services/movie_model.dart';
import 'package:myapp/style/theme.dart' as Style;
import 'package:google_fonts/google_fonts.dart';

class BuyTicket extends StatefulWidget {
  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Ticket Booking'),
          backgroundColor: Colors.black),
      backgroundColor: Style.Colors.mainColor,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Select Seat",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 600,
                    width: 800,
                    color: Colors.white60,
                    child: GridView.count(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      crossAxisCount: 6,
                      children: List.generate(
                        60,
                        (index) {
                          return Center(
                            child: Text(
                              '$index',
                              style:
                                  Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place Order",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 650,
                      height: 250,
                      color: Colors.white60,
                      child: SizedBox(
                        height: 75,
                        width: 250,
                        child: ElevatedButton(
                          child: Text("Book Ticket".toUpperCase(),
                              style: TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () => _showMyDialog(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your Seat has been Booked'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
