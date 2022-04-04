import 'dart:async';

const PRODUCTOS = ['microfono', 'parlante', 'teclado', 'cámara'];

class ProductosBloc {
  // async* retorna automaticamente un Stream
  Stream<List<String>> get GetProductos async* {
    final List<String> productos = [];

    for (String producto in PRODUCTOS) {
      await Future.delayed(Duration(seconds: 2));

      productos.add(producto);

      // yield sustituye a la palabra reservada return en el caso de los Streams
      yield productos;
    }
  }

  StreamController<int> _contadorProductos = new StreamController<int>();
  Stream<int> get ContadorProdcutos => _contadorProductos.stream;

  ProductosBloc() {
    this.GetProductos.listen( 
      (productosList) => this._contadorProductos.add(productosList.length));
  }

  dispose() {
    _contadorProductos.close();
  }
}