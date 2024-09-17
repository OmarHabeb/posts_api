import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/control/cubit/posts_control_cubit.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<PostsControlCubit>();

    return BlocConsumer<PostsControlCubit, PostsControlState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: read.p != null
              ? Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  
                    itemCount: read.p?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 3),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.5)
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title :  ${read.p![index].title as  String} "),
                              Text("Body :  ${read.p![index].body as  String }", style:TextStyle(color: Colors.grey),),
                          ]
                        ),
                      );
                    }),
              )
              : Center(
                child: CircularProgressIndicator(),
                ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
