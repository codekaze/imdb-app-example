import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:core';

import '../model/ticket.dart';

class TicketService {
  static Future<Ticket> getTicket() async {
    final url = "https://imdb-api.com/en/API/ComingSoon/k_s2mtrq1j";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}.');
    }

    final data = convert.jsonDecode(response.body);

    print(data["items"].length);

    Ticket ticket = Ticket.fromJson(data);
    print("Ticket Length: ${ticket.items!.length}");

    //ticket index [0]
    print("Ticket index 0:");
    print(ticket.items![0].image);

    return ticket;
  }
}
