import 'package:flutter/material.dart';

import '../utils/getColorFromHex.dart';
import 'package:provider/provider.dart';

import '../providers/recipes.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Recipes>(context).fetchAndSetRecipes();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Recipes>(context).items;

    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: ColorUtils.hexToColor('#DADCE0'),
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ]),
          width: MediaQuery.of(context).size.width,
          height: 110,
          child: Container(
            decoration: BoxDecoration(
                color: ColorUtils.hexToColor('#F3F5F9'),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color:
                                          ColorUtils.hexToColor('#E8EDF5')))),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Впиши щоб знайти рецепт...',
                              hintStyle: TextStyle(
                                  color: ColorUtils.hexToColor('#BACADD')),
                              contentPadding: EdgeInsets.only(top: 14),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorUtils.hexToColor('#BACADD'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/65.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: items.length > 0
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(
                      15, 30, 15, index == items.length - 1 ? 30 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          items[index].preview,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].name,
                              style: TextStyle(
                                color: ColorUtils.hexToColor('#636A8A'),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              items[index].description,
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.hexToColor('#B2C1C9'),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text(
                              '${items[index].portions} порції',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.hexToColor('#B2C1C9'),
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : Center(child: const Text('Немає рецептів')),
    );
  }
}
