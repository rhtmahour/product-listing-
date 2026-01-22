import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/di/injection.dart';
import 'package:flutter_clean_mvvm/presentation/viewmodels/product_list_viewmodel.dart';
import 'package:flutter_clean_mvvm/presentation/views/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide ViewModel using get_it factory
    return ChangeNotifierProvider(
      create: (_) => sl<ProductListViewModel>()..loadProducts(),
      child: const _ProductListView(),
    );
  }
}

class _ProductListView extends StatelessWidget {
  const _ProductListView();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Builder(
        builder: (_) {
          if (vm.state == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.state == ViewState.error) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          } else if (vm.products.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            return ListView.builder(
              itemCount: vm.products.length,
              itemBuilder: (_, index) {
                final product = vm.products[index];
                return ProductTile(product: product);
              },
            );
          }
        },
      ),
    );
  }
}
