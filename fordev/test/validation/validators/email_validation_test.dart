import 'package:fordev/validation/protocols/protocols.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation {
  final String field;
  EmailValidation(this.field);

  String validate(String value) {
    return null;
  }
}

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Should return null if email is empty', () {
    sut.validate('');
    expect(sut.validate(''), null);
  });

  test('Should return null if email is null', () {
    sut.validate('');
    expect(sut.validate(null), null);
  });
}
