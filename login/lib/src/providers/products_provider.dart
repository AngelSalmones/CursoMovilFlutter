
import 'dart:convert';
import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:login/src/models/product_model.dart';

class ProductsProvider {

  final String _url = 'https://flutter-other.firebaseio.com';

  Future <bool> createProduct (ProductModel product) async{
    final url = '$_url/product.json';

    final result = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(result.body);

    print(decodedData);
    return true;

   }

  Future <bool> editProduct (ProductModel product) async{
    final url = '$_url/product/${product.id}.json';

    final result = await http.put(url, body: productModelToJson(product));

    final decodedData = json.decode(result.body);

    print(decodedData);
    return true;

  }



   Future<List<ProductModel>> chargeProducts() async{

    final url = '$_url/product.json';
    final result = await http.get(url);

    final Map<String ,dynamic> decodeData = json.decode(result.body);
    final List<ProductModel>products = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id,prod){
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;

      products.add(prodTemp);

    });

    return products;

   }

   Future <int> deleteProduct (String id)async{

    final url = '$_url/product/$id.json';
    final result = await http.delete(url);

    return 1;
   }
   
   
   Future<String> upimage (File image) async{
    
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dwlgtdowr/image/upload?upload_preset=m4ymz6bm');
    final mineType = mime(image.path).split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final File = await http.MultipartFile.fromPath('file', image.path,contentType: MediaType(mineType[0], mineType[1]) );

    imageUploadRequest.files.add(File);


    final streamResponse = await imageUploadRequest.send();
    final result = await http.Response.fromStream(streamResponse);


    if(result.statusCode!=200&& result.statusCode!=201){
      return null;
    }


    final respData = json.decode(result.body);
    return respData ['secure_url'];


    
   }


}