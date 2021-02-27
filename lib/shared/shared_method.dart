part of 'shared.dart';

bool tanggalValidation(String tanggal) {
    List<String> details = tanggal.split("/");
    if (details.length != 3) {
      return false;
    }
    if (details[0].length != 4) {
      return false;
    }
    if (details[1].length != 2) {
      return false;
    }
    if (details[2].length != 2) {
      return false;
    }
    try {
        int y = int.parse(details[0]);  
        int m = int.parse(details[1]);  
        int d = int.parse(details[2]);  
        if(y>2022){
          return false;
        }
        if(m>12){
          return false;
        }
        if(d>31){
          return false;
        }  
      } catch (e) {
        return false;
      }
    return true;
  }