import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


///create a model that extends ChangeNotifier. 
class MyModel extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();
  }
}


///Wrap your app or a part of your widget tree with ChangeNotifierProvider.
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MyApp(),
    ),
  );
}

///Use Consumer widget to listen to changes.
/// Whenever the data inside MyModel changes (i.e., when notifyListeners() is called), the Consumer widget will rebuild:
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyModel>(
      builder: (context, model, child) {
        return Text('Value: ${model.value}');
      },
    );
  }
}

///change the value and notify listeners like this:

final model = Provider.of<MyModel>(context, listen: false);
model.value = 5; // This will notify listeners and rebuild the `Consumer`
