import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedDummy = "Roboto";
  String selectedDummySize = "Small";
  String selectedLanguage = 'English';
  String selectedCountry = "India";
  String selectedFont = "Roboto";
  String selectedSize = "Small";
  Icon? caughtIcon;
  String signature = "Initial Text";
  String signaturey = "Initial text";
  TextEditingController textController = TextEditingController();
  TextEditingController signatureController = TextEditingController();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderlined = false;
  bool isLink = false;
  bool isLeft = false;
  bool isCenter = false;
  bool isRight = false;
  String? pickedImageAsset;
  String? pickedImageNetwork;

  // Drop down of font sizes
  List<String> sizes = [
    'Small',
    'Normal',
    'Large',
    'Huge',
  ];

  // Drop down of font family
  List<String> fonts = [
    'Roboto',
    'Abel',
    'GrapeNuts',
    'Ubuntu',
  ];

  // Drop down of Languages
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
  ];

  // Drop down of countries
  List<String> countries = [
    'India',
    'United States',
    'China',
    'Brazil',
    'Russia',
    'United Kingdom',
    'France',
    'Germany',
    'Italy',
    'Japan',
    'Canada',
    'Australia',
    'South Korea',
    'Spain',
    'Mexico',
    'Indonesia',
    'Nigeria',
    'Turkey',
    'Egypt',
    'South Africa',
  ];

  // Divider function after each row
  Divider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.black,
            height: 2,
          ),
        ),
      ],
    );
  }

  // Signature dialog
  Future<void> _showEditDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Signature'),
          content: TextField(
            controller: signatureController,
            decoration: InputDecoration(labelText: 'Enter new signature'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  signature = signatureController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Inserting link dialog
  void _insertLink() async {
    String? link = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insert Link'),
          content: TextField(
            decoration: InputDecoration(labelText: 'Enter URL'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('');
              },
              child: Text('Insert'),
            ),
          ],
        );
      },
    );

    if (link != null && link.isNotEmpty) {
      final currentText = textController.text;
      final selection = textController.selection;
      final newText = StringBuffer(currentText);
      newText.write(' ');
      newText.write(link);
      newText.write(' ');

      textController.value = TextEditingValue(
        text: newText.toString(),
        selection: TextSelection.collapsed(offset: selection.end + link.length + 2),
      );
    }
  }

  // Inserting Image dialog
  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {

        pickedImageAsset = null;
        pickedImageNetwork = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 150, left: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "General",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Labels",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Inbox",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Accounts and Import",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "General",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Filters and Blocked Addresses",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 3,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Language:",
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                          const SizedBox(
                            width: 200,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Gmail display language:"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: DropdownButton<String>(
                                      value: selectedLanguage,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedLanguage = newValue!;
                                        });
                                      },
                                      items: languages
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Change Language settings for other Google products",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Show all language options",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                       const SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Row(
                        children: [
                          const Text(
                            "Phone Number:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 170,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Default Country code"),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: DropdownButton<String>(
                              value: selectedCountry,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCountry = newValue!;
                                });
                              },
                              items: countries.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Default text style:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "(Use the 'Remove formatting' button on \n the toolbar to reset the default text style)",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            // height:,
                            // width: 600,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      // Color of the shadow
                                      offset: Offset(0, 2),
                                      // Offset of the shadow
                                      blurRadius: 4,
                                      // Spread of the shadow
                                      spreadRadius: 1),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DropdownButton<String>(
                                      value: selectedDummy,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedDummy = newValue!;
                                        });
                                      },
                                      items: ['Roboto','Abel','GrapeNuts','Ubuntu']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    DropdownButton<String>(
                                      value: selectedDummySize,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedDummySize = newValue!;
                                        });
                                      },
                                      icon: const Icon(Icons.sort_by_alpha),
                                      items: ['Small','Normal','Large','Huge']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                Text(
                                    "This is what your body text will look like")
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Stars:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 250,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text:
                                            'Drag the stars between the lists.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' The stars will rotate in the order shown below when you click successively. To learn the name of a star for \n search, hover your mouse over the image.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Presets:"),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text("1 star",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("4 star",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("all stars",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "In Use:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  DragTarget(
                                      builder: (_, val, __) {
                                        return Container(
                                          color: Colors.white,
                                          height: 20,
                                          width: 150,
                                          child: caughtIcon ?? const SizedBox(),
                                        );
                                      }, onAccept: (Icon icon) {
                                    caughtIcon = icon;
                                  }),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Not In Use:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 33,
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      feedback: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      feedback: const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                      ),
                                      feedback: const Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      feedback: const Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.red,
                                      ),
                                      feedback: const Icon(
                                        Icons.star,
                                        color: Colors.red,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.security_update_warning,
                                        color: Colors.grey,
                                      ),
                                      feedback: const Icon(
                                        Icons.security_update_warning,
                                        color: Colors.grey,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.double_arrow_sharp,
                                        color: Colors.orange,
                                      ),
                                      feedback: const Icon(
                                        Icons.double_arrow_sharp,
                                        color: Colors.orange,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.check_box,
                                        color: Colors.green,
                                      ),
                                      feedback:const Icon(
                                        Icons.check_box,
                                        color: Colors.green,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                      ),
                                      feedback: const Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.move,
                                    child: Draggable(
                                      child: const Icon(
                                        Icons.question_mark_sharp,
                                        color: Colors.brown,
                                      ),
                                      feedback: Icon(
                                        Icons.question_mark_sharp,
                                        color: Colors.brown,
                                      ),
                                      childWhenDragging: Container(
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "In Use:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "(appended at the end of all \n outgoing messages)"),
                              Text(
                                "Learn more",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 90,
                                width: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100, // Set a fixed width for the Text widget
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("$signature"),
                                      ),
                                    ),
                                    SizedBox(width: 50,),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        _showEditDialog();
                                        setState(() {
                                          signature = ""; // Clear the text
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        // Handle the clear button press
                                        setState(() {
                                          signature = "";
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
                                  color: Colors.white,
                                  border: Border.all(style: BorderStyle.solid,color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 90,
                            width: 600,
                            child: Column(
                              children: [
                                pickedImageAsset != null
                                    ? Image.asset(pickedImageAsset!)
                                    : pickedImageNetwork != null
                                    ? Image.network(pickedImageNetwork!)
                                    :
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      textAlign: isRight ? TextAlign.right : (isCenter ? TextAlign.center : TextAlign.left),
                                        style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                                        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                                        decoration: isUnderlined ? TextDecoration.underline: TextDecoration.none,
                                        fontFamily: (selectedFont == "Roboto") ? "Roboto" :
                                        ((selectedFont == "Abel") ? "Abel" :
                                        ((selectedFont == "GrapeNuts") ? "GrapeNuts" :
                                        ((selectedFont == "Ubuntu") ? "Ubuntu" : null))),

                                        fontSize : selectedSize == "Small" ? 8 : selectedSize == "Normal" ? 12 : selectedSize == "Large" ? 16 : 20,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                ),
                                Container(
                                  color: Colors.white,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),
                                      DropdownButton<String>(
                                        value: selectedFont,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedFont = newValue!;
                                            if(selectedFont == "Roboto"){
                                              setState(() {
                                                selectedFont == "Roboto";
                                              });
                                            } else if(selectedFont == "Abel"){
                                              setState(() {
                                                selectedFont == "Abel";
                                              });
                                            } else if(selectedFont == "GrapeNuts"){
                                              setState(() {
                                                selectedFont == "GrapeNuts";
                                              });
                                            } else if(selectedFont == "Ubuntu"){
                                              setState(() {
                                                selectedFont == "Ubuntu";
                                              });
                                            }
                                          });
                                        },
                                        items: fonts
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                ),
                                              );
                                            }).toList(),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedSize,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedSize = newValue!;
                                            if(selectedSize == "Small"){
                                              setState(() {
                                                selectedSize == "Small";
                                              });
                                            } else if(selectedFont == "Normal"){
                                              setState(() {
                                                selectedSize == "Normal";
                                              });
                                            } else if(selectedSize == "Large"){
                                              setState(() {
                                                selectedSize == "Large";
                                              });
                                            } else if(selectedSize == "Huge"){
                                              setState(() {
                                                selectedSize == "Huge";
                                              });
                                            }
                                          });
                                          },
                                        items: sizes
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                ),
                                              );
                                            }).toList(),
                                      ),
                                      IconButton(
                                        icon: Icon(isBold ? Icons.format_bold : Icons.format_bold_outlined),
                                        onPressed: () {
                                          setState(() {
                                            isBold = !isBold;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(isItalic ? Icons.format_italic : Icons.format_italic),
                                        onPressed: () {
                                          setState(() {
                                            isItalic = !isItalic;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(isUnderlined ? Icons.format_underline : Icons.format_underline),
                                        onPressed: () {
                                          setState(() {
                                            isUnderlined = !isUnderlined;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(isLink ? Icons.link : Icons.link_off),
                                        onPressed: () {
                                          _insertLink();
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.image),
                                        onPressed: () {
                                          _pickImage();
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.format_align_left),
                                        onPressed: () {
                                          setState(() {
                                            isLeft = !isLeft;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.format_align_center),
                                        onPressed: () {
                                          setState(() {
                                            isCenter = !isCenter;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.format_align_right),
                                        onPressed: () {
                                          setState(() {
                                            isRight = !isRight;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                              color: Colors.white,
                              border: Border.all(style: BorderStyle.solid,color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        width: 400,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text("Signature defaults")
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Row(children: [
                              Text("For New Emails Use"),
                              SizedBox(width: 40,),
                              Text("On Reply/Forward Use"),
                            ],),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: signature,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      signature = newValue!;
                                    });
                                  },
                                  items: ['No signature','$signature']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList(),
                                ),
                                const SizedBox(width: 60,),
                                DropdownButton<String>(
                                  value: signaturey,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      signaturey = newValue!;
                                    });
                                  },
                                  items: ['Initial text']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
