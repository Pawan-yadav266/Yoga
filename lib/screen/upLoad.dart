import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  dialogBox(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actions: [
          Center(
            child: Column(children:  [
              InkWell(
                onTap:(){
                  getImageCamera();
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  leading: Icon(Icons.camera),
                  title: Text(
                "Camera",
                style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap:(){
                  getImageGallery();
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  leading: Icon(Icons.add_photo_alternate_outlined),
                  title: Text(
                "Gallery",
                style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String text= "UPLOAD";

  Future getImageGallery() async
  {
    final pickFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);

    if(pickFile!=null)
      {
        image = File(pickFile.path);
        setState(() {

        });
      }
    else{
      print("No image Selected");
    }
  }

  Future getImageCamera() async
  {
    final pickFile = await _picker.pickImage(source: ImageSource.camera,imageQuality: 80);

    if(pickFile!=null)
    {
      image = File(pickFile.path);
      setState(() {

      });
    }
    else{
      print("No image Selected");
    }
  }

  Future uploadImage() async{
    setState(() {
      showSpinner=true;
    });

    var stream  = http.ByteStream(image!.openRead());
    stream.cast();

    var length = image!.lengthSync();
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = http.MultipartRequest("POST", uri);

    request.fields["title"] = itemName.text.toString();
    request.fields["price"] = itemPrice.text;

    var multiport = http.MultipartFile(
      "image",
      stream, length);

    request.files.add(multiport);

    var response  = await request.send();

    if(response.statusCode == 200)
      {
        print("image UPloaded");
        print(response.contentLength.toString());
        setState(() {
          showSpinner=false;
          text = "UPLOADED";
        });
      }
    else{
      print("NOt uploaded");
      setState(() {
        showSpinner=false;
        text = "SOME ERROR";
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Item"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                dialogBox(context);
              },
              child: Container(
                color: Colors.blueGrey.withOpacity(0.5),
                margin: EdgeInsets.all(12),
                height: 150,
                width: double.maxFinite,
                child: image == null? Center(child: Icon(Icons.add_a_photo)):
                    Container(
                      child: Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: itemName,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: itemPrice,
                    decoration: InputDecoration(labelText: "Price"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                uploadImage();
              },
              child: Center(
                  child: Container(
                height: 60,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: Center(
                  child: !showSpinner?Text("UPLOAD",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)):CircularProgressIndicator(color: Colors.white,)
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
