import 'dart:math';

enum Gender { male, female }

class BmiBrain {
  Gender _gender;
  double _height = 1;
  int _weight = 1;
  int _age = 1;

  BmiBrain();

  void setGender(Gender gender) {
    if (_gender == gender) {
      _gender = null;

      return;
    }
    _gender = gender;
  }

  bool isGenderSelected(Gender gender) {
    return _gender == gender;
  }

  void setHeight(double height) {
    _height = height;
  }

  double getHeight() {
    return _height ?? 1;
  }

  int getWeight() {
    return _weight ?? 1;
  }

  void increaseWeight() {
    if (_weight >= 180) {
      return;
    }
    _weight++;
  }

  void decreaseWeight() {
    if (_weight <= 1) {
      return;
    }
    _weight--;
  }

  int getAge() {
    return _age ?? 1;
  }

  void increaseAge() {
    if (_age >= 100) {
      return;
    }
    _age++;
  }

  void decreaseAge() {
    if (_age <= 1) {
      return;
    }
    _age--;
  }

  double calculateBmi() {
    return _weight / pow(_height / 100, 2);
  }

  String getResult(double bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(double bmi) {
    String interpretation = '';

    if (bmi < 18.5) {
      interpretation = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      interpretation = 'Normal weight';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      interpretation = 'Overweight';
    } else {
      interpretation = 'Obesity';
    }

    if (_age >= 60) {
      if (_gender == Gender.male) {
        interpretation += ', but this may be acceptable due to age.';
      } else {
        interpretation += ', but this may be acceptable due to age.';
      }
    } else {
      if (_gender == Gender.male) {
        interpretation += ' for your age and gender.';
      } else {
        interpretation += ' for your age and gender.';
      }
    }

    return interpretation;
  }
}
