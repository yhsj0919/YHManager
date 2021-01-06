import 'package:flutter/material.dart';

// accentColor - Color类型，前景色（文本、按钮等）
// accentColorBrightness - Brightness类型，accentColor的亮度。 用于确定放置在突出颜色顶部的文本和图标的颜色（例如FloatingButton上的图标）。
// accentIconTheme - IconThemeData类型，与突出颜色对照的图片主题。
// accentTextTheme - TextTheme类型，与突出颜色对照的文本主题。
// backgroundColor - Color类型，与primaryColor对比的颜色(例如 用作进度条的剩余部分)。
// bottomAppBarColor - Color类型，BottomAppBar的默认颜色。
// brightness - Brightness类型，应用程序整体主题的亮度。 由按钮等Widget使用，以确定在不使用主色或强调色时要选择的颜色。
// buttonColor - Color类型，Material中RaisedButtons使用的默认填充色。
// buttonTheme - ButtonThemeData类型，定义了按钮等控件的默认配置，像RaisedButton和FlatButton。
// canvasColor - Color类型，MaterialType.canvas Material的默认颜色。
// cardColor - Color类型，Material被用作Card时的颜色。
// chipTheme - ChipThemeData类型，用于渲染Chip的颜色和样式。
// dialogBackgroundColor - Color类型，Dialog元素的背景色。
// disabledColor - Color类型，用于Widget无效的颜色，无论任何状态。例如禁用复选框。
// dividerColor - Color类型，Dividers和PopupMenuDividers的颜色，也用于ListTiles中间，和DataTables的每行中间.
// errorColor - Color类型，用于输入验证错误的颜色，例如在TextField中。
// hashCode - int类型，这个对象的哈希值。
// *highlightColor - Color类型，用于类似墨水喷溅动画或指示菜单被选中的高亮颜色。
// hintColor - Color类型，用于提示文本或占位符文本的颜色，例如在TextField中。
// iconTheme - IconThemeData类型，与卡片和画布颜色形成对比的图标主题。
// indicatorColor - Color类型，TabBar中选项选中的指示器颜色。
// inputDecorationTheme - InputDecorationTheme类型，InputDecorator，TextField和TextFormField的默认InputDecoration值基于此主题。
// platform - TargetPlatform类型，Widget需要适配的目标类型。
// primaryColor - Color类型，App主要部分的背景色（ToolBar,Tabbar等）。
// primaryColorBrightness - Brightness类型，primaryColor的亮度。
// primaryColorDark - Color类型，primaryColor的较暗版本。
// primaryColorLight - Color类型，primaryColor的较亮版本。
// primaryIconTheme - IconThemeData类型，一个与主色对比的图片主题。
// primaryTextTheme - TextThemeData类型，一个与主色对比的文本主题。
// scaffoldBackgroundColor - Color类型，作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色。
// secondaryHeaderColor - Color类型，有选定行时PaginatedDataTable标题的颜色。
// selectedRowColor - Color类型，选中行时的高亮颜色。
// sliderTheme - SliderThemeData类型，用于渲染Slider的颜色和形状。
// splashColor - Color类型，墨水喷溅的颜色。
// splashFactory - InteractiveInkFeatureFactory类型，定义InkWall和InkResponse生成的墨水喷溅的外观。
// textSelectionColor - Color类型，文本字段中选中文本的颜色，例如TextField。
// textSelectionHandleColor - Color类型，用于调整当前文本的哪个部分的句柄颜色。
// textTheme - TextTheme类型，与卡片和画布对比的文本颜色。
// toggleableActiveColor - Color类型，用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
// unselectedWidgetColor - Color类型，用于Widget处于非活动（但已启用）状态的颜色。 例如，未选中的复选框。 通常与accentColor形成对比。
// runtimeType - Type类型，表示对象的运行时类型。

ThemeData lightTheme = ThemeData(
  buttonTheme: ButtonThemeData(
    highlightColor: Colors.black12,
    splashColor: Colors.black12,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
    buttonColor: Colors.blue,
  ),
  fontFamily: 'Microsoft YaHei',
  primarySwatch: Colors.blue,
  brightness: Brightness.light,

  textTheme: TextTheme(
//       headline1: TextStyle(color: Colors.black87),
//       headline2: TextStyle(color: Colors.black87),
//       headline3: TextStyle(color: Colors.black87),
//       headline4: TextStyle(color: Colors.black87),
//       headline5: TextStyle(color: Colors.black87),
    headline6: TextStyle(color: Colors.blue),
    subtitle1: TextStyle(color: Color(0xff444444)),
    // subtitle2: TextStyle(color: Colors.pink),
    // bodyText1: TextStyle(color: Colors.pink),
    bodyText2: TextStyle(color: Color(0xff555555)),
    // caption: TextStyle(color: Colors.pink),
    // button: TextStyle(color: Colors.pink),
    overline: TextStyle(color: Colors.redAccent),
  ),

  appBarTheme: AppBarTheme(
    //     elevation: 0,
    iconTheme: IconThemeData(color: Colors.black87),
    textTheme: TextTheme(
      //       headline1: TextStyle(color: Colors.black87),
      //       headline2: TextStyle(color: Colors.black87),
      //       headline3: TextStyle(color: Colors.black87),
      //       headline4: TextStyle(color: Colors.black87),
      //       headline5: TextStyle(color: Colors.black87),
      headline6: TextStyle(color: Colors.black87),
      //       subtitle1: TextStyle(color: Colors.black87),
      //       subtitle2: TextStyle(color: Colors.black87),
      //       bodyText1: TextStyle(color: Colors.black87),
      bodyText2: TextStyle(color: Colors.black87),
      //       caption: TextStyle(color: Colors.black87),
      //       button: TextStyle(color: Colors.black87),
      //       overline: TextStyle(color: Colors.black87),
    ),
    color: Colors.white24,
  ),
  // scaffoldBackgroundColor: Colors.transparent,
);
