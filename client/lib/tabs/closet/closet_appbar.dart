import 'package:flutter/material.dart';

var appbar = AppBar(
          backgroundColor: Colors.white,
          title: const Text('나의 옷장',
            style: TextStyle(fontFamily: "NotoSans",
            fontWeight: FontWeight.bold,
            color: const Color(0xff131313),
            fontSize: 20.0,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            labelColor: const Color(0xff131313),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            tabs: [
              Tab(text: '옷장'),
              Tab(text: '코디')
            ],
          ),
          centerTitle: true,
        );