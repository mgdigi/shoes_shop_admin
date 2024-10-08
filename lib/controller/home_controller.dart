// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/models/product.dart';


class HomeController extends GetxController{

 FirebaseFirestore firebase = FirebaseFirestore.instance;
 
 late CollectionReference productCollection;

 TextEditingController productNameController = TextEditingController();
 TextEditingController productDescriptionController = TextEditingController();
 TextEditingController productImageController = TextEditingController();
 TextEditingController productPriceController = TextEditingController();

 String category = 'categories';
 String brand = 'une marque';
 bool offer = false;

 List<Product> products = [];

  @override
  Future<void> onInit() async {
    
    productCollection = firebase.collection('products');
    await fetchProducts();
    super.onInit();
  }
 
 addProduct(){
  try {
    DocumentReference doc = productCollection.doc();
  Product product = Product(
        id: doc.id,
        name: productNameController.text,
        descriptin: productDescriptionController.text,
        image: productImageController.text,
        price: double.tryParse(productPriceController.text),
        category: category,
        brand: brand,
        offer: offer
  );
  final productJson = product.toJson();
  Get.snackbar('Ajouté', 'le produit est ajouter avec succés✔', colorText: Colors.green);
  setValuesDefault();
  doc.set(productJson);
  } catch (e) {
    Get.snackbar('error', e.toString(), colorText: Colors.red);
  }
  
  
 }

 
 
 fetchProducts() async{
  try {
     QuerySnapshot productSnapshot = await  productCollection.get();
   final List<Product> receiveProducts = productSnapshot.docs.map((doc) =>
     Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
   products.clear();
   products.assignAll(receiveProducts);
   Get.snackbar('Ajouté', 'le produit est chargé avec succés✔', colorText: Colors.green);
  } catch (e) {
    Get.snackbar('error', e.toString(), colorText: Colors.red);
    
  }finally{
    update();
  }
  
 }

deleteProduct(String id) async {
  try {
    await  productCollection.doc(id).delete();
    fetchProducts();
  } catch (e) {
    Get.snackbar('Error', e.toString(),colorText: Colors.red);
  }
 
}

 setValuesDefault(){
  productNameController.clear();
  productDescriptionController.clear();
  productImageController.clear();
  productPriceController.clear();

  category = 'categories';
  brand = 'une marque';
  offer = false;
  update();

 }
}