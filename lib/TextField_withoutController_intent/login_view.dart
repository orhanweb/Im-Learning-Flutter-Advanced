import 'package:flutter/material.dart';
import 'package:im_learning_flutter_advanced/TextField_withoutController_intent/clear_action_intent.dart';

mixin TextControllerMixin on State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final ClearTextAction textAction;
  late final ControllerCleaner _controllerCleaner;
  String _value = "";
  @override
  void initState() {
    super.initState();
    textAction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(textAction);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_value),
        ),
        body: Column(
          children: [
            _CustomTextPlace(
              action: textAction,
              onChange: (value) {
                _value = value;
              },
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
                onPressed: () {
                  _controllerCleaner.updateText("Home");
                },
                label: const Text("Home")),
            FloatingActionButton(
              onPressed: () {
                _controllerCleaner.clearText();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextPlace extends StatelessWidget {
  _CustomTextPlace({required this.action, required this.onChange});
  final TextEditingController controller = TextEditingController();
  final ClearTextAction action;
  final void Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action) {
        if (action is ClearTextAction) {
          if (action.text.isEmpty) {
            controller.clear();
          } else {
            controller.text = action.text;
          }
          print(action.text);
        }
      },
      child: TextField(
        onChanged: onChange,
        controller: controller,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}

class ControllerCleaner {
  final ClearTextAction _clearTextAction;
  ControllerCleaner(ClearTextAction clearTextAction)
      : _clearTextAction = clearTextAction;

  void clearText() {
    _clearTextAction.invoke(const ClearTextIntent());
  }

  void updateText(String text) {
    _clearTextAction.invoke(ClearTextIntent(text: text));
  }
}
