String phoneValidator(String value, String msg) {
  var emailReg = RegExp(r"^[1][3,4,5,7,8][0-9]{9}$");
  if (!emailReg.hasMatch(value)) {
    return msg;
  } else {
    return null;
  }
}

String regValidator(String value, String reg, String msg) {
  var emailReg = RegExp(reg);
  if (!emailReg.hasMatch(value)) {
    return msg;
  } else {
    return null;
  }
}

String emptyValidator(String value, String msg) {
  if (value.isEmpty) {
    return msg;
  } else {
    return null;
  }
}
