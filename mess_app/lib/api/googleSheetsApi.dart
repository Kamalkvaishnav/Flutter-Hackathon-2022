import 'package:gsheets/gsheets.dart';
import 'package:mess_app/feedbackform.dart';
import 'package:mess_app/models/feedformModel.dart';
class googleSheetsAPI
{
  static const _credentials=r'''
  {
  "type": "service_account",
  "project_id": "qrcodescanner-338417",
  "private_key_id": "736e01ec84c5893264a3c5cad51c43fb2b7bcf5d",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCxqrcd433CR9FC\nGDI72v1Vf219RH5sQemhMcfPJUY/AJCbggY5Z8JZuoapKWHQrZWl/UggtLzS53aS\nNtTukuhn6irEYipfM5QccF1g7FtGLSS11AOX+jIdgJ6nDF0FntP/iyukL/+8/05J\n7rIBNAfyLl5/LkvDhUKzjeIdL18y0QFNY79PiV3YpD9X+0UQr8A0H3yRHJsnGEWg\nFFT6LmfbV3LyMjh/rat99w89l+5/YWXuthQJWtZW3cWnzhApsQwvSxgJuy7RLyUT\n755agL78V7SJWSSUkDh0l15DJ5Kdx8CcF347mLUIMRmxhXAtA36GAO/rv5qvEekN\nuKan1jIlAgMBAAECggEADQ92ofIs4Xuet2lzRTvQ7wMMt8OxjiBo80TnN6QO05Il\nZI5yCgWa9OD7Bd5ukVo2q7AV0vRWWSP+GbuBev7o/2foYu1bHgp68yg+GmI68iAJ\nbdBlvztQ3yMAXAP9ppceuySuPZtFr81jd5iIv1aQKvkbpeUaWVzSIsQ7AK2QevoL\ncDufhqJ8L6usBo+UVZy9tmMBNwHGIGOyAO9tabDPPgqgrOgDpa+G5KBpJ1FlvWy6\nREen56UAII0isskMwhyx50Ya8lnFRP/pNHq8nfr1CzkRSkFf0Hmkz3Ffy82MMXku\nMWP9cx3spIVvyFTSp7cl06+oxYsEfSJdmXlMy1C0gQKBgQDsT7eGC64rNsxwD9eA\ntiiI8rKn5EBfJ/OMHkw7KIa915pFcNQYyCZ/CJ9YxSKDcnP7LkJ8LYp8cVLBIysK\nppZX+loqAX7UgQC8C60uFDxW5q/51t3CYRdxg09+h3jjgIZC2smgLTRr+a79HgO4\nc/atHyBEBsBPBG1TKqS7X8iGxQKBgQDAeCtyw53VS9se0Q+vvmNCfwtltIxTZ21K\nOH/ePsm/J1SZmDc3IZTsXbcx/qxOb7iYxMcLipI+yOfRfgsbcwzjJZV3z9YQqKVk\nfqvXTlBKWnHorfusEg8o1doUIqCaTQZHMA0eYfUiS6pkQO8TbX+nwC0l1b192yFH\nTgggPqyz4QKBgQDKZxkVCgoa32vJi/gUOXGMovucy+bK2ghDemvmu7Z1AicT1SkF\nNOGsKvF48hi2p6BpgtzVSZh1MAcmf/3MuJTLNBZoJjHAx+GeLw4dCp4H/Ly7bGsy\no0CWLFc5U8WabqoQtx69QBrHZOuZx0x+f2zIKYHUYkfzJiKRelPwXYD+1QKBgQCr\nbJyuG+LA7k4ctXG2QulfeY4qKNPvGShzOb1RsjS4Z4xnPPa4yNU+bP3UrpLDTahp\nkKID+ojlGMW4hf3YlfE9guUMkHWF4t9kkZn2K09B2iqoZgXJLVCJO2eAFZNbuwzD\nbN3SWMcfo6sAngESGa3gOD89+pBKv1h1jN+Z8JiboQKBgQDTme/Cm5YNva6mwiFR\nqGcKAKY+rjgvEig7BgajMhSGK775Qjgf6XkD9PRjy30aXkQom77wga16DgqqcHO0\nv6vl17Pi4wknZLlV1Aevs57PSAiaYbvLyxlJRmVxS4HCL/NBXYXN7egmyKMrMvM+\nTEA0Mhntol/QEYa0tKQeD4d5kA==\n-----END PRIVATE KEY-----\n",
  "client_email": "qrcodescan@qrcodescanner-338417.iam.gserviceaccount.com",
  "client_id": "100791816903592314710",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/qrcodescan%40qrcodescanner-338417.iam.gserviceaccount.com"
}''';

  static final _googleSheetID="1sHF_3KWYFCSgioYowDmqaFDMidjt0Y24g1yBFYy97Tc"; 
  static final _gSheets=GSheets(_credentials);
  static late Worksheet _feedBackSheet;

  static Future init() async
  {
    try {
      
      final googleSheet= await _gSheets.spreadsheet(_googleSheetID);
      _feedBackSheet=await _getWorkSheet(googleSheet,title:"JaiswalOldFeedback");
      
      // await _feedBackSheet!.clear();
    
      final first_row=feedbackFeilds.getfields();
      
      // _userSheet!.values.insertRow(1, first_row);
      // _trafficSheet!.values.insertRow(1, traffic_first_row);
       _feedBackSheet.values.insertRow(1, first_row);
    } catch(e) {
      print(e);
    }
  }
   static Future<Worksheet> _getWorkSheet(
  
    Spreadsheet spreadsheet,
    {
      required String title,

    })async
    
    { 
      try
      {
       return await spreadsheet.addWorksheet(title);
      }
      catch(e)
     {
       return  spreadsheet.worksheetByTitle(title)!;
     }
    }


    static Future insert(List<Map<String,dynamic>> rowList) async
    {
      _feedBackSheet.values.map.appendRows(rowList);
    }
}