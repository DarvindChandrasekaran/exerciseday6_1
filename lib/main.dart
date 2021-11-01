import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'button/cal_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) => DearFeatureCubit(),
        child: ButtonWidget(),
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                BlocBuilder(
                    bloc: context.read<DearFeatureCubit>(),
                    builder: (context, state) {
                      return Text(
                        "Count: "
                        '$state',
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
              ],
            ),
            BlocBuilder(
                bloc: context.read<DearFeatureCubit>(),
                builder: (context, state) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            context.read<DearFeatureCubit>().increment();
                          },
                          tooltip: 'Increment',
                          child: const Icon(Icons.expand_less),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context.read<DearFeatureCubit>().decrement();
                          },
                          tooltip: 'Decrement',
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
