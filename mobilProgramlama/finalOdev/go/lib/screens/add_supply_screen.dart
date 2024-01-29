// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class AddSupplyScreen extends StatefulWidget {
  const AddSupplyScreen({Key? key}) : super(key: key);

  @override
  _AddSupplyScreenState createState() => _AddSupplyScreenState();
}

class _AddSupplyScreenState extends State<AddSupplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = 'Oto Sanayi';
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _uploadImages() async {
    setState(() {
      _isUploading = true;
    });
    final List<String> imageUrls = [];
    try {
      for (var image in _images) {
        String fileName =
            'supplies/${DateTime.now()}-${image.path.split('/').last}';
        final Reference storageRef =
            FirebaseStorage.instance.ref().child(fileName);
        final UploadTask uploadTask = storageRef.putFile(image);
        final TaskSnapshot downloadUrl = await uploadTask;
        final String url = await downloadUrl.ref.getDownloadURL();
        imageUrls.add(url);
      }
      await FirebaseFirestore.instance.collection('supplies').add({
        'productName': _productNameController.text,
        'price': double.parse(_priceController.text),
        'category': _selectedCategory,
        'imageUrls': imageUrls,
      });
      Navigator.pop(context);
    } catch (e) {
      print('Error uploading images: $e');
      // Handle errors here
    }
    setState(() {
      _isUploading = false;
    });
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _images.add(File(pickedFile.path));
        });
      }
    } catch (e) {
      print('Image picking error: $e');
      // Hata durumunu kontrol etmek ve kullanıcıya bilgi vermek için uygun bir işlem yapabilirsiniz.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Supply')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Image pickers for 3 images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _images.length > index
                          ? Image.file(_images[index], fit: BoxFit.cover)
                          : const Icon(Icons.add_a_photo, color: Colors.grey),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              // Product name input
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter product name' : null,
              ),
              const SizedBox(height: 16),
              // Product price input
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter price' : null,
              ),
              const SizedBox(height: 16),
              // Category dropdown
              DropdownButtonFormField(
                value: _selectedCategory,
                items: <String>[
                  'Oto Sanayi',
                  'Makine Sanayi',
                  'Kimya Sanayi',
                  'Cam Sanayi',
                  'Gıda Sanayi',
                  'Çimento Sanayi'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              // Upload button
              _isUploading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _uploadImages,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity,
                            50), // double.infinity is the width and 50 is the height
                      ),
                      child: const Text('Add Supply'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
