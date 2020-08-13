import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class DemoLocalizations {
  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter Demo',
      name: 'title',
      desc: '标题',
    );
  }

  String get toolbar {
    return Intl.message(
      'Flutter Demo Home Page',
      name: 'toolbar',
      desc: 'toolbar',
    );
  }

  String get content {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'content',
      desc: '点击次数描述',
    );
  }

  String get tooltip {
    return Intl.message(
      'Increment',
      name: 'tooltip',
      desc: '右下角加号Tips',
    );
  }
}

//Locale代理类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    return DemoLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
