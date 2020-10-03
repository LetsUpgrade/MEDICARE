import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/models/doctor.dart';
import 'package:medicare/screens/doctor_info_screen.dart';
import 'package:provider/provider.dart';

import 'category.dart';

import 'package:flutter/material.dart';

class PopularListView extends StatefulWidget {
  const PopularListView({Key key, this.callBack}) : super(key: key);

  final Function callBack;
  @override
  _PopularListViewState createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }



  //class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = Firestore.instance.collection('doctors');
    final doctors = Provider.of<List<Doctor>>(context) ?? [];

    return ListView.builder(
        itemCount: doctors.length,
        itemBuilder : (context,index){
          return BrewListTile(doctor:doctors[index]);
        }
    );
  }







//}






/*
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              //starting of the list view

              children: List<Widget>.generate(
                Category.popularList.length,
                (int index) {
                  final int count = Category.popularList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController.forward();
                  return CategoryView(
                    callback: () {
                      widget.callBack();
                    },
                    category: Category.popularList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }

 */

}

class BrewListTile extends StatelessWidget {

  final Doctor doctor;
  BrewListTile({this.doctor});

  @override
  Widget build(BuildContext context) {
    return
      /*
      Padding(
      padding: EdgeInsets.only(top:16.0),

      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            //backgroundColor: Colors.brown[doctor.strength],
            //backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(doctor.name),
          subtitle: Text('Takes ${doctor.experience} sugar(s)'),
        ),
      ),
       */
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 16, left: 16, right: 16),
            child: Text(
              doctor.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.27,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: 8),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${doctor.experience} years',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${doctor.rating}',
                        textAlign:
                        TextAlign.left,
                        style: TextStyle(
                          fontWeight:
                          FontWeight.w200,
                          fontSize: 18,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color:
                        Colors.blueAccent,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: 8),
            child: Row(
              children: <Widget>[
                Text(
                  '${doctor.specialist}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              children: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        10.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>  DoctorInfoScreen(doctor: doctor)));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorInfoScreen()));

                  },
                  child: Text(
                    'Appointment',
                    style: TextStyle(
                        color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
        ],
      );


  }
}








class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: SizedBox(
                height: 200,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF8FAFB),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              category.name,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${category.experience} years',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        '${category.rating}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 18,
                                                          letterSpacing: 0.27,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Colors.blueAccent,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${category.specialist}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Appointment',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  color: Colors.blueAccent,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
