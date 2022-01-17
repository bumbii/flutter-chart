num convertToPercent(num percent) {
  return num.parse((percent * 100).toStringAsFixed(1));
}

num convertToDecimal(num number) {
  return num.parse(number.toStringAsFixed(1));
}

String convertNumber(num number) {
  if (number == null) {
    return '0';
  }

  if (number < 1000) {
    return number.toString();
  } else if (999 < number && number < 1000000) {
    if (number % 1000 != 0) {
      var convertNumber = (number / 1000).abs();
      return '${convertNumber.toStringAsFixed(1)}K';
    } else {
      var convertNumber = (number / 1000).floor();
      return '${convertNumber}K';
    }
  } else if (99999 < number && number < 1000000000) {
    if (number % 1000000 != 0) {
      var convertNumber = (number / 1000000).abs();
      return '${convertNumber.toStringAsFixed(1)}M';
    } else {
      var convertNumber = (number / 1000000).floor();
      return '${convertNumber}M';
    }
  } else if (999999999 < number) {
    if (number % 1000000000 != 0) {
      var convertNumber = (number / 1000000000).abs();
      return '${convertNumber.toStringAsFixed(1)}B';
    } else {
      var convertNumber = (number / 1000000000).floor();
      return '${convertNumber}B';
    }
  }
  return '';
}