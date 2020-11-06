import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child:  MyHomePage(),
          ),
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;


  MyHomePage({this.onPressed, this.tooltip, this.icon});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode = FocusNode();
  // Text fields
  TextEditingController edittext1 = new TextEditingController();
  TextEditingController edittext2 = new TextEditingController();
  TextEditingController edittext3 = new TextEditingController();
  TextEditingController titleController = TextEditingController();

  String _textString="Javob:  ";
  String txt="";

  bool checkTextFieldEmptyOrNot() {
    String text1, text2,text3;
    text1 = edittext1.text;
    text2 = edittext2.text;
    text3 = edittext3.text;

    if (text1 == '') {
      return false;
    }
    if (text2 == '') {
      return false;
    }
    if(text3==''){
      return false;
    }
    return true;
  }

  bool checkTextFieldLimitation(){
    String txt1, txt2;
    txt1 = edittext2.text;
    txt2 = edittext3.text;
    if(int.parse(txt1.toString())>=37){
      return false;
    }
    if(int.parse(txt2.toString())>=37){
      return false;
    }

    return true;
  }

  void setText(String data){
    setState(() {
      _textString=data;
    });
  }

  // asosiy o'zgaruvchilar
  String input, output,  alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int inp,outp;
  double anyNumber=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    edittext2.addListener(() {
      if(int.parse(edittext2.text)>=35){
        print("value: ${edittext2.text}");
      }else{
        print("value: TT");
      }

       //use setState to rebuild the widget
       setState(() {

       });

     });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    edittext2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
          child: new Container (
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                      child: new Center(
                          child: new Column(
                              children: [
                                new Padding(padding: EdgeInsets.only(top: 55.0)),
                                new Text('SANOQ SISTEMASI',
                                  style: new TextStyle(
                                      color: Colors.blue,
                                      fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    ),
                                ),
                                new Padding(padding: EdgeInsets.only(top: 40.0)),
                                new TextFormField(
                                  controller: edittext1,
                                  maxLength: 25,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                                  ],
                                  textCapitalization: TextCapitalization.characters,
                                  decoration: new InputDecoration(
                                    labelText: "Sonni kiriting",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ), //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Email cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                new Padding(padding: EdgeInsets.only(top: 28.0)),
                                new TextFormField(
                                  controller: edittext2,
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                   decoration: new InputDecoration(
                                    labelText: "Qaysi sanoq sistemasida turibdi",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Email cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                new Padding(padding: EdgeInsets.only(top: 28.0)),
                                new TextFormField(
                                  controller: edittext3,
                                  onChanged: (text){
                                    print("First text field: $text");
                                  },
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                    decoration: new InputDecoration(
                                    labelText: "O`tkazish kerak bo'lgan sanoq sistema",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Email cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                new Padding(padding: EdgeInsets.only(top: 28.0)),
                                new Container(
                                  child: new Material(
                                    child: new InkWell(
                                                onTap: () {
                                                  if(!checkTextFieldEmptyOrNot()){
                                                    Scaffold.of(context).showSnackBar(SnackBar(
                                                      content: Text("Raqamlarni to'liq kiriting !!!"),
                                                    ));
                                                  }else{
                                                   try{
                                                     if(checkTextFieldLimitation()){
                                                       int w=0;
                                                       input = edittext1.text.toString();
                                                       output = "";
                                                       if(input.isEmpty||edittext2.text.toString().isEmpty||
                                                           edittext3.text.toString().isEmpty){
                                                         inp=0;
                                                         outp=0;
                                                         //  Answer.setText("Kiritilmagan!");

                                                       }else {
                                                         inp = int.parse(edittext2.text.toString());
                                                         outp = int.parse(edittext3.text.toString()).toInt();

                                                         input = input.toUpperCase();
                                                         edittext1.text=input;
                                                         for (int i = 0; i < input.length; i++) {
                                                           if ((input[i].codeUnitAt(0) < 48 && input[i].codeUnitAt(0) >57) || (input[i].codeUnitAt(0) < 65 && input[i].codeUnitAt(0) >90)) {
                                                             w = 1;
                                                             Scaffold.of(context).showSnackBar(SnackBar(
                                                               content: Text("Belgilar noto'gri!!!"),));
                                                             break;
                                                           }
                                                         }
                                                         if (w == 0)
                                                           for (int i = 0; i < input.length; i++) {
                                                             if (alphabet.indexOf(input[i]) >= inp) {
                                                               w = 1;
                                                               setText("Xato !!!");
                                                               break;
                                                             }else{
                                                               w = 0;
                                                             }
                                                           }
                                                         if (w == 0) {
                                                           for (int i = 0; i < input.length; i++) {
                                                             for (int j = 0; j < alphabet.length; j++) {
                                                               if (input[i] == alphabet[j])
                                                                 anyNumber += j * pow(inp, input.length - i - 1);
                                                             }
                                                           }
                                                           while (anyNumber >= 1) {
                                                             output = alphabet[anyNumber.toInt() % outp] + output;
                                                             anyNumber=anyNumber/(outp);
                                                           }
                                                           // Scaffold.of(context).showSnackBar(SnackBar(
                                                           //     content: Text("Javob:\n" + output)));
                                                           setText("Javob: " + output);
                                                           txt=output;
                                                         }

                                                       }

                                                     }else{
                                                       Scaffold.of(context).showSnackBar(SnackBar(
                                                         content: Text("Eng katta sanoq tizimi 36 hisoblanadi, siz bu chegaradan o'tdindiz !"),));
                                                     }
                                                   }catch(e){
                                                     Scaffold.of(context).showSnackBar(SnackBar(
                                                         content: Text("Xatolik sodir bo'ldi "+e.toString()),));
                                                   }

                                                  }
                                                },
                                                child: Container(
                                                  height: 57.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.blue,
                                                      style: BorderStyle.solid,
                                                      width: 0.2,
                                                    ),
                                                    color: Colors.blue,
                                                    borderRadius: BorderRadius.circular(30.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Text(
                                                          "Hisoblash",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'Montserrat',
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w600,
                                                            letterSpacing: 1,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                      ),
                                  ),
                                ),
                                new Padding(padding: EdgeInsets.only(top: 28.0),),
                                Material(
                                  child: new InkWell(
                                        onLongPress: (){
                                          Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text("Ko'chirildi !"),
                                          ));
                                          Clipboard.setData(ClipboardData(text: txt));
                                        },
                                        child: new Container(
                                           child: new Text(
                                             _textString,
                                               style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 25.0,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal
                                              ),
                                        ),
                                      ),
                                  ),
                                ),
                                //bottomButtons()
                              ]
                          )
                      )
                ),
      );
  }

  Padding emailView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.alternate_email,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


