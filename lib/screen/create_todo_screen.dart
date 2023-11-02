import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/provider/database_provider.dart';
import 'package:todo_list/utils/result_state_data.dart';
import 'package:todo_list/widgets/card_day.dart';
import 'package:todo_list/widgets/platform_widgets.dart';
import 'package:todo_list/widgets/textFormField_widgets.dart';

// ignore: must_be_immutable
class CreateTodoScreen extends StatelessWidget {
  static const routeName = "/CreateTodoScreen";
  CreateTodoScreen({super.key});

  TextEditingController judulTodo = TextEditingController();
  TextEditingController mainTodo = TextEditingController();

  Widget _buildCreate(BuildContext context) {
    // String nowDay = getDay(dayNow);
    // String nowDate = getdate(dayNow);
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.resulstatedata != ResultStateData.error) {
          return Material(
            child: ListView(
              padding: EdgeInsets.only(
                left: mediaQueryWidth * 0.07,
                right: mediaQueryWidth * 0.07,
                // top: mediaQueryheight * 0.13
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CardDay(
                        content: provider.getDay(provider.dayNow),
                        width: 0.4,
                        fontSize: 30,
                      ),
                      CardDay(
                        content: provider.getdate(provider.dayNow),
                        width: 0.3,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                TextFormFieldWidgets(
                  maxlines: 1,
                  hintText: "judul",
                  controller: judulTodo,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldWidgets(
                  maxlines: 10,
                  hintText: "deskripsi",
                  controller: mainTodo,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (judulTodo.text == "" || mainTodo.text == "") {
                        print("gagal");
                      } else {
                        provider.addTodo(
                          TodoList(
                            id: provider.uuid.v4(),
                            tanggal: provider.getdate(provider.dayNow),
                            judul: judulTodo.text,
                            todo: mainTodo.text,
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("data Kosong"),
          );
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      body: _buildCreate(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Create Todo"),
        transitionBetweenRoutes: false,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.13,
        ),
        child: _buildCreate(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
