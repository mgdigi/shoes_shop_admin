
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/controller/home_controller.dart';
import 'package:shoes_shop/pages/add_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder: (ctrl) {
        return Scaffold(
          
          appBar: AppBar(
            title: const Center(child: Text(
              'PowerMarket Admin',
              style: TextStyle(
                fontWeight : FontWeight.bold
              ),
              )
              ),
            backgroundColor: Colors.transparent,
    
            elevation: 4,
    )
      ,
      body: ListView.builder(
        itemCount: ctrl.products.length,
        itemBuilder: (context, index){
          return  ListTile(
            leading: Image.network(ctrl.products[index].image ?? ''),
            title: Text(ctrl.products[index].name ?? ''),
            subtitle: Text((ctrl.products[index].price ?? 0).toString()),
            trailing: IconButton(icon: const Icon(Icons.delete),
             onPressed: () { 
              ctrl.deleteProduct(ctrl.products[index].id ?? '');
              },),
          );
        }
        ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
        
        ),
    );
    
    });
    
  }


  }
