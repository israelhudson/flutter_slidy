import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  //dispose will be called automatically by closing its streams

  var controlador = BehaviorSubject<int>.seeded(0);
  Observable<int> get saida => controlador.stream;
  Sink<int> get entrada => controlador.sink;

  int get valor => controlador.value;

  aumentar(){
    entrada.add(valor + 1);
  }

  diminuir(){
    if(valor > 0)
      entrada.add(valor - 1);
  }

  @override
  void dispose() {
    controlador.close();
    super.dispose();
  }
}
