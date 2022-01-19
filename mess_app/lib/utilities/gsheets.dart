import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
//  write your credentials here;
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
