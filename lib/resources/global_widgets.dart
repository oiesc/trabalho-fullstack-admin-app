import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.sentiment_very_dissatisfied,
            size: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'No results',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
