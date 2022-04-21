import 'package:fordev/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Should return null if email is empty', () {
    expect(sut.validate(''), null);
  });

  test('Should return null if email is null', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if email is valid', () {
    expect(sut.validate('fagnerlc@gmail.com'), null);
  });

  test('Should return error if email is invalid', () {
    expect(sut.validate('fagnerlc.gmail'), 'Campo inválido');
  });
}