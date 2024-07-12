import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DSearchBar extends StatefulWidget {
  final Function(String text) onSearch;
  final String? hintText;

  const DSearchBar({Key? key, required this.onSearch, this.hintText})
      : super(key: key);

  @override
  State<DSearchBar> createState() => _DSearchBarState();
}

class _DSearchBarState extends State<DSearchBar> {
  late TextEditingController textEditingController;
  String lastValue = '';

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() => _listenController());
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _listenController() {
    String text = textEditingController.text;
    if (text != lastValue) {
      lastValue = text;
      widget.onSearch(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.search,
              color: Color.fromRGBO(161, 157, 157, 1), size: 18),
          border: InputBorder.none,
          hintText: widget.hintText ??
              MaterialLocalizations.of(context).searchFieldLabel,
          hintStyle:
              const TextStyle(color: Color.fromRGBO(161, 157, 157, 1), fontSize: 16),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
