import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إزالة شعار debug
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color.fromARGB(255, 178, 38, 38),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              'My Beautiful App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: TabBar(
                labelColor: const Color.fromARGB(255, 183, 58, 62),            // لون الأيقونة والنص للتبويبة المفعلة
  unselectedLabelColor: const Color.fromARGB(255, 29, 28, 28), 
              physics:BouncingScrollPhysics(),
              indicatorColor: const Color.fromARGB(255, 186, 16, 16),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.search), text: 'Search'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
              ],
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children:[
              buildPage(Icons.home, 'Welcome Home!', Colors.blue[100]!),
              buildPage(Icons.search, 'Start Searching...', Colors.green[100]!),
              buildPage(Icons.person, 'Your Profile', Colors.orange[100]!),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لبناء كل صفحة مع تصميم خاص
  Widget buildPage(IconData icon, String text, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
ToggleButtons(
              isSelected: isSelected, // الحالة الحالية لكل زر
              selectedColor: Colors.white, // لون النص إذا كان الزر مفعلاً
              color: Colors.teal,          // لون النص إذا كان غير مفعّل
              fillColor: Colors.teal,      // لون الخلفية عند التفعيل
              borderRadius: BorderRadius.circular(10),
              borderWidth: 2,
              borderColor: Colors.teal,
              selectedBorderColor: Colors.tealAccent,
              onPressed: (int index) {
               // setState(() {
                //  isSelected[index] = !isSelected[index]; // قلب الحالة
                //});
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Option 1"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Option 2"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Option 3"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
