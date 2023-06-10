import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobitechproject/services/api_services.dart';
import 'package:mobitechproject/view/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    // bool isExpended = false;
    // int currentindex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Maybeline'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
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
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            productModel: data1[index],
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      child: Column(
                        children: [
                          Image.network(data1[index].imageLink!),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data1[index].name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          Text(
                            data1[index].brand!,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          Text(
                            "₹${data1[index].price!},",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 19),
                          ),
                          RatingBar.builder(
                            initialRating: data1[index].rating == null
                                ? 0.0
                                : data1[index].rating!,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 23,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Text(
                                    data1[index].description!,
                                    maxLines: 1,
                                  ),
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.grey)),
                                    onPressed: () {},
                                    child: const Text('More')),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
