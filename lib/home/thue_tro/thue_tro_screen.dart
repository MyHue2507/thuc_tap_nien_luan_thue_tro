import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nhatro/home/thue_tro/item_thue_tro.dart';
import 'package:nhatro/services/search_price.dart';
import 'package:nhatro/home/thue_tro/tao_phong.dart';
import 'package:nhatro/model/phong.dart';
import 'package:nhatro/model/user.dart';

class ThueTroScreen extends StatefulWidget {
  User userCurrent;
  ThueTroScreen({Key key, this.userCurrent}) : super(key: key);
  @override
  _ThueTroScreenState createState() => _ThueTroScreenState();
}

class _ThueTroScreenState extends State<ThueTroScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  var options = [
    'Giá tiền',
    'Rating',
    'Địa chỉ',
    'Diện tích',
    'Xung quanh tôi'
  ];
  String defaultGender = 'Tuỳ chọn';
  var xungQuanh = ['500m', '1km', '3km', '5km'];
  String defaultXungQuanh = 'Số ';
  TextEditingController searchController;
  var queryResultSet = [];
  var tempSearchStore = [];
  @override
  void initState() {
    searchController = TextEditingController();

    super.initState();
  }

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var firstValue = value.substring(0, 1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['gia'].startsWith(firstValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.search),
                    iconSize: 20.0,
                    onPressed: () {},
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Tìm bởi giá phòng',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
            child: RaisedButton(
              color: Colors.grey[400],
              child: Text('Đăng phòng trọ'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CreateRoomScreen(
                          userCurrent: widget.userCurrent,
                        )));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 120),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  Firestore.instance.collection('listPhongChoThue').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(_colorApp),
                  ));
                } else {
                  return searchController.text != ""
                      ? Container(
                          child: ListView(
                              children: tempSearchStore.map((element) {
                            return buildResultCard(element);
                          }).toList()),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return ThueTroItem(
                              phong: Phong(
                                  diaChi: snapshot.data.documents[index]
                                      ['diaChi'],
                                  ten: snapshot.data.documents[index]['ten'],
                                  dienTich: snapshot.data.documents[index]
                                      ['dienTich'],
                                  gia: snapshot.data.documents[index]['gia'],
                                  loaiNhaTro: snapshot.data.documents[index]
                                      ['loaiNhaTro'],
                                  moTa: snapshot.data.documents[index]['moTa'],
                                  sdt: snapshot.data.documents[index]['sdt'],
                                  sucChua: snapshot.data.documents[index]
                                      ['sucChua'],
                                  uidOfHost: snapshot.data.documents[index]
                                      ['uidOfHost'],
                                  userNameOfHost: snapshot.data.documents[index]
                                      ['userNameOfHost'],
                                  avatarOfHost: snapshot.data.documents[index]
                                      ['avatarOfHost'],
                                  image: snapshot.data.documents[index]
                                      ['image'],
                                  rating: snapshot.data.documents[index]
                                      ['rating']),
                            );
                          },
                          itemCount: snapshot.data.documents.length,
                        );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buildResultCard(data) {
    return ThueTroItem(
      phong: Phong(
          diaChi: data['diaChi'],
          dienTich: data['dienTich'],
          gia: data['gia'],
          loaiNhaTro: data['loaiNhaTro'],
          moTa: data['moTa'],
          sdt: data['sdt'],
          sucChua: data['sucChua'],
          uidOfHost: data['uidOfHost'],
          userNameOfHost: data['userNameOfHost'],
          avatarOfHost: data['avatarOfHost'],
          image: data['image'],
          rating: data['rating']),
    );
  }
}
