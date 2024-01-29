import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_turbo/data/entity/products.dart';
import 'package:sanayi_turbo/interface/cubit/pages_cubit/add_product_page_cubit.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var kategori = <String>[];
  String secilenKategori = 'Araba Sanayisi';
  late ImagePicker imagePicker;
  File? _image;

  @override
  void initState() {
    super.initState();
    kategori.add('Araba Sanayisi');
    kategori.add('Sağlık Sanayisi');
    kategori.add('Cam Sanayisi');
    kategori.add('Yemek Sanayisi');
    kategori.add('Makina Sanayisi');
    kategori.add('Çimento Sanayisi');
    imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
    });
  }

  Future _imgFromGallery() async {
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductPageCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ürün Oluştur'),
        ),
        body: BlocBuilder<AddProductPageCubit, List<Product>>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Ürün Adı'),
                      controller:
                          context.read<AddProductPageCubit>().nameController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Açıklama'),
                      controller: context
                          .read<AddProductPageCubit>()
                          .descriptionController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Fiyat'),
                      keyboardType: TextInputType.number,
                      controller:
                          context.read<AddProductPageCubit>().priceController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Resim URL'),
                      controller: context
                          .read<AddProductPageCubit>()
                          .imageUrlController,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.blueGrey),
                      onPressed: _imgFromGallery,
                      onLongPress: _imgFromCamera,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 200,
                                height: 300,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                width: 150,
                                height: 150,
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 100,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButton(
                      value: secilenKategori,
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      items: kategori.map((katagori) {
                        return DropdownMenuItem(
                          value: katagori,
                          child: Text(katagori),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          secilenKategori = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AddProductPageCubit>().createProduct();
                      },
                      child: const Text('Ürünü Oluştur'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
