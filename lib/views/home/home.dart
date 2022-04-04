import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Manejo de Estado con BLOC',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25,),
              padding: const EdgeInsets.symmetric(vertical: 15,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/productos');
                    }, 
                    child: const Text('Bloc Cambios Locales'),
                    style: ElevatedButton.styleFrom(
                      elevation: 7.0,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.045),
                      primary: Colors.purple
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/posts');
                    },
                    child: const Text('Bloc Consumiendo API'),
                    style: ElevatedButton.styleFrom(
                      elevation: 7.0,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.045),
                      primary: Colors.purple
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/postNetworking');
                    }, 
                    child: const Text('Bloc Consumiendo API y manejo de RED'),
                    style: ElevatedButton.styleFrom(
                      elevation: 7.0,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.045),
                      primary: Colors.purple
                    ),
                  ),
                ],
              ),
            ) 
          ],
        ),
      ),
    );
  }
}