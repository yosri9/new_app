import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:news_app/models/author.dart';
import 'package:news_app/utilities/api_utilities.dart';


class AuthorsApi{
  List<Author>authors=List <Author>();
  Future <List<Author>>fetchAllAuthors()async {
   String allAuthorsApi = base_api + all_authors_api;
   var response = await http.get(allAuthorsApi);

   if (response.statusCode == 200) {
     var jsonData = jsonDecode(response.body);
     var data = jsonData["data"];
     print(data);


     for (var item in data) {
       Author author = Author(
           item['id'].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
       authors.add(author);
     }

     for (Author author in authors){
       print(author.email);
     }
   }
   return authors;
 }

}
