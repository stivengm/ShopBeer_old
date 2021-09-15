import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/services/services.dart';
import 'package:shop_beer/pages/dashboard/methods_pay.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  @override
  Widget build(BuildContext context) {
    
    final productsServices = Provider.of<ProductsServices>(context);

    if ( productsServices.isLoading ) return const CircularProgressIndicator();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appColor,
        title: const TextApp(text: 'ShopBeer', font: 'Curved', size: 34.0, fontW: FontWeight.bold ),
        actions: <Widget> [
          Container(
            margin: const EdgeInsets.only(right: AppStyle.edgeInsets15, top: AppStyle.edgeInsets5),
            child: Badge(
              badgeContent: const TextApp(text: "0", size: 15.0, font: 'Rubik', color: AppStyle.whiteColor,),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushNamed(context, 'cart'),
              ),
            ),
          ),
        ],
      ),
      body: _body(productsServices),
    );
  }

  Widget _body(productsServices) {
    Size _media = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets20),
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      width: _media.width * 1.0,
      height: _media.height * 1.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const MethodsPay(),
            productsServices.productsCerveza.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 145.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsCerveza.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsCerveza[i].name,
                          'img': productsServices.productsCerveza[i].img,
                          'id': productsServices.productsCerveza[i].id,
                          'description': productsServices.productsCerveza[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets10, vertical: AppStyle.edgeInsets10),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsCerveza[i].id,
                                child: Image.network(productsServices.productsCerveza[i].img, fit: BoxFit.contain, height: 100.0),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsCerveza[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsAguardiente.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 145.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsAguardiente.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsAguardiente[i].name,
                          'img': productsServices.productsAguardiente[i].img,
                          'id': productsServices.productsAguardiente[i].id,
                          'description': productsServices.productsAguardiente[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets10, vertical: AppStyle.edgeInsets10),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsAguardiente[i].id,
                                child: Image.network(productsServices.productsAguardiente[i].img, fit: BoxFit.contain, height: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsAguardiente[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsRon.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 145.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsRon.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsRon[i].name,
                          'img': productsServices.productsRon[i].img,
                          'id': productsServices.productsRon[i].id,
                          'description': productsServices.productsRon[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets10, vertical: AppStyle.edgeInsets10),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsRon[i].id,
                                child: Image.network(productsServices.productsRon[i].img, fit: BoxFit.contain, height: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsRon[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsWiskey.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 112.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsWiskey.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsWiskey[i].name,
                          'img': productsServices.productsWiskey[i].img,
                          'id': productsServices.productsWiskey[i].id,
                          'description': productsServices.productsWiskey[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets5, vertical: AppStyle.edgeInsets5),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsWiskey[i].id,
                                child: Image.network(productsServices.productsWiskey[i].img, fit: BoxFit.contain, width: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsWiskey[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsTequila.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 112.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsTequila.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsTequila[i].name,
                          'img': productsServices.productsTequila[i].img,
                          'id': productsServices.productsTequila[i].id,
                          'description': productsServices.productsTequila[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets5, vertical: AppStyle.edgeInsets5),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsTequila[i].id,
                                child: Image.network(productsServices.productsTequila[i].img, fit: BoxFit.contain, width: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsTequila[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsGaseosa.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 112.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsGaseosa.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsGaseosa[i].name,
                          'img': productsServices.productsGaseosa[i].img,
                          'id': productsServices.productsGaseosa[i].id,
                          'description': productsServices.productsGaseosa[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets5, vertical: AppStyle.edgeInsets5),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsGaseosa[i].id,
                                child: Image.network(productsServices.productsGaseosa[i].img, fit: BoxFit.contain, width: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsGaseosa[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsVarios.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 112.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsVarios.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsVarios[i].name,
                          'img': productsServices.productsVarios[i].img,
                          'id': productsServices.productsVarios[i].id,
                          'description': productsServices.productsVarios[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets5, vertical: AppStyle.edgeInsets5),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsVarios[i].id,
                                child: Image.network(productsServices.productsVarios[i].img, fit: BoxFit.contain, width: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsVarios[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
            const SizedBox(height: AppStyle.edgeInsets15),
            productsServices.productsMecato.length != 0 ? Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  _header(),
                  const SizedBox(height: AppStyle.edgeInsets15),
                  Container(
                    width: double.infinity,
                    height: 112.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsServices.productsMecato.length,
                      itemBuilder: ( BuildContext context, int i ) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details', arguments: {
                          'name': productsServices.productsMecato[i].name,
                          'img': productsServices.productsMecato[i].img,
                          'id': productsServices.productsMecato[i].id,
                          'description': productsServices.productsMecato[i].description ?? ''
                        }),
                        child: Container(
                          width: 120.0,
                          decoration: const BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppStyle.edgeInsets15)
                            )
                          ),
                          margin: const EdgeInsets.only(right: AppStyle.edgeInsets10),
                          padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets5, vertical: AppStyle.edgeInsets5),
                          height: 100.0,
                          child: Column(
                            children: [
                              Hero(
                                tag: productsServices.productsMecato[i].id,
                                child: Image.network(productsServices.productsMecato[i].img, fit: BoxFit.contain, width: 100.0,),
                              ),
                              const SizedBox(height: AppStyle.edgeInsets10),
                              TextApp(text: productsServices.productsMecato[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ) : Container(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const TextApp(
        text: "Cerveza",
        font: 'Rubik',
        size: 20.0,
        fontW: FontWeight.bold,
        color: AppStyle.textColorHeader,
      ),
    );
  }

  // Lista de todo.
  // Cerveza, Aguardiente, Ron, Wiskey, Tequila, Gaseosa, Varios, Mecato

}