import 'package:flutter/cupertino.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _gorevler = [];
  final TextEditingController _controller = TextEditingController();

  void _gorevSil(int index) {
    setState(() => _gorevler.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Görevlerim')),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoTextField(
                controller: _controller,
                placeholder: 'Yeni Görev...',
                onSubmitted: (val) {
                  if (val.isNotEmpty) {
                    setState(() => _gorevler.insert(0, val));
                    _controller.clear();
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _gorevler.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_gorevler[index] + index.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) => _gorevSil(index),
                    background: Container(
                      color: CupertinoColors.destructiveRed,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(CupertinoIcons.trash, color: CupertinoColors.white),
                    ),
                    child: CupertinoListTile(
                      leading: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (_gorevler[index].startsWith('✅'))
                              {
                                _gorevler[index] = _gorevler[index].replaceFirst('✅ ', '');
                              } else 
                              {
                                _gorevler[index] = '✅ ' + _gorevler[index];
                              }
                          });
                        },
                        child: Icon(
                          _gorevler[index].startsWith('✅') 
                              ? CupertinoIcons.check_mark_circled_solid 
                              : CupertinoIcons.circle,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                      title: Text(_gorevler[index]),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => _gorevSil(index),
                        child: const Icon(CupertinoIcons.trash, color: CupertinoColors.destructiveRed),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}