import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutterworkshop2022",
  "private_key_id": "4c6e71796d17a4d54e26e247006da39417386db8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCwJ984Bya8rHSY\njJfcX5z6/Jfb29Wj6MbLgkencv6pF/A4AixTqnPitQ4vCNJ2mEUo3C98+cMkZONQ\n1MVf2EZ9Hvbu0iscrOedwTdEovUQYPvrd2YTvQKdRbDDjafznlX9i2OtJMIzBKyU\nAlB5VCXbZdwlMK+YPNjANW7fqwIKL7frJWZZicKJ66iDo1QgdqSriWcWfpSpxtwG\n2/KTBvjuVXdd5VQPG84HscU2+I2UYgBVcNwZqQ/0rV1yOrDEiNn4yeb1Tc0Yc4ov\npM90lKKCdayca1TWPLVzK8GJZU2Lu7c54cb9cOLI5I9sqf3H9AIQ2+jL1QOSc272\nuwtgb9S1AgMBAAECggEAAYiApHRy0B1r0LXCjvK5w057r43I3NRxFy2IXEr/hURr\nJ8BPF0r/wgyjiwxs29w57TUzaEdP5+sai7t6XKSdgnJzTENXMuNHYHkMIdm4P9RU\nRP76TA2EWQ7q+bIWhjk4fuHdyXtCgclWi4g/SpBirveX6a6e4fiU8LarrcsyKUQF\nhttGDnUp+S4CU6kS6vZ+3cCV7yQk0f5MxUq2HUnQexTp2wSAxE9753yNb0iB6R9T\nywD0ZQr+/N2nLsQZg40suUQKqCnN6KwD7Vs3YS4bmvPF4Wa3CGYOWFOcoi8opKFO\nCgFRFYeXyPiSX5Q0Ih0xwmcw3MOtulTJGf4sHo37GQKBgQDdcHZjrSm7CovUw16m\nakuluUui94i1giN7CCcTkSZs0W5tWt2PauGXTr5I+kDMLhj30S8+u/Utg6VQJM+x\nlcJFiRmEN8I+bxYqU7gaZ7d60/0LxZh1pkuidHurZ4+Vh6L5MQbeCHCxxans279w\ntke3ahiCJ0rVPj1ofWTtFKphGQKBgQDLph6JnozwkSWhaPKNKFAZIH0csYgfC+iZ\nY8Sojb79x4eC6wvBIoZ8v2c8Ih2B6WBL38+9wU8w7i6W0cxCeLRuBCiMPJveVVMV\nHhhItnn+La8xy+XJx/fr0L49ytyj89BV7Lh2W+HeZ9xYhalrAUtoo7gGSL4re2/p\noEvIeW23/QKBgAgmV3Ubrml/3d2awyUEzHvw8eOxkIp9m6iviCCkOvHOU24a5gSd\nPmg/Maml7DSXjbuxKzf32vIt4ius7yfuBxRgE1xWYQPDOuGb6y6tmocevjVstEvA\nLxBvkQ2h5hruvwTE1Sfez6b7S2G4RLd1PfZ2JSjFIW/vtnreApTnKc4hAoGAa3zX\nu22LGGKUCRjahPTVKh4Cy0VNAo4HjAajww9l0o8hEFG9V4hAkdF4zL1485vZbtLH\n1HEWuk3NG1/Kvv70xOi++h33ayd//bJvwNlHlIhKYy8qrxEz4yy/bOAJCyRiPyf9\nyMMAeaI6JCMQY+FACw/2zqJQdaTmUdqAhWTKK4UCgYAroAqj6wOoNaTDTKlpYcdN\nJYOJWJRLTro0u8FRw3sf/MXpxjzUb1q+HOfhkG3Jr8N6fpKKTuBACDesu3DjYXjj\nP8taU5oE2JD/X3JoJlHXFCCDmXyHQYWbyvRtiXyJ0Zc7lh1/5f2z26js8c6sMvzJ\nohUikbuQp0mmFAUUOPpDQw==\n-----END PRIVATE KEY-----\n",
  "client_email": "kamal-63@flutterworkshop2022.iam.gserviceaccount.com",
  "client_id": "105517251231701617987",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kamal-63%40flutterworkshop2022.iam.gserviceaccount.com"
}
''';

const _spreadsheetId = '1dFR1hus3VY2zryi8b2QD2FmY9dpqQdupwmLChyXRSdk';

final gsheets = GSheets(_credentials);

class Gsheet {
  late String spreadsheetId;
  Gsheet(String id) {
    this.spreadsheetId = id;
  }

  Future<List> readData(String sheetName) async {
    var returnval;
    final ss = await gsheets.spreadsheet(spreadsheetId);
    var sheet = ss.worksheetByTitle(sheetName);
    await sheet?.values.allRows().then((value) {
      returnval = value;
    });

    return returnval;
  }
}
