import 'package:flutter_regex/flutter_regex.dart';

import '../../shared/verifier_mems/regex/regex.dart';

extension ExtensionRegexes on AppRegexEntity {
  AppRegexEntity get numeric => const AppRegexEntity(regexValue: r'^[0-9]+');
  AppRegexEntity get url => AppRegexEntity(regexValue: RegexPattern.url);
  AppRegexEntity get phoneNumber => AppRegexEntity(regexValue: RegexPattern.phone);
  AppRegexEntity get email => const AppRegexEntity(regexValue: r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z.]', isExceptionOfFormatting: true);
  AppRegexEntity get username => AppRegexEntity(regexValue: RegexPattern.username);
  AppRegexEntity get passwordEasy => AppRegexEntity(regexValue: RegexPattern.passwordEasy);
  AppRegexEntity get passwordHard => AppRegexEntity(regexValue: RegexPattern.passwordHard);
  AppRegexEntity get macAddress => AppRegexEntity(regexValue: RegexPattern.macAddress);
  AppRegexEntity get google => AppRegexEntity(regexValue: RegexPattern.usernameGoogle, isExceptionOfFormatting: true);
  AppRegexEntity get github => AppRegexEntity(regexValue: RegexPattern.github, isExceptionOfFormatting: true);
  AppRegexEntity get youTube => AppRegexEntity(regexValue: RegexPattern.youtube, isExceptionOfFormatting: true);
}

extension ExtensionAllRegexes on AppRegexListEntity {
  AppRegexListEntity get all => AppRegexListEntity(
          regexesListEntity: List<AppRegexEntity>.of([
        const AppRegexEntity().numeric,
        const AppRegexEntity().url,
        const AppRegexEntity().phoneNumber,
        const AppRegexEntity().email,
        const AppRegexEntity().username,
        const AppRegexEntity().passwordEasy,
        const AppRegexEntity().passwordHard,
        const AppRegexEntity().macAddress,
        const AppRegexEntity().google,
        const AppRegexEntity().github,
        const AppRegexEntity().youTube,
      ]));

  AppRegexListEntity exceptionsOfFormatting() => AppRegexListEntity(
      regexesListEntity: const AppRegexListEntity().all.regexesListEntity?.where((element) => element.isExceptionOfFormatting == true).toList());
}

extension Equal on AppRegexEntity {
  bool equalTo(AppRegexEntity regExp) => regexValue == regExp.regexValue;
}

extension GetRegExp on AppRegexEntity {
  RegExp get regExp => RegExp(regexValue ?? '');
}

extension ListContains on List<AppRegexEntity> {
  bool contains(AppRegexEntity regExp) => where((element) => element.equalTo(regExp)).isNotEmpty;
}

extension ListEntityContains on AppRegexListEntity {
  bool contains(AppRegexEntity regExp) => regexesListEntity?.where((element) => element.equalTo(regExp)).isNotEmpty ?? false;
}