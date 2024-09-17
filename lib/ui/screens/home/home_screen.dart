import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imtixon_6/bloc/expanse_bloc/expanse_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<ExpanseBloc, ExpanseState>(
                  builder: (context, state) {
                    if (state is ExpanseLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ExpanseLoadedState) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final todo = state.expanseModel[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Text(todo.comment),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is ExpanseErrorState) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return Center(child: Text('aaaaaaa'));
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<ExpanseBloc, ExpanseState>(
              builder: (context, state) {
                if (state is ExpanseLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ExpanseLoadedState) {
                  return ListView.builder(
                    itemCount: state.expanseModel.length,
                    itemBuilder: (context, index) {
                      final todo = state.expanseModel[index];
                      return ListTile(
                        title: Text(todo.comment),
                      );
                    },
                  );
                } else if (state is ExpanseErrorState) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Center(child: Text('No expanse available'));
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue.shade800,
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notification_important_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final commentController = TextEditingController();
    final dateTimecontroller = TextEditingController();
    final categoryController = TextEditingController();
    final amoutController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Add expanse'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: 'comment',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: dateTimecontroller,
                decoration: InputDecoration(
                  hintText: 'dateTime',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  hintText: 'category',
                  border: OutlineInputBorder(),
                ),
              ),
              // TextField(
              //   controller: amoutController,
              //   decoration: InputDecoration(hintText: ' comment'),
              // ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cencel'),
            ),
            SizedBox(width: 30),
            TextButton(
              onPressed: () {
                context.read<ExpanseBloc>().add(ExpanseAddEvent(
                      category: categoryController.text,
                      comment: commentController.text,
                      dateTime: dateTimecontroller.text,
                      amout: amoutController.text,
                    ));
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
