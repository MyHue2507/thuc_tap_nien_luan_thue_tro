import 'package:flutter/material.dart';
import 'package:nhatro/home/cai_dat/cap_nhat_thong_tin.dart';
import 'package:nhatro/home/cai_dat/doi_mat_khau.dart';
import 'package:nhatro/home/cai_dat/my_account.dart';
import 'package:nhatro/model/user.dart';

class SettingScreen extends StatefulWidget {
  User userCurrent ;
  SettingScreen({Key key,this.userCurrent}) : super(key: key);

  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color _colorApp = Color.fromARGB(255, 45, 53, 110);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _colorApp),
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10.0,
                  right: 10.0,
                ),
                height: 55.0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  onTap: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MyAccountScreen()));
                  },
                  title: Text(
                    'Tài khoản của tôi',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _colorApp),
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10.0,
                  right: 10.0,
                ),
                height: 55.0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  onTap: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => UpdateInfoScreen()));
                  },
                  title: Text(
                    'Cập nhật thông tin',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.data_usage,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _colorApp),
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10.0,
                  right: 10.0,
                ),
                height: 55.0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  onTap: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ChangePasswordScreen()));
                  },
                  title: Text(
                    'Đổi mật khẩu',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _colorApp),
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10.0,
                  right: 10.0,
                ),
                height: 55.0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  onTap: () {},
                  title: Text(
                    'Hỗ trợ',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.live_help,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
