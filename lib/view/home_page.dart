import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobitechproject/services/api_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: const Text('MWS'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder(
        future: apiServices.getApi(),
        builder: (context, snapshot) {
          var data1 = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data1!.length,
              itemBuilder: (context, index) => Card(
                child: Column(
                  children: [
                    Image.network(data1[index].imageLink!),
                    Text(data1[index].name!),
                    Text(data1[index].brand!),
                    Text("₹${data1[index].price!}"),
                    RatingBar.builder(
                      initialRating: data1[index].rating == null
                          ? 0.0
                          : data1[index].rating!,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 23,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 280, child: Text(data1[index].description!)),
                        ElevatedButton(onPressed: () {}, child: Text('More'))
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
