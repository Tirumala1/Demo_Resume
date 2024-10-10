import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume PDF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResumePDFScreen(),
    );
  }
}

class ResumePDFScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await generatePDF(context);
          },
          child: const Text('Generate Resume PDF'),
        ),
      ),
    );
  }

  Future<void> generatePDF(BuildContext context) async {
    final pdf = pw.Document();
    final callIconData = await rootBundle.load('assets/call.png');
    final emailIconData = await rootBundle.load('assets/email.png');
    final locationIconData = await rootBundle.load('assets/home.png');

    final callIcon = pw.MemoryImage(callIconData.buffer.asUint8List());
    final emailIcon = pw.MemoryImage(emailIconData.buffer.asUint8List());
    final locationIcon = pw.MemoryImage(locationIconData.buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(30), // Page margin
        build: (pw.Context context) {
          return [
            // Full-page container with border
            pw.Container(
              width: double.infinity,

              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColors.black,
                  width: 2.0, // Thickness of the border
                ),
                borderRadius:
                    pw.BorderRadius.circular(8), // Rounded corners (optional)
              ),
              padding:
                  const pw.EdgeInsets.all(30), // Padding inside the container
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Header Section
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'ISABEL MERCADO',
                            style: pw.TextStyle(
                              fontSize: 25,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Container(
                            width: 230, // Width of the line
                            height: 1, // Height of the line
                            color: PdfColors.black,
                          ),
                          pw.SizedBox(height: 5),
                          pw.Text('Executive Secretary',
                              style: const pw.TextStyle(fontSize: 12)),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Row(
                            children: [
                              pw.Text('+123-456-7890',
                                  style: const pw.TextStyle(fontSize: 10)),
                              pw.SizedBox(width: 5),
                              pw.Image(callIcon, width: 12, height: 12),
                            ],
                          ),
                          pw.SizedBox(height: 5),
                          pw.Row(
                            children: [
                              pw.Text('hello@reallygreatsite.com',
                                  style: const pw.TextStyle(fontSize: 10)),
                              pw.SizedBox(width: 5),
                              pw.Image(emailIcon, width: 12, height: 12),
                            ],
                          ),
                          pw.SizedBox(height: 5),
                          pw.Row(
                            children: [
                              pw.Text('123 Anywhere St., Any City',
                                  style: const pw.TextStyle(fontSize: 10)),
                              pw.SizedBox(width: 5),
                              pw.Image(locationIcon, width: 12, height: 12),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 15),
                  pw.Divider(
                    thickness: 8.0,
                    color: PdfColors.black,
                    indent: 0,
                    endIndent: 0,
                  ),
                  pw.SizedBox(height: 20),

                  // Summary Section
                  pw.Container(
                    width: double.infinity,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        // Centered Text
                        pw.Text(
                          'SUMMARY',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                        // Small Line Underneath, Centered
                        pw.SizedBox(
                            height:
                                5), // Small space between the text and the line
                        pw.Container(
                          width: 150, // Width of the line
                          height: 1, // Height of the line
                          color: PdfColors.black,
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  pw.Align(
                    alignment: pw.Alignment
                        .center, // Centers the text horizontally and vertically
                    child: pw.Text(
                      'Highly motivated and professional Executive Secretary with over 7 years of experience providing high-level support to senior executives. Proficient in managing calendars, organizing meetings and events, handling confidential documents, and communicating with internal and external stakeholders. Possesses exceptional communication and interpersonal skills with a proven ability to work independently and as part of a team.',
                      style: const pw.TextStyle(fontSize: 12),
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Education and Experience Section
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Education
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'EDUCATION',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Container(
                              width: 85, // Width of the line
                              height: 1, // Height of the line
                              color: PdfColors.black,
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                children: [
                                  pw.TextSpan(
                                    text:
                                        'Ginyard International Co. University\n',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text:
                                        'Bachelors Degree in Business Administration\n2016 - 2020',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.RichText(
                              text: pw.TextSpan(
                                children: [
                                  pw.TextSpan(
                                    text: 'Studio Shodwe University\n',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text:
                                        'Diploma in Executive Assistance\n2020 - 2022',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                // Skills
                                pw.Expanded(
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'SKILLS',
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          fontWeight: pw.FontWeight.bold,
                                        ),
                                      ),
                                      pw.Container(
                                        width: 50, // Width of the line
                                        height: 1, // Height of the line
                                        color: PdfColors.black,
                                      ),
                                      pw.SizedBox(height: 20),
                                      pw.Bullet(
                                          text:
                                              'Strong organizational and time-management skills'),
                                      pw.Bullet(
                                          text:
                                              'Excellent communication and interpersonal skills'),
                                      pw.Bullet(
                                          text:
                                              'Excellent communication and interpersonal skills'),
                                      pw.Bullet(
                                          text:
                                              'Excellent communication and interpersonal skills'),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(height: 20),
                                // Certifications
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                // Skills
                                pw.Expanded(
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'CERTIFICATIONS',
                                        style: pw.TextStyle(
                                          fontSize: 14,
                                          fontWeight: pw.FontWeight.bold,
                                        ),
                                      ),
                                      pw.Container(
                                        width: 120, // Width of the line
                                        height: 1, // Height of the line
                                        color: PdfColors.black,
                                      ),
                                      pw.SizedBox(height: 15),
                                      pw.Bullet(
                                          text:
                                              'Strong organizational and time-management skills'),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(width: 20),
                                // Certifications
                              ],
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Container(
                        width: 1, // Thickness of the vertical divider
                        height:
                            450, // Height of the divider; adjust according to your needs
                        decoration: const pw.BoxDecoration(
                          color: PdfColor.fromInt(
                              0xFF888888), // Define the color as a PdfColor
                        ),
                      ),
                      pw.SizedBox(width: 10),

                      // Professional Experience
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'PROFESSIONAL EXPERIENCE',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Container(
                              width: 200, // Width of the line
                              height: 1, // Height of the line
                              color: PdfColors.black,
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              'Executive Secretary ',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'ingone company |2015 ',
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Bullet(
                              text:
                                  'Executive Assistant at Wainbex Inc.\n2016 - 2018',
                            ),
                            pw.Text(
                              'Executive Secretary ',
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'ingone company |2015 ',
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Bullet(
                              text:
                                  'Flutter developer with more than a year of experience in the IT field. competent in creating and managing cross-platform mobile apps with Dart and Flutter.',
                            ),
                            pw.Bullet(
                              text:
                                  'A track record of successfully working with backend developers and designers to produce UI/UX experiences that are responsive and seamless.',
                            ),
                            pw.Bullet(
                              text:
                                  'solid experience putting state management strategies into practice, integrating RESTful APIs.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),

                  // Skills and Certifications Section
                ],
              ),
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
