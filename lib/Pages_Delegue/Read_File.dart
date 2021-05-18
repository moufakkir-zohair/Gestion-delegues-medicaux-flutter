import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';



class ReadFile extends StatefulWidget {
  @override

  final String pdfasset;
  final String titre;

  ReadFile({this.pdfasset,this.titre});
  _ReadFileState createState() => _ReadFileState();
}

class _ReadFileState extends State<ReadFile> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titre),),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
        indicatorBackground: Colors.red,
        // showIndicator: false,
        // showPicker: false,
      ),
    );
  }
}