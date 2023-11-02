import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/database_provider.dart';
import 'package:todo_list/screen/create_todo_screen.dart';
import 'package:todo_list/utils/result_state_data.dart';
import 'package:todo_list/widgets/listTile_widgets.dart';
import 'package:todo_list/widgets/platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        if (value.resulstatedata == ResultStateData.loading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (value.resulstatedata == ResultStateData.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.todolist.length,
            itemBuilder: (context, index) {
              var data = value.todolist[index];
              // return Text("data");
              return ListTileWidgets(
                id: data.id ?? "",
                judul: data.judul ?? "",
                subJudul: data.todo ?? "",
              );
            },
          );
        } else if (value.resulstatedata == ResultStateData.noData) {
          return Center(
            child: Text(value.message!),
          );
        } else if (value.resulstatedata == ResultStateData.error) {
          return Center(
            child: Text(value.message!),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            CreateTodoScreen.routeName,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Todo List"),
        transitionBetweenRoutes: false,
        trailing: Material(
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CreateTodoScreen.routeName);
              },
              icon: const Icon(Icons.add)),
        ),
      ),
      child: _buildList(),
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

// DateTime dayNow = DateTime.now();

  // // memanggil hari
  // String getDay(DateTime now) {
  //   final DateFormat format = DateFormat("EEEE");
  //   final String formatday = format.format(now);
  //   return formatday;
  // }

  // // Mengambil tanggal
  // String getdate(DateTime now) {
  //   final DateFormat format = DateFormat("M/d/y");
  //   final String formatDate = format.format(now);
  //   return formatDate;
  // }

  // @override
  // Widget build(BuildContext context) {



        // final mediaQueryWidth = MediaQuery.of(context).size.width;
    // final mediaQueryHeight = MediaQuery.of(context).size.height;
    // late String nowDay = getDay(dayNow);
    // late String nowDate = getdate(dayNow);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Todo List"),
    //     // bottom: PreferredSize(
    //     //   preferredSize: const Size.fromHeight(80),
    //     //   child: Container(
    //     //     padding: EdgeInsets.symmetric(
    //     //       horizontal: mediaQueryWidth * 0.1,
    //     //       vertical: mediaQueryHeight * 0.02,
    //     //     ),
    //     //     width: double.infinity,
    //     //     child: Column(
    //     //       mainAxisAlignment: MainAxisAlignment.center,
    //     //       crossAxisAlignment: CrossAxisAlignment.start,
    //     //       children: [
    //     //         Text(nowDay, style: Theme.of(context).textTheme.displayLarge),
    //     //         Text(nowDate, style: Theme.of(context).textTheme.displaySmall),
    //     //       ],
    //     //     ),
    //     //   ),
    //     // ),
    //   ),