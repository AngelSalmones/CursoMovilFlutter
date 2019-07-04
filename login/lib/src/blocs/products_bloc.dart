

import 'dart:io';

import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/products_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProducsBloc {

  final _productsController = new BehaviorSubject<List<ProductModel>>();
  final _chargerController = new BehaviorSubject<bool>();

  final _productsProvider = new ProductsProvider();

  Stream<List<ProductModel>> get productsStream =>_productsController.stream;
  Stream<bool> get charger => _chargerController.stream;

 void chargerProducts ()async{
    final products =await _productsProvider.chargeProducts();
    _productsController.sink.add(products);
  }

  void addProduct (ProductModel product) async{
    _chargerController.sink.add(true);
   await _productsProvider.createProduct(product);
   _chargerController.sink.add(false);
  }


  Future<String> upPhoto (File photo) async{
    _chargerController.sink.add(true);
    final photourl = await _productsProvider.upimage(photo);
    _chargerController.sink.add(false);

    return photourl;
  }


  void editProduct (ProductModel product) async{
    _chargerController.sink.add(true);
    await _productsProvider.editProduct(product);
    _chargerController.sink.add(false);
  }


  void deleteProduct (String id) async{

    await _productsProvider.deleteProduct(id);
  
  }

  dispose(){
    _productsController?.close();
    _chargerController?.close();
  }




}