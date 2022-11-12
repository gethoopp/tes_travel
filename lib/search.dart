import 'package:flutter/material.dart';

// ignore: camel_case_types
class customSearch extends SearchDelegate {
   final listCity = {
    "Bali" : 'beautiful place',
    "Jakarta" : 'capital city',
    "Bandung" : 'city of tea',
    "Surabaya" : 'city of hero',
    "Yogyakarta" : 'city of culture',
    "Bogor" : 'city of rain',
    "Semarang" : 'city of education',
    "Medan" : 'city of food',
    "Palembang" : 'city of river',
    "Makassar" : 'city of sea',
    "Malang"  : "City of univerisity",
    "Jombang" : "City of religion",
    "Purwokerto" : "City of coffee",
    "Purworejo" : "City of coffee",
    "Purwodadi" : "City of coffee",
    " Nganjuk" : "City of wind",
      
      };
    
  
   

    
  

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   
      
      
      return Container(
        child: Center(
          child: Text(listCity.values.elementAt(2)),
        ),
      );
        
      
      
         
          
        
        
        
   
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List <String> list = [];
    
    if(query.isNotEmpty){
      list.addAll(listCity.keys.where((element) => element.startsWith(query)));
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index,){
          return ListTile(
            onTap: (){
              showResults(context);
            },
            leading: const Icon(Icons.location_city),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: query.isEmpty ? Text(list[index]) : Text(list[index].replaceAll(query, query.toUpperCase())),
            subtitle: Text(listCity.values.elementAt(index)),
            
          );
        },
      );
      
    } 
    return const Center(
      child: Text('Search City'),
    );

  }
}