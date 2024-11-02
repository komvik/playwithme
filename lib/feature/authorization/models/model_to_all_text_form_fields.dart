// Information that is shown in the information window
// when there is an input error in the Field text

// Informationen, die im Informationsfenster angezeigt werden,
// wenn bei der Eingabe eines Textfelds ein Fehler auftritt

class FieldInfo {
  final String fieldName;
  final String dialogContext;

  FieldInfo({
    required this.fieldName,
    required this.dialogContext,
  });
}
