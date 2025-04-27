import 'package:example_program1/provider/design_provider.dart';
import 'package:example_program1/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DesignProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DesignScreen(),
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void initState() {
//     super.initState();
//     Provider.of<DesignProvider>(context, listen: false).fetchDesign();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final provider = Provider.of<DesignProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Game '),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                   children: List.generate(8, (index) {
//                 return Container(
//                     child: CircleAvatar(
//                   radius: 20,
//                   backgroundColor: Colors.grey,
//                   child: Text('${index + 1}'),
//                 ));
//               })),
//             ),
//             const Text(
//               'Season:',
//             ),
//             Divider(
//               color: Colors.black,
//               thickness: 2,
//             ),
//             provider.design == null
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: provider.design.length,
//                     itemBuilder: (context, index) {
//                       final design = provider.design[index];
//                       return ListTile(
//                           leading: Image.network(design.url),
//                           title: Text(design.summary));
//                     }),

//             // Padding(padding: EdgeInsets.all(10),
//             // child: Column(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [

//             //   ],
//             // ),),

//             // Text(
//             //   provider.design.name,
//             //   style: Theme.of(context).textTheme.headlineMedium,
//             // ),

//             // Text(
//             //   'AirDate:'$airdate,
//             //   style: Theme.of(context).textTheme.headlineMedium,
//             // ),
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
