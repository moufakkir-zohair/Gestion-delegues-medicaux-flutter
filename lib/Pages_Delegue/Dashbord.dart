
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_delegue/Authentification.dart';
import 'package:gestion_delegue/Pages_Delegue/Commande/Liste_Commande.dart';
import 'package:gestion_delegue/Pages_Delegue/Rapport/Liste_Rapport.dart';

import 'package:gestion_delegue/Pages_Delegue/Rendez_Vous/Liste_Rendez.dart';
import 'package:gestion_delegue/Pages_Delegue/Voyages/Liste_Voyage.dart';



class Dashboard_Delegue extends StatefulWidget{
  final String nbreRapport;
  final String nbreVoyage;
  final String nbreRendez;
  final String nbreCommande;
  final String Nom;
  final String Prenom;
  final String Email;

  Dashboard_Delegue({this.nbreRapport=" ",this.nbreVoyage=" ",this.nbreRendez=" ",this.nbreCommande=" ",this.Nom=" ",this.Prenom=" ",this.Email=" "});
  _Dashboard_DelegueState createState() => _Dashboard_DelegueState();
}

class _Dashboard_DelegueState extends State<Dashboard_Delegue>{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text('Tableau de board'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color:Colors.black), onPressed: null)
        ],
      ),
      drawer:  new Drawer(
        child:Column(
          children: <Widget>[
            //header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.tealAccent,
              child: Center(
                  child:Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 120,
                        margin: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: new AssetImage('assets/images/delegue.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        widget.Prenom+" "+widget.Nom,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Niconne',
                        ),),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.Email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),),
                    ],
                  )
              ),
            ) ,

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Dashboard_Delegue(nbreRapport:widget.nbreRapport,nbreVoyage:widget.nbreVoyage,nbreRendez:widget.nbreRendez,nbreCommande:widget.nbreCommande,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('Tableau de board'),
                  leading: Icon(Icons.dashboard,color: Colors.blue,),
                )
            ),

            InkWell(
                child:ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Rendez(nbreRapport:widget.nbreRapport,nbreVoyage:widget.nbreVoyage,nbreRendez:widget.nbreRendez,nbreCommande:widget.nbreCommande,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                    );
                  },
                  title: Text('Liste des rendez-vous'),
                  leading: Icon(Icons.date_range,color: Colors.blue),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Rapport(nbreRapport:widget.nbreRapport,nbreVoyage:widget.nbreVoyage,nbreRendez:widget.nbreRendez,nbreCommande:widget.nbreCommande,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des rapport'),
                  leading:  Icon(FontAwesomeIcons.edit,
                      color: Colors.blue, size: 16.0),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Voyage(nbreRapport:widget.nbreRapport,nbreVoyage:widget.nbreVoyage,nbreRendez:widget.nbreRendez,nbreCommande:widget.nbreCommande,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des voyages'),
                  leading: Icon(FontAwesomeIcons.plane,
                      color: Colors.blue, size: 16.0),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Commande(nbreRapport:widget.nbreRapport,nbreVoyage:widget.nbreVoyage,nbreRendez:widget.nbreRendez,nbreCommande:widget.nbreCommande,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des commandes'),
                  leading: Icon(FontAwesomeIcons.list,
                      color: Colors.blue, size: 16.0),
                )
            ),


            Divider(
              //height: 64,
              thickness: 3,
              color: Colors.tealAccent,
              indent: 16,
              endIndent: 15,
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Authentification()),
                  );
                },
                child:ListTile(
                  title: Text('Se Déconnecter'),
                  leading: Icon(Icons.exit_to_app,color: Colors.blue),
                )
            ),
          ],
        ),
      ),

      body: Container(
        child:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),

              Center(
                child:SizedBox(
                  child: ColorizeAnimatedTextKit(
                    text: [
                      "BIENVENUE",
                      "BIENVENUE",
                      "BIENVENUE",
                    ],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Horizon"
                    ),
                    colors: [
                      Colors.purple,
                      Colors.tealAccent,
                      Colors.yellow,
                      Colors.red,
                    ],
                    repeatForever: true,
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: <Widget>[
                      SizedBox(
                        width: 160.0,
                        height: 180.0,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/book.png",width: 100,height: 100,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Rapport",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  widget.nbreRapport,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 180.0,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/Commande.png",width: 100,height: 100,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Commande",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  widget.nbreCommande,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 180.0,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/voyage.png",width: 100,height: 100,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Voyage",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  widget.nbreVoyage,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 180.0,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/images/rendez.png",width: 100,height: 100,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Rendez-vous",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  widget.nbreRendez,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}






