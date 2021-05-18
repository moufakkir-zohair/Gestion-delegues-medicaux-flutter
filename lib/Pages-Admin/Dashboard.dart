
import 'package:flutter/material.dart';
import 'package:gestion_delegue/Authentification.dart';
import 'package:gestion_delegue/Pages-Admin/Delegue/Liste-Delegue.dart';
import 'package:gestion_delegue/Pages-Admin/Docteur/Liste-Docteur.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gestion_delegue/Pages-Admin/Medicament/Liste-Medicament.dart';

class Dashboard extends StatefulWidget{
  final String nbreDoctor;
  final String nbreDelegue;
  final String nbreMedicament;
  final String Nom;
  final String Prenom;
  final String Email;

  Dashboard({this.nbreDoctor=" ",this.nbreDelegue=" ",this.nbreMedicament=" ",this.Nom=" ",this.Prenom=" ",this.Email=" "});
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
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
                    MaterialPageRoute(builder: (BuildContext context)=>Dashboard(nbreDoctor:widget.nbreDoctor,nbreDelegue:widget.nbreDelegue,nbreMedicament:widget.nbreMedicament,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
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
                      MaterialPageRoute(builder: (BuildContext context)=>Liste_Docteur(nbreDoctor:widget.nbreDoctor,nbreDelegue:widget.nbreDelegue,nbreMedicament:widget.nbreMedicament,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                    );
                  },
                  title: Text('Liste des docteurs'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Delegue(nbreDoctor:widget.nbreDoctor,nbreDelegue:widget.nbreDelegue,nbreMedicament:widget.nbreMedicament,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('Liste des delegués'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>Liste_Medicament(nbreDoctor:widget.nbreDoctor,nbreDelegue:widget.nbreDelegue,nbreMedicament:widget.nbreMedicament,Nom:widget.Nom,Prenom:widget.Prenom,Email:widget.Email)),
                  );
                },
                child:ListTile(
                  title: Text('liste des médicaments'),
                  leading: Icon(Icons.list,color: Colors.blue),
                )
            ),
            Divider(),
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
                             Image.asset("assets/images/doctor.png",width: 100,height: 100,),
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                               "Docteur",
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
                               widget.nbreDoctor,
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
                             Image.asset("assets/images/delegue.png",width: 100,height: 100,),
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                               "Délégué",
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
                               widget.nbreDelegue,
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
                             Image.asset("assets/images/medicament.png",width: 100,height: 100,),
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                               "Médicament",
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
                               widget.nbreMedicament,
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
