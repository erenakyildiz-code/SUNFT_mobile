
import 'dart:async';
import 'package:flutter/material.dart';

class ListViewContainer<Model extends Object, Container extends Widget> extends StatelessWidget {

  final Container Function(Model m, Key? k) parameterizedContainerConstructor;
  final Stream<List<Model>>? stream;
  final Future<List<Model>>? future;
  final Axis direction;
  ListViewContainer({Key? key, required this.parameterizedContainerConstructor,
     this.stream, this.future, this.direction = Axis.vertical}): super(key: key);
  final ScrollController scroller = ScrollController();


  Widget dataError(e) {
    return Text(e.toString());
  }

  Widget dataLoading() {
    return const Padding(
      padding: EdgeInsets.all(40.0),
      child: Center(child: SizedBox( width: 50, height:50, child: const CircularProgressIndicator())),
    );
  }

  Widget dataSuccess(data) {
    return ListView.builder(

      scrollDirection: direction,
      controller: scroller,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: data!.length,
        itemBuilder: (BuildContext context, int index) {
          return parameterizedContainerConstructor(data![index], Key("${data![index].toString()}-$index"));
        }
    );
  }

  StreamBuilder<List<Model>> get streamWidget {
    return StreamBuilder<List<Model>>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
          if (snapshot.hasError) {
            return dataError(snapshot.error);
          } else if (!snapshot.hasData) {
            return dataLoading();
          } else {
            return dataSuccess(snapshot.data);
          }
        });
  }

  FutureBuilder<List<Model>> get futureWidget {
    return FutureBuilder<List<Model>>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
          if (snapshot.hasError) {
            return dataError(snapshot.error);
          } else if (!snapshot.hasData) {
            return dataLoading();
          } else {
            return dataSuccess(snapshot.data);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
      if (stream != null) {
        return streamWidget;
      }
      else if (future != null) {
        return futureWidget;
      }
      return const Text("Neither stream nor future is provided");
    }
}
