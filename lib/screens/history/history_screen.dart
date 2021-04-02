import 'package:flutter/material.dart';
import 'package:my_family_recipes/providers/history.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/widgets/AppbarWithoutSwither.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = 'history-screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<History>(context)
          .setOrders()
          .then((_) => _isLoading = false)
          .catchError((_) => _isLoading = false);
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: AppBarWithoutSwitcher(),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorUtils.hexToColor('#F3F5F9'),
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<History>(
                  builder: (context, provider, child) => ListView.builder(
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorUtils.hexToColor('#DADCE0'),
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                          color: ColorUtils.hexToColor('#F3F5F9'),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Theme.of(context).primaryColor,
                            onTap: () {
                              print(null);
                            },
                            child: ListTile(
                              title: Text(
                                  'Кількість Рецептів ${provider.items[index].recipes.length}'),
                              subtitle: Text('${provider.items[index].date}'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
