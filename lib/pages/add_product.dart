import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoes_shop/controller/home_controller.dart';
import 'package:shoes_shop/widgets/drop_down_btn.dart';


class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade700,
            title:  Center(child: Text(
              'Add Product',
              style: TextStyle(
                color: Colors.grey.shade100,
            fontWeight: FontWeight.bold,
          ),
          )
          ),
         
      ),
      body:   SingleChildScrollView(
        
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                'Add New Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.grey.shade900
                ),
                ),

               const SizedBox(height: 10,),

                TextField(
                  controller: ctrl.productNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    label: const Text('Product Name' ),
                    hintText: 'Enter Your Product Name'
                  )
                ),
                
                const SizedBox(height: 10,),

                TextField(
                  maxLines: 4,
                  controller: ctrl.productDescriptionController,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    label: const Text('Product Description' ),
                    hintText: 'Enter Your Product Description'
                  )
                ),
               
               const SizedBox(height: 10,),

                  TextField(
                    controller: ctrl.productImageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    label: const Text('Image Url' ),
                    hintText: 'Enter Your Image url'
                  )
                ),
                
                const SizedBox(height: 10,),

                TextField(
                  controller: ctrl.productPriceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    label: const Text('Product Price' ),
                    hintText: 'Enter Your Product Price'
                  )
                ),

                const SizedBox(height: 20,),

                  Row(
                  children: [
                     Flexible(child: DropDownButton(
                      items: const ['Sneakers', 'Basket', 'Athletic shoes', 'Ballet flats'],
                       selectItemText: ctrl.category,
                        onSelected: (selectedValue ) { 
                          ctrl.category = selectedValue ?? 'general';
                          ctrl.update();
                          },
                          )
                          ),

                     Flexible(child: DropDownButton(
                      items: const ['NB', 'ADIDAS', 'NIKE', 'JORDAN'],
                       selectItemText: ctrl.brand,
                        onSelected: (selectedValue ) {
                           ctrl.brand = selectedValue ?? 'une marque'; 
                           ctrl.update();
                           },
                           )
                           ),

                  ],
                 ),
                 
                 const SizedBox(height: 10,),
                 const Text('Offer Product ?'),
                 
                 const SizedBox(height: 10,),

                DropDownButton(
                  items: const ['true', 'False'],
                   selectItemText: ctrl.offer.toString(),
                    onSelected: (selectedValue ) {
                       ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                       ctrl.update();
                        },
                        ),
  
                const SizedBox(height: 20,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.grey.shade100
                  ),
                  onPressed: (){
                    ctrl.addProduct();
                  },
                   child: const Text('Add Product')
                   )

                
            ],
          ),
        ),
      ),
    );
    }
    );
  }
    
  }
  
