import 'package:flutter/material.dart';

class MyCloset extends StatelessWidget {
  const MyCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 옷장, 코디
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('나의 옷장',
            style: TextStyle(fontFamily: "NotoSans",
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            tabs: [
              Tab(text: '옷장'),
              Tab(text: '코디')
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Closet(),
            Cody(),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

// appBar 부분
// class TopBar extends StatelessWidget {
//   const TopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         backgroundColor: Colors.white,
//         title: Text('나의 옷장', 
//           style: TextStyle(fontFamily: "NotoSansKR", 
//                             fontWeight: FontWeight.bold, 
//                             color: Colors.black),),
//     );
//   }
// }


// body 부분

class Closet extends StatefulWidget {
  const Closet({super.key});

  @override
  State<Closet> createState() => _ClosetState();
}

class _ClosetState extends State<Closet> {
  var categoryPressed = [true, false, false, false, false];
  var categories = ['상의', '하의', '아우터', '신발', '악세사리'];
  int closetState = 0;

  changePressed (int index) {
    setState(() {
      for (int i = 0; i < categoryPressed.length; i++) {
        if (i == index) {
          categoryPressed[i] = true;
        } else {
          categoryPressed[i] = false;
        }
        closetState = index;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(child: Text(categories[0], style: TextStyle(color: categoryPressed[0] ? Colors.white : Colors.black),), onPressed: () {changePressed(0);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[0] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[1], style: TextStyle(color: categoryPressed[1] ? Colors.white : Colors.black),), onPressed: () {changePressed(1);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[1] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[2], style: TextStyle(color: categoryPressed[2] ? Colors.white : Colors.black),), onPressed: () {changePressed(2);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[2] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[3], style: TextStyle(color: categoryPressed[3] ? Colors.white : Colors.black),), onPressed: () {changePressed(3);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[3] ? Colors.black : Colors.white)),),
            TextButton(child: Text(categories[4], style: TextStyle(color: categoryPressed[4] ? Colors.white : Colors.black),), onPressed: () {changePressed(4);}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(categoryPressed[4] ? Colors.black : Colors.white)),),
          ],
        ),
        closetWidgets[closetState]
      ],
    );
  }
}

var closetWidgets = [Text('예시1'), Text('예시2'), Text('예시3'), Text('예시4'), Text('예시5')];
// 이제 옷장 보여지는 Custom Widget으로 추가 예정


class Cody extends StatefulWidget {
  Cody({super.key});

  @override
  State<Cody> createState() => _CodyState();
}

class _CodyState extends State<Cody> {
  var dropdownlist = ['전체', '날짜', '계절', '날씨'];
  String selected_dropdown = "전체"; // 전체가 default
 // Default는 '전체'
  changeDropdown (String? newValue) {
    setState(() {
      selected_dropdown = newValue!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 120,
                child: Dropdown(changeDropdown: changeDropdown, selected_dropdown: selected_dropdown),
              ),
              Text('공간차지실험'),
            ],
          ),
        ]
        );
  }
}

class Dropdown extends StatelessWidget {
  Dropdown({Key? key, this.changeDropdown, this.selected_dropdown}) : super(key: key);
  // var dropdownlist = ['전체', '날짜', '계절', '날씨'];
  final changeDropdown;
  final selected_dropdown;
  var dropdownitems = [
    DropdownMenuItem(child: Text('전체'), value: "전체",),
    DropdownMenuItem(child: Text('날짜'), value: "날짜",),
    DropdownMenuItem(child: Text('계절'), value: "계절",),
    DropdownMenuItem(child: Text('날씨'), value: "날씨",)
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        filled: false
      ),
      dropdownColor: Colors.white,
      value: selected_dropdown,
      onChanged: (newValue) {
        changeDropdown(newValue);
      },
      items: dropdownitems,
    );
  }
}

// DropdownButton(
//       value: selectedMenu,
//       items: dropdownitems,
//       borderRadius: BorderRadius.horizontal(),
//       onChanged: (String? newValue) {
//         setState(() {
//           selectedMenu = newValue!;
//         });
//       }
//     )

// BottomNavigator 부분


class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 선택된 탭에 대해 움직이는 애니메이션 없애줌
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: unactive[0],
            label: iconlabel[0],
            activeIcon: active[0],
            
          ),
          BottomNavigationBarItem(
            icon: unactive[1],
            label: iconlabel[1],
            activeIcon: active[1],
          ),
          BottomNavigationBarItem(
            icon: unactive[2],
            label: iconlabel[2],
            activeIcon: active[2]
          ),
          BottomNavigationBarItem(
            icon: unactive[3],
            label: iconlabel[3],
            activeIcon: active[3]
          ),
          BottomNavigationBarItem(
            icon: unactive[4],
            label: iconlabel[4],
            activeIcon: active[4],
          )
        ],
        currentIndex: 3, // 화면 연동 시킬 경우 바꿀 필요 있음! setState를 통해 바꾸기
    );
  }
}

var iconlabel = const ['모두의룩', '옷장분석', '홈', '나의옷장', '옷추가'];

var unactive = const [
            Icon(Icons.abc,
              size: 30.0,
              color: Colors.grey,
            ),
            Icon(Icons.bar_chart,
            size: 30.0,
            color: Colors.grey,),
            Icon(Icons.home,
              size: 30.0,
              color: Colors.grey,
            ),
            Icon(Icons.person,
            size: 30.0,
            color: Colors.grey,),
            Icon(Icons.person_add,
            size: 30.0,
            color: Colors.grey,)
          ];

var active = const [
            Icon(Icons.abc,
              size: 30.0,
              color: Colors.black,
            ),
            Icon(Icons.bar_chart,
            size: 30.0,
            color: Colors.black,),
            Icon(Icons.home,
              size: 30.0,
              color: Colors.black,
            ),
            Icon(Icons.person,
            size: 30.0,
            color: Colors.black,),
            Icon(Icons.person_add,
            size: 30.0,
            color: Colors.black,)
          ];