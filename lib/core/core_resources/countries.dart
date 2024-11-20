
import '../../shared/helper_mems/custom_duration/custom_duration.dart';

enum AppCountry {
  utc(
    countryName: 'GMT',
    countryNameAbbreviation: 'GMT',
    timeZoneAbbreviation: ['UTC'],
    timeZoneOffset: [CustomDurationEntity()],
  ),
  iran(
    countryName: 'Iran',
    countryNameAbbreviation: 'IR',
    code: '98',
    currency: AppCurrency.irr,
    timeZoneAbbreviation: ['IRST'],
    timeZoneOffset: [CustomDurationEntity(hour: 4, minute: 30)],
    hasDst: false,
  ),
  germany(
    countryName: 'Germany',
    countryNameAbbreviation: 'DE',
    code: '49',
    currency: AppCurrency.euro,
    timeZoneAbbreviation: ['CET'],
    timeZoneOffset: [CustomDurationEntity(hour: 2)],
  ),
  us(
    countryName: 'United States',
    countryNameAbbreviation: 'US',
    code: '1',
    currency: AppCurrency.usd,
    timeZoneAbbreviation: ['PST', 'MST', 'CST', 'EST'],
    timeZoneOffset: [
      CustomDurationEntity(hour: -8),
      CustomDurationEntity(hour: -7),
      CustomDurationEntity(hour: -6),
      CustomDurationEntity(hour: -5),
    ],
  ),
  uk(
    countryName: 'United Kingdom',
    countryNameAbbreviation: 'GB',
    code: '44',
    currency: AppCurrency.gbp,
    timeZoneAbbreviation: ['BST'],
    timeZoneOffset: [CustomDurationEntity(hour: 1)],
  ),
  canada(
    countryName: 'Canada',
    countryNameAbbreviation: 'CA',
    code: '1',
    currency: AppCurrency.cad,
    timeZoneAbbreviation: ['PST', 'MST', 'CST', 'EST', 'AST'],
    timeZoneOffset: [
      CustomDurationEntity(hour: -7),
      CustomDurationEntity(hour: -6),
      CustomDurationEntity(hour: -5),
      CustomDurationEntity(hour: -4),
      CustomDurationEntity(hour: -3),
    ],
  ),
  uae(
    countryName: 'United Arab Emirates',
    countryNameAbbreviation: 'AE',
    code: '971',
    currency: AppCurrency.aed,
    timeZoneAbbreviation: ['GST'],
    timeZoneOffset: [CustomDurationEntity(hour: 4)],
  ),
  turkey(
    countryName: 'Turkey',
    countryNameAbbreviation: 'TR',
    code: '90',
    currency: AppCurrency.tryl,
    timeZoneAbbreviation: ['EEST'],
    timeZoneOffset: [CustomDurationEntity(hour: 3)],
  ),
  china(
    countryName: 'China',
    countryNameAbbreviation: 'CN',
    code: '86',
    currency: AppCurrency.cny,
    timeZoneAbbreviation: ['CST'],
    timeZoneOffset: [CustomDurationEntity(hour: 8)],
  ),
  japan(
    countryName: 'Japan',
    countryNameAbbreviation: 'JP',
    code: '81',
    currency: AppCurrency.jpy,
    timeZoneAbbreviation: ['JST'],
    timeZoneOffset: [CustomDurationEntity(hour: 9)],
  ),

  //Default
  unknown(
    countryName: 'Unknown',
    countryNameAbbreviation: 'Unknown',
    code: 'Unknown',
    currency: AppCurrency.unknown,
    timeZoneAbbreviation: ['Unknown'],
    timeZoneOffset: [CustomDurationEntity()],
  );

  ///Variables
  final String? countryName;
  final String? countryNameAbbreviation;
  final String? code;
  final AppCurrency? currency;
  final List<String>? timeZoneAbbreviation;
  final List<CustomDurationEntity>? timeZoneOffset;
  final bool hasDst;

  ///Constructor
  const AppCountry({
    this.countryName,
    this.countryNameAbbreviation,
    this.code,
    this.currency,
    this.timeZoneAbbreviation,
    this.timeZoneOffset,
    this.hasDst = false,
  });
}

enum AppCurrency {
  irr(sign: AppCurrencySign.rial, name: 'IRR', description: 'Iranian Rial', localDescription: 'ریال ایران'),
  euro(sign: AppCurrencySign.euro, name: 'Euro', description: 'Europa Euro'),
  usd(sign: AppCurrencySign.dollar, name: 'USD', description: 'United States Dollar'),
  cad(sign: AppCurrencySign.dollar, name: 'CAD', description: 'Canadian Dollar'),
  gbp(sign: AppCurrencySign.pound, name: 'GBP', description: 'Great Britain Pound'),
  cny(sign: AppCurrencySign.yuan, name: 'CNY', description: 'China Yuan'),
  jpy(sign: AppCurrencySign.yuan, name: 'JPY', description: 'Japanese Yuan'),
  aed(sign: AppCurrencySign.dirham, name: 'AED', description: 'Arab Emirates Dirham'),
  tryl(sign: AppCurrencySign.lira, name: 'TRY', description: 'Turkish Lira'),
  rub(sign: AppCurrencySign.ruble, name: 'RUB', description: 'Russian Ruble'),
  unknown(sign: AppCurrencySign.unknown, name: 'Unknown', description: 'Unknown');

  final AppCurrencySign sign;
  final String name;
  final String description;
  final String? localDescription;
  const AppCurrency({
    required this.sign,
    required this.name,
    required this.description,
    this.localDescription,
  });
}

enum AppCurrencySign {
  rial(string: 'R', local: 'ریال'),
  dollar(string: '\$'),
  euro(string: '€'),
  yuan(string: '¥'),
  pound(string: '£'),
  franc(string: '₣'),
  ruble(string: '₽'),
  shekel(string: '₪'),
  dinar(string: 'DA'),
  dirham(string: 'DH'),
  lira(string: '₺'),
  lari(string: '₾'),
  dram(string: '֏'),
  rupee(string: '₹'),
  won(string: '₩'),
  peso(string: '₱'),
  unknown(string: '');

  final String string;
  final String? local;
  const AppCurrencySign({required this.string, this.local});
}
