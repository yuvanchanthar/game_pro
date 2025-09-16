import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(home: MainPage(),));
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Column(
        children: [
          Container(
         
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> GamePage()));
                
              
              },
              child: Text("START"),
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,),
            ),
            
            
          ),
          
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                
                
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>GamePage()));

              },
              child: Text("START"),
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,),
            ),
          )
          
        ],
      ),
      

      
    );

   
  }
}
class GamePage extends StatefulWidget{
  
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double  bluecardheight =0;
  double redcardheight =0;
  int PlayerAscore = 0;
  int PlayerBscore= 0;
  bool intial = false;
  @override
  Widget build(BuildContext context) {
    if(intial == false){
       bluecardheight= MediaQuery.of(context).size.height/2;
       redcardheight= MediaQuery.of(context).size.height/2;

       intial = true;

    }
   
   return Scaffold(
    
      
    body: Column(
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,

          onPressed: () {
            setState(() {
              bluecardheight = bluecardheight+30;
              redcardheight = redcardheight-30;
              PlayerBscore = PlayerBscore+5;
            });
            double winningHeight = MediaQuery.of(context).size.height-60;
            //print(bluecardheight);
            //print(winningHeight);
            if(bluecardheight > winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(PlayerBscore,"b")));

            }            
          },
          child: Container(
            color: Colors.blueAccent,
            height: bluecardheight,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [ 
                Expanded(child: Text("PLAYER B", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                
              Text(PlayerBscore.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)],
            )
          ),
        ),
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              redcardheight = redcardheight+30;
              bluecardheight = bluecardheight-30;
              PlayerAscore = PlayerAscore +5;
            });
            double screenHeight = MediaQuery.of(context).size.height;
            double winningHeight = MediaQuery.of(context).size.height-60;
          
          
            //print(redcardheight);
            //print(winningHeight);
            if(redcardheight > winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(PlayerAscore,"a")));
            }
            
          },
          child: Container(
            color: Colors.redAccent,
            height: redcardheight,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(child: Text("PLAYER A", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                
                Text(PlayerAscore.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ],
            )
          ),
        ),
        

        

      ],
    ),
   );
  }
}
class ResultPage extends StatelessWidget{
  int score=0;
  String player="";
  ResultPage(this.score,this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            Text(player == "a" ? "PLAYER A WON" : "PLAYER B WON",style: TextStyle(fontSize: 35),),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
        
            },
            child: Text("Restart Game"),
            color: Colors.white,)
          ],
        ),
      )
      
      );
    
  }
}