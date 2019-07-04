import 'package:flutter/material.dart';
import 'package:login/src/blocs/products_bloc.dart';
import 'package:login/src/blocs/provider.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/products_provider.dart';

class HomePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    final productsBloc = Provider.porductsbloc(context);
    productsBloc.chargerProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      body: _createList(productsBloc),
      floatingActionButton: _createbotton(context),
    );
  }

  Widget _createList(ProducsBloc producsBloc) {

    return StreamBuilder(
      stream: producsBloc.productsStream,
      builder: (BuildContext context ,AsyncSnapshot <List<ProductModel>> snapshot){
        if (snapshot.hasData){
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder:  (context, i) =>_createItem( context,producsBloc,products[i]),
          );
        }else
        {
          return Center(child: CircularProgressIndicator(),);
        }
      },

    );

  }

  Widget _createItem (BuildContext context,ProducsBloc producsBloc,ProductModel product){

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        //productProvider.deleteProduct(product.id);
        producsBloc.deleteProduct(product.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            ( product.photourl==null)? Image (image: AssetImage('assets/no-image.png'),): FadeInImage(
              image: NetworkImage(product.photourl),
              placeholder: AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
              ListTile(
               title: Text ('${product.title} - ${product.value}'),
                 subtitle: Text(product.id),
                 onTap: () => Navigator.pushNamed(context, 'product',arguments: product),
               ),
          ],
        ),
      ),
    );
//
//    ListTile(
//      title: Text ('${product.title} - ${product.value}'),
//      subtitle: Text(product.id),
//      onTap: () => Navigator.pushNamed(context, 'product',arguments: product),
//    ),
  }

  _createbotton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }
  
}