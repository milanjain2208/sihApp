import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewer extends StatelessWidget {
  final String path;
  PdfViewer({this.path});
  @override
  Widget build(BuildContext context) {
    return Container(
            child: PDFViewerScaffold(
              appBar: AppBar(
                centerTitle: true,
              title: Text("Preview Prescription"),
              backgroundColor: Colors.tealAccent,
              actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.mail),
                  label: Text("Mail"),
                onPressed: () async  {
                    print(path);
                 try{
                   final Email email = Email(
                     body: 'Prescripion',
                     subject: 'the Email Subject',
                     recipients: ['rohansharmagarwal@gmail.com'],
                     attachmentPath: path,
                     isHTML: false,
                   );
                   await FlutterEmailSender.send(email);
                 }
                 catch(err) {
                   print(err.toString());
                 }
                }, ),
              ],
            ),
            path: path,
        ),
    );
  }
}
