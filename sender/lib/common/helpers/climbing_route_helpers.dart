int letterGradeValues(String letter) {
  if (letter == 'a') return 1;
  if (letter == 'b') return 2;
  if (letter == 'c') return 3;
  if (letter == 'd') return 4;
  return 0;
}

String minClimbingGrade(String a, String b) {
  String aWithoutFiveDot = a.substring(a.indexOf('.') + 1);
  String bWithoutFiveDot = b.substring(b.indexOf('.') + 1);

  bool aSingleDigit = aWithoutFiveDot.length == 1;
  bool bSingleDigit = bWithoutFiveDot.length == 1;

  String? aLetterGrade = aSingleDigit ? null : a[2];
  String? bLetterGrade = bSingleDigit ? null : b[2];

  int aNumber = aSingleDigit
      ? int.parse(aWithoutFiveDot)
      : int.parse(aWithoutFiveDot.substring(0, 2));

  int bNumber = bSingleDigit
      ? int.parse(bWithoutFiveDot)
      : int.parse(bWithoutFiveDot.substring(0, 2));

  int aScore = aNumber * 10 + letterGradeValues(aLetterGrade ?? '');
  int bScore = bNumber * 10 + letterGradeValues(bLetterGrade ?? '');

  return aScore > bScore ? a : b;
}
