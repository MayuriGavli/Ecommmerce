import 'package:flutter/material.dart';

//
// class AppBar extends StatelessWidget implements PreferredSizeWidget{
//   const AppBar({super.key,this.title,this.showbackArrow=false,this.leadingIcon,this.actions,this.leadingOnPressed,});
//
//   final Widget? title;
//   final bool showbackArrow;
//   final IconData? leadingIcon;
//   final List<Widget>? actions;
//   final VoidCallback? leadingOnPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: AppBar(
//         auto
//         leading : showbackArrow? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left): leadin)
//       ),
//     );
//   }
// }

//1 way=================================================
class SearchScreen extends SearchDelegate {
  List<String> SearchTerms = [
    'Sundress',
    'Dungree',
    'Kurti',
    'Crop Top',
    'Sari',
    'Lehnaga',
    'JumpSuit'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
    // Build the clear button.
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
    // Build the leading icon.
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = SearchTerms.where(
        (item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
    // Build the search results.
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : SearchTerms.where(
                (item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
//===============================================
//2nd way
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//  var items = ['Sundress','Dungree','Kurti','Crop Top','Sari','Lehnaga','JumpSuit'];
//
//   List<String> filteredItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems.addAll(items);
//   }
//
//   void filterList(String query) {
//     List<String> searchResult = items
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     setState(() {
//       filteredItems.clear();
//       filteredItems.addAll(searchResult);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Screen'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: filterList,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 hintText: 'Enter your search query...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
