import 'package:gsoc/EmergencyList/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(
//         //const change
//         const MaterialApp(
//       //debugShowCheckedModeBanner: false,
//       home: Emergency(),
//     ));

Future<void> _launchUrl(String phoneNumber) async {
  final Uri _url = Uri.parse('tel:$phoneNumber');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}
class _EmergencyState extends State<Emergency> {
//warning cant be final
  final List<User> _users = [  ];
  //create function for adding users
  void addusers(final String name, final String username,bool isFollowedByMe) {
    _users.add(User(name, username,isFollowedByMe));
  }

  void deleteusers(final String names, final String usernames,bool isFollowedByMes) {
      _users.remove(User(names,usernames,isFollowedByMes));
  }
  final _formKey = GlobalKey<FormState>();
  void showSimpleModalDialog(context) {
    String names = "C";
    String usernames = "B";
    bool isFollowedByMe;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                constraints: BoxConstraints(maxHeight: 350),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      onSaved: (value) =>
                                          {names = value.toString()},
                                      decoration: InputDecoration(
                                          hintText: "Name",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors.black)))),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      onSaved: (value) =>
                                          {usernames = value.toString()},
                                      decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors.black)))),
                                ),
                            
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    child: Text("Submit"),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        addusers(
                                            names, usernames, false);
                                        setState(() {
                                          
                                        });
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ));
        });
  }

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: Container(
          color: Colors.grey.shade900,
          child: _foundedUsers.length > 0
              ? ListView.builder(
                  itemCount: _foundedUsers.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.25,
                        children: [
                          SlidableAction(
                            label: 'Archive',
                            backgroundColor: Colors.transparent,
                            icon: Icons.archive,
                            onPressed: (context) => print("archive"),
                          ),
                          SlidableAction(
                            label: 'Share',
                            backgroundColor: Colors.transparent,
                            icon: Icons.share,
                            onPressed: ((context) => {print("share")}),
                          )
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.25,
                        children: [
                          SlidableAction(
                              label: 'Delete',
                              backgroundColor: Colors.transparent,
                              icon: Icons.delete,
                    
                              onPressed:(context)=>{ 
                                //print(_foundedUsers[index].name),deleteusers(_foundedUsers[index].name,_foundedUsers[index].username,_foundedUsers[index].image,_foundedUsers[index].isFollowedByMe,_users)
                                _users.removeAt(index),
                                setState(() {
                                  
                                },)
                                }),
                              
                          SlidableAction(
                              label: 'More',
                              backgroundColor: Colors.transparent,
                              icon: Icons.more,
                              onPressed: ((context) => {print("More")}))
                        ],
                      ),
                      child: userComponent(user: _foundedUsers[index]),
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.white),
                )),
        )),
        
      Container(
            width: double.infinity,
            height:50,
            color: Colors.grey.shade900,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  showSimpleModalDialog(context);
                },
                style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0), 
                              backgroundColor: Colors.blue,
                          // maximumSize: Size(40,40),
                ),
                child: Text('Add Contacts'),
              ),
            ),
          ),
    //   
    // 
    ]),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
          
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
              //change to calling that number
              onTap: () => {
                
                // _launchPhoneURL(user.username)
              }
              ,
              child: ElevatedButton(
                onPressed: () {_launchUrl(user.username);},
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0), 
                        backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "CALL",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
              )
        ],
      ),
    );
  }
}
