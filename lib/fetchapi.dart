import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form/listviewbuilder.dart';
import 'package:http/http.dart' as http;

class fetchapi extends StatefulWidget {
  const fetchapi({super.key});

  @override
  State<fetchapi> createState() => _fetchapiState();
}

class _fetchapiState extends State<fetchapi> {
  late List<dynamic> data = [];
  late Future<List<dynamic>> fetchData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }

  Future<List<dynamic>> fetchapi() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body);
        print(decodedData);
        return decodedData;
      } else {
        print('Error ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(
            'Fetch API ',
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: Expanded(
          child: FutureBuilder(
            future: fetchapi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                data = snapshot.data as List<dynamic>;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

          
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
          
                            Container(
                              child: Image.network(
                                data[index]['image'],
                                height: 100,
                              ),
                            ),
                            // SizedBox(height: 5,),
                            Text(
                              data[index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            SizedBox(height: 3,),
                            Row(
                              children: [
                                Text(
                                  data[index]['price'].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.favorite)
                              ],
                            ),
          
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
