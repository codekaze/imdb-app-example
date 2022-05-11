import 'package:flutter/material.dart';
import 'package:imdb_app/model/ticket.dart';
import 'package:imdb_app/service/ticket_service.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: FutureBuilder(
        future: TicketService.getTicket(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return Container();
          Ticket ticket = (snapshot.data as Ticket);

          return ListView.builder(
            itemCount: ticket.items!.length,
            itemBuilder: (context, index) {
              var item = ticket.items![index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  title: Text("${item.title}"),
                  subtitle: Text("${item.genres}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
