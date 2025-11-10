import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk mendapatkan ukuran layar dan padding
    final screenSize = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery + LayoutBuilder')),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Jika layar sempit (misalnya HP)
            if (constraints.maxWidth < 600) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildBox(Colors.blue, screenSize.width),
                  const SizedBox(height: 20),
                  buildBox(Colors.green, screenSize.width),
                ],
              );
            } else {
              // Jika layar lebar (misalnya tablet atau web)
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBox(Colors.blue, screenSize.width / 2),
                  buildBox(Colors.green, screenSize.width / 2),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  // Widget untuk membuat kotak berwarna
  Widget buildBox(Color color, double width) {
    return Container(
      width: width * 0.8,
      height: 150,
      color: color,
      child: const Center(
        child: Text(
          'Box',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
