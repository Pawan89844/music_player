import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoriesComponent extends StatelessWidget {
  const StoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  Container(
                    height: 50.0,
                    width: 60.0,
                    margin: const EdgeInsets.all(1.0),
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.red))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text('Your Profile'),
                  ),
                ],
              ),
              const Positioned(
                  bottom: 35.0, right: 16.0, child: Icon(Icons.add))
            ],
          );
        } else {
          return Column(
            children: [
              Container(
                height: 50.0,
                width: 60.0,
                margin: const EdgeInsets.all(1.0),
                decoration: const BoxDecoration(
                    // color: Colors.blue,
                    shape: BoxShape.circle,
                    border:
                        Border.fromBorderSide(BorderSide(color: Colors.red))),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Pawan'),
              ),
            ],
          );
        }
      },
    );
  }
}
