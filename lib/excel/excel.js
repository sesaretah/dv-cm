var Excel = require('exceljs');
var argv = require('minimist')(process.argv.slice(2));

var workbook = new Excel.Workbook();
workbook.xlsx.readFile(argv['file'])
.then(function() {
  var worksheet = workbook.getWorksheet(1);
  worksheet.eachRow({ includeEmpty: false }, function(row, rowNumber) {
    console.log("Row " + rowNumber + " = " + JSON.stringify(row.values));
  });
});
