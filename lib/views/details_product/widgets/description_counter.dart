import 'package:fluter_19pmd/views/details_product/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class DescriptionWidthCounter extends StatefulWidget {
  DescriptionWidthCounter({Key key}) : super(key: key);

  @override
  State<DescriptionWidthCounter> createState() =>
      _DescriptionWidthCounterState();
}

class _DescriptionWidthCounterState extends State<DescriptionWidthCounter> {
  final counterBloc = CounterDescriptionBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Thông tin sản phẩm",
              style: TextStyle(
                fontSize: 23,
                fontFamily: "RobotoSlab",
                color: Colors.orange.shade400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,Rất giàu cho sức khỏe,",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.5,
                fontFamily: "RobotoSlab",
                color: Colors.black54,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Chọn số lượng mua :",
                style: TextStyle(fontSize: 18),
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.Decrement);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Container(
                      width: size.width * 0.003,
                      height: size.height * 0.05,
                      color: Colors.black12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: size.width * 0.15,
                      height: size.height * 0.05,
                      child: Center(
                        child: StreamBuilder(
                            stream: counterBloc.counterStream,
                            initialData: 1,
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                      ),
                    ),
                    Container(
                      width: size.width * 0.003,
                      height: size.height * 0.05,
                      color: Colors.black12,
                    ),
                    IconButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.Increment);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const BottomNav(),
        ],
      ),
    );
  }
}