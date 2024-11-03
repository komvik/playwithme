import 'package:projekt_481_play_with_me/feature/authorization/models/model_to_all_text_form_fields.dart';

// Information that is shown in the information window
// when there is an input error in the Field text

// Informationen, die im Informationsfenster angezeigt werden,
// wenn bei der Eingabe eines Textfelds ein Fehler auftritt

final List<FieldInfo> fields = [
  FieldInfo(
    fieldName: "Login",
    dialogContext: '1. .\n'
        '2. .\n'
        '3. .\n'
        '...\n'
        '20. login.',
  ),
  FieldInfo(
    fieldName: "Password",
    dialogContext: '1. .\n'
        '2. .\n'
        '3. .\n'
        '...\n'
        '20. Password.',
  ),
  FieldInfo(
    fieldName: "Password confirm",
    dialogContext: '1. .\n'
        '2. .\n'
        '3. .\n'
        '...\n'
        '20. Password confirm.',
  ),
  FieldInfo(
    fieldName: "E-mail",
    dialogContext: '1. .\n'
        '2. .\n'
        '3. .\n'
        '...\n'
        '20. email.',
  )
];
