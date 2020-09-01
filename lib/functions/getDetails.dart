
import 'package:alwalaa/apiFunctions/requestProfileDetails.dart';

getName () async { 
 
   List _data = await getData();
   var name = _data[0]["name"];
   return(name);
}
getEmail () async {
 
   List _data = await getData();
   var email = _data[0]["email"];
   return(email);
}