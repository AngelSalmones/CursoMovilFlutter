import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/src/blocs/products_bloc.dart';
import 'package:login/src/blocs/provider.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/utils/utils.dart' as utils;


class ProductPage extends StatefulWidget{
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final ScaffolKey = GlobalKey<ScaffoldState>();
//  final productProvider =  new ProductsProvider();
  ProducsBloc productsBloc = new ProducsBloc();
  ProductModel product = new ProductModel();
  bool _safing = false;
  File photo;

  @override

  Widget build(BuildContext context) {

    productsBloc = Provider.porductsbloc(context);
    final ProductModel proddata = ModalRoute.of(context).settings.arguments;
    if(proddata!= null){
      product = proddata;
    }
    // TODO: implement build
    return Scaffold(
      key: ScaffolKey,
      appBar: AppBar(
        title: Text('Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _selectphoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _takephoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _showPhoto(),
                _createname(),
                _createprice(),
                _createavalible(),
                _createbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createname (){
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'product',
      ),
      onSaved: (value)=>product.title =value,
      validator: (value){
        if (value.length<3){
          return 'add name of product';
        }else{
          return null;
        }
      },
    );
  }

  Widget _createprice(){
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'price',
      ),
      onSaved: (value)=> product.value = double.parse(value),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return 'only numbers';
        }
      },
    );

  }

  Widget _createavalible(){
    return SwitchListTile(
      value: product.avalible,
      title: Text('Avalible'),
      activeColor: Colors.deepPurple,
      onChanged: (value){
        setState(() {
          product.avalible=value;
        });
      },
    );
  }
  Widget _createbutton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: (_safing ) ? null : _submit,
        icon: Icon (Icons.save),
        label: Text('Save'),
    );
  }

  void _submit()async{



    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    _safing =true;

    setState(() {
    });


    if(photo != null){
      product.photourl = await productsBloc.upPhoto(photo);
    }

    if(product.id!= null){
      productsBloc.editProduct(product);
    }else {
      productsBloc.addProduct(product);
    }
//    setState(() {
//      _safing=false;
//    });
    viewSnackbar('success');

    Navigator.pop(context);
  }

  void viewSnackbar (String message){
    final snackbar = SnackBar(
      content: Text (message),
      duration: Duration(milliseconds: 1500),
    );
    ScaffolKey.currentState.showSnackBar(snackbar);

  }

  Widget _showPhoto(){
    if(product.photourl != null){
      return FadeInImage(
        image: NetworkImage(product.photourl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    }else{

      return Image(
        image: AssetImage(photo?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }

  }

  _selectphoto ()async{
    _procesImage(ImageSource.gallery);
  }

  _takephoto()async{
    _procesImage(ImageSource.camera);

  }
  _procesImage (ImageSource origin) async{
    photo = await ImagePicker.pickImage(
        source: origin
    );
    if(photo != null){
      product.photourl= null;
    }

    setState(() {

    });


  }
}