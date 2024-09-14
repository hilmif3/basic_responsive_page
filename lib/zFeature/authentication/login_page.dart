part of 'authentications.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String titleText = "Tablet mode";

  double fontSizeCustom = 10;
  Color warnaText = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Responsive tablet'),
      ),
      body: ResponsiveLayout(
        mobileLayout: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              // mainAxisAlignment: M,
              children: [ResponsiveText('Mobile Layout'), Text("data")]),
        ),
        tabletLayout: Row(
          children: [
            Container(
              height: double.infinity,
              width: 300,
              // decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        titleText = "Change to tablet mode";
                        fontSizeCustom = 20;
                        warnaText = Colors.cyan;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        "Menu 1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        titleText = "Change to tablet mode 2";
                        fontSizeCustom = 30;
                        warnaText = Colors.amber;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        "Menu 2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  child: Text(
                titleText.toString(),
                style: TextStyle(fontSize: fontSizeCustom, color: warnaText),
              )),
            ),
          ],
        ),
        desktopLayout: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "$titleText",
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    titleText = "Change to Desktop mode 1";
                    fontSizeCustom = 30;
                    warnaText = Colors.amber;
                  });
                },
                child: Text("Ganti Text")),
            ResponsiveText(
              'Desktop Layout',
            ),
          ],
        )),
      ),
    );
  }
}
