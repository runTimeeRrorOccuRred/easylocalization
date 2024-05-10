import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_in_flutter/translations/local_keys.g.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Call your async function here
      await translation();
      // After the async function completes, update the state to rebuild the UI
      setState(() {
        isLoading = false;
      });
    });
    // Future.delayed(const Duration(seconds: 2), () {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  Future<void> translation() async {
    await context.setLocale(const Locale('en'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.chooseLanguage.tr()),
      ),
      body: isLoading == false
          ? Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      await context.setLocale(const Locale('en'));
                    },
                    child: const Text("English")),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      await context.setLocale(const Locale('de'));
                    },
                    child: const Text("Deutsch")),
                Center(
                  child: Text(LocaleKeys.time.tr()),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
