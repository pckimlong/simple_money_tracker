import '../../../exports.dart';

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(firebaseAuthProvider).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
