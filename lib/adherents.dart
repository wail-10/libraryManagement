import 'package:flutter/material.dart';

class Adherent {
  final String firstName;
  final String lastName;
  final String email;

  Adherent({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

class AdherentsPage extends StatefulWidget {
  const AdherentsPage({super.key});

  @override
  State<AdherentsPage> createState() => _AdherentsPageState();
}

class _AdherentsPageState extends State<AdherentsPage> {
  List<Adherent> adherents = [
    Adherent(
      firstName: 'Wail',
      lastName: 'Koundi',
      email: 'wail@gmail.com',
    ),
    Adherent(
      firstName: 'Leo',
      lastName: 'Messi',
      email: 'leo@gmail.com',
    ),
  ];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void addToList() {
    setState(() {
      adherents.add(
        Adherent(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
        ),
      );
    });
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
  }

  void removeFromList(index) {
    setState(() {
      adherents.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adherents Page',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: adherents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeFromList(index);
              },
            ),
            title: Text(
              adherents[index].firstName + ' ' + adherents[index].lastName,
            ),
            subtitle: Text(adherents[index].email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Ajouter un adhérent'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                      ),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Nom',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      addToList();
                      Navigator.pop(context);
                    },
                    child: Text('Ajouter'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
