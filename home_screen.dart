import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Wattsapp'),
            actions: [
              const Icon(
                Icons.search,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(Icons.camera_alt),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Profile"),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text("Setting"),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text("Help"),
                        )
                      ])
            ],
            bottom: const TabBar(tabs: [
              Tab(child: Text('Chat')),
              Tab(child: Icon(Icons.group)),
              Tab(child: Text('Satus')),
              Tab(child: Text('Call')),
            ]),
          ),
          body: TabBarView(children: [
            // chat builder view
            ListView.builder(itemBuilder: ((context, index) {
              return const ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600')),
                title: Text('John Wick'),
                subtitle: Text('Welcome to Wattsapp Ui'),
                trailing: Text('12 pm'),
              );
            })),

            // Group builder view
            ListView.builder(itemBuilder: ((context, index) {
              return ListTile(
                leading: index % 2 == 0
                    ? const CircleAvatar(
                      
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600'))
                    : const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/7207758/pexels-photo-7207758.jpeg?auto=compress&cs=tinysrgb&w=600'),
                      ),
                title: index % 2 == 0
                    ? const Text('Flutter Developers')
                    : const Text('Front End Developer'),
                subtitle: const Text('Welcome to Wattsapp Ui'),
                trailing: const Text('12 pm'),
              );
            })),

            //Status builder view
            ListView.builder(itemBuilder: ((context, index) {
              return index == 1
                  ? const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'View Updates',
                        textScaleFactor: 1.2,
                      ),
                    )
                  : ListTile(
                      leading: index == 0
                          ? CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 20,
                                    left: 20,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          color: Colors.teal,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.teal, width: 2),
                              ),
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              ),
                            ),
                      title: index == 0
                          ? const Text('My Status')
                          : const Text('John Wick'),
                      subtitle: index == 0
                          ? const Text('Tap to add Status')
                          : const Text('3 PM'),
                    );
            })),

            //Call builder view
            buildListviewbulider(
              image1: const NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600'),
              name: 'John Wick',
            )
          ])),
    );
  }

//
  ListView buildListviewbulider({
    required NetworkImage image1,
    required String name,
    //item buider call
  }) {
    return ListView.builder(itemBuilder: ((context, index) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: image1,
        ),
        title: Text(name),
        subtitle: Text(index % 2 == 0 ? 'You Have Missed The Call' : '10 min'),
        trailing: Icon(index % 2 == 0 ? Icons.call : Icons.video_call),
      );
    }));
  }
}
