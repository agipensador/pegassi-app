import 'dart:convert';
import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/screens/screen_premium.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FragmentAppCardController extends GetxController {
  late SharedPreferences prefs;

  var itemsFipeJson = [].obs;

  String? valueCopyStore = '0';
  String? valueKeyCopy = '0';
  String? valueKeyAlarm = '0';
  String? valueKeyConfect = '0';
  String? valueKeyConfectAlarm = '0';
  String? valueDataKeyChip = '';
  String? keyLaminaTypeGold = '';
  String? laminaTextDica = '';
  String? laminasKeys = '';
  Map<String, dynamic>? laminaPalhetas = {};
  String? transponderClone = '';
  String? transponderCodigo = '';
  String? transponderNomenclatura = '';
  String? telecomandoBatery = '';
  String? telecomandoFrequency = '';
  String? telecomandoProcedure = '';
  String? telecomandoBrands = '';
  String? telecomandoImage = '';
  String? transponderImage = '';
  String? laminaPinCode = '';
  String? maquinasCodificadoras = '';
  String? videoLink = '';
  String? valueID = '';
  String? valuePCF = '';
  String? valueSERIE = '';

  String? brand;
  String? model;
  String? fuel;
  String? year;
  String? fipeCode;
  String? value;
  String? mesRef;

  RxBool isLoadedTimer = false.obs;

  // final FipeTableController controllerFipeTable =
  //     Get.put(FipeTableController());

  final ManagerController controllerManager = Get.put(ManagerController());

  Map<String, dynamic> listaFirebase = {};

  clearTexts() {
    valueCopyStore = '0';
    valueKeyCopy = '0';
    valueKeyAlarm = '0';
    valueKeyConfect = '0';
    valueKeyConfectAlarm = '0';
    valueDataKeyChip = '';
    keyLaminaTypeGold = '';
    laminaTextDica = '';
    laminasKeys = '';
    laminaPalhetas = {};
    laminaPinCode = '';
    transponderClone = '';
    transponderCodigo = '';
    transponderNomenclatura = '';
    telecomandoBatery = '';
    telecomandoFrequency = '';
    telecomandoProcedure = '';
    telecomandoBrands = '';
    telecomandoImage = '';
    transponderImage = '';
    maquinasCodificadoras = '';
    videoLink = '';
  }

  getKeysFipeValues(String brandMarca) async {
    clearTexts();
    try {
      await readFipeJson(brandMarca);
      valueCopyStore =
          itemsFipeJson[0][model][fuel][year]['valueCopyStore'] ?? '0';
      valueKeyCopy = itemsFipeJson[0][model][fuel][year]['valueKeyCopy'] ?? '0';
      valueKeyAlarm =
          itemsFipeJson[0][model][fuel][year]['valueKeyAlarm'] ?? '0';
      valueKeyConfect =
          itemsFipeJson[0][model][fuel][year]['valueKeyConfect'] ?? '0';
      valueKeyConfectAlarm =
          itemsFipeJson[0][model][fuel][year]['valueKeyConfectAlarm'] ?? '0';
      valueDataKeyChip =
          itemsFipeJson[0][model][fuel][year]['valueDataKeyChip'] ?? '';
      keyLaminaTypeGold =
          itemsFipeJson[0][model][fuel][year]['keyLaminaGold'] ?? '';
      laminaTextDica =
          itemsFipeJson[0][model][fuel][year]['laminaTextDica'] ?? '';
      laminasKeys = itemsFipeJson[0][model][fuel][year]['laminasKeys'] ?? '';
      laminaPalhetas =
          itemsFipeJson[0][model][fuel][year]['laminaPalhetas'] ?? {};
      laminaPinCode =
          itemsFipeJson[0][model][fuel][year]['laminaPinCode'] ?? '';
      transponderClone =
          itemsFipeJson[0][model][fuel][year]['transponderClone'] ?? '';
      transponderCodigo =
          itemsFipeJson[0][model][fuel][year]['transponderCodigo'] ?? '';
      transponderNomenclatura =
          itemsFipeJson[0][model][fuel][year]['transponderNomenclatura'] ?? '';
      telecomandoBatery =
          itemsFipeJson[0][model][fuel][year]['telecomandoBatery'] ?? '';
      telecomandoImage =
          itemsFipeJson[0][model][fuel][year]['telecomandoImage'] ?? '';
      transponderImage =
          itemsFipeJson[0][model][fuel][year]['transponderImage'] ?? '';
      telecomandoBrands =
          itemsFipeJson[0][model][fuel][year]['telecomandoBrands'] ?? '';
      telecomandoFrequency =
          itemsFipeJson[0][model][fuel][year]['telecomandoFrequency'] ?? '';
      telecomandoProcedure =
          itemsFipeJson[0][model][fuel][year]['telecomandoProcedure'] ?? '';
      maquinasCodificadoras =
          itemsFipeJson[0][model][fuel][year]['maquinasCodificadoras'] ?? '';
      videoLink = itemsFipeJson[0][model][fuel][year]['videoLink'] == 'abc'
          ? 'https://www.youtube.com/watch?v=3fuldNm79x0&pp=ygUbY2xvbmUgY2hhdmUgZmlhdCBwYWxpbyAyMDA4'
          : itemsFipeJson[0][model][fuel][year]['videoLink'] ?? '';
    } catch (_) {}
    funcAddItemsInCar(brandMarca);
  }

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();

    transponderNomenclatura = prefs.getString('valorNOMEN') ?? '';
    maquinasCodificadoras = prefs.getString('valorMAQUINAS') ?? '';
    telecomandoImage = prefs.getString('valorTELECOMMANDOIMG') ?? '';
    telecomandoProcedure = prefs.getString('valorPROCEDIMENTO') ?? '';
    telecomandoFrequency = prefs.getString('valorFREQUENCIA') ?? '';
    telecomandoBatery = prefs.getString('valorBATERY') ?? '';
    transponderImage = prefs.getString('valorIMGTRANSP') ?? '';
    transponderClone = prefs.getString('valorCLONE') ?? '';
    laminaTextDica = prefs.getString('valorTEXTOLAMINADICA') ?? '';
    keyLaminaTypeGold = prefs.getString('valorTIPOGOLD') ?? '';
    laminasKeys = prefs.getString('valorADAPTACOES') ?? '';
    videoLink = prefs.getString('valorVideo') ?? '';
    valueID = prefs.getString('valorID') ?? '';
    valuePCF = prefs.getString('valorPCF') ?? '';
    valueSERIE = prefs.getString('valorSERIE') ?? '';

    super.onInit();
  }

  // visualizeValueAdsenseOrPremium(
  //     bool isTablet,
  //     String titleCardFipe,
  //     String message1,
  //     String messageTextImage1,
  //     String messageTextImage2,
  //     String message2,
  //     bool isButtonShowAdsense,
  //     bool signaturePremium) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Get.defaultDialog(
  //       title: titleCardFipe.toString(),
  //       titleStyle: AppStyles.title.copyWith(
  //         color: AppColors.primaryColor,
  //       ),
  //       cancel: EditButtonDefault(
  //         textButton: signaturePremium
  //             ? 'ASSINE O PREMIUM'
  //             : titleCardFipe.toString() == 'VER DETALHES'
  //                 ? 'VER DETALHES'
  //                 : 'VER PROPAGANDA',
  //         verticalSpaceText: 16,
  //         onClick: () {
  //           if (signaturePremium) {
  //             Get.offAll(
  //               () => ScreenPremium(),
  //             );
  //             controllerFipeTable.getBrands();
  //           } else {
  //             if (titleCardFipe.toString() == 'VER DETALHES') {
  //               controllerFipeTable.removeQuantityAcessos();
  //               Get.back();
  //             } else {
  //               controllerFipeTable.loadAdReward();
  //             }
  //           }
  //         },
  //       ),
  //       confirm: titleCardFipe.toString() == 'VISUALIZAR' &&
  //               controllerFipeTable.valueAccessAd >= 2
  //           ? EditButtonDefault(
  //               textButton: 'USAR 3 ACESSOS PARA VER DETALHES',
  //               verticalSpaceText: 16,
  //               colorButton: AppColors.backgroundColor,
  //               onClick: () {
  //                 controllerFipeTable.removeQuantityAcessos();
  //                 Get.back();
  //               },
  //             )
  //           : const SizedBox.shrink(),
  //       content: Column(
  //         children: [
  //           titleCardFipe.toString() == 'VISUALIZAR' &&
  //                   controllerFipeTable.valueAccessAd >= 2
  //               ? const SizedBox.shrink()
  //               : Text(
  //                   message1.toString(),
  //                   style: AppStyles.subtitle,
  //                   textAlign: TextAlign.center,
  //                 ),
  //           titleCardFipe.toString() == 'VISUALIZAR' &&
  //                   controllerFipeTable.valueAccessAd >= 2
  //               ? const SizedBox.shrink()
  //               : RichText(
  //                   textAlign: TextAlign.center,
  //                   text: TextSpan(
  //                     children: [
  //                       TextSpan(
  //                           text: messageTextImage1.toString(),
  //                           style: AppStyles.subtitle.copyWith(
  //                               color: AppColors.backgroundColor,
  //                               fontWeight: FontWeight.bold)),
  //                       WidgetSpan(
  //                         child: SvgPicture.asset(
  //                           'assets/icons/cadeado_acessos.svg',
  //                           color: Colors.black87,
  //                           height: 20,
  //                           width: 20,
  //                         ),
  //                       ),
  //                       TextSpan(
  //                           text: messageTextImage2.toString(),
  //                           style: TextStyle(
  //                               color: AppColors.backgroundColor,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: isTablet ? 24 : 18)),
  //                     ],
  //                   ),
  //                 ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 6.0),
  //             child: isButtonShowAdsense
  //                 ? TextButton(
  //                     onPressed: () {
  //                       controllerFipeTable.valueAccessAd.value =
  //                           controllerFipeTable.valueAccessAd.value + 1;
  //                       controllerFipeTable.loadAdReward();
  //                     },
  //                     style: TextButton.styleFrom(
  //                       minimumSize: Size.zero,
  //                       padding: EdgeInsets.zero,
  //                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //                     ),
  //                     child: Text(
  //                       'VER PROPAGANDAS',
  //                       style: AppStyles.subtitle.copyWith(
  //                         color: AppColors.backgroundColor,
  //                         decoration: TextDecoration.underline,
  //                       ),
  //                     ))
  //                 : Text(
  //                     message2,
  //                     style: AppStyles.description
  //                         .copyWith(color: Colors.black87, fontSize: 16),
  //                     textAlign: TextAlign.center,
  //                   ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  Future<void> readFipeJson(String brandMarca) async {
    switch (brandMarca) {
      case 'audi':
        brandMarca = 'audi';
        break;
      case 'fiat':
        brandMarca = 'audi';
        break;
      case 'bmw':
        brandMarca = 'bmw';
        break;
      default:
        brandMarca = 'fipe';
        break;
    }

    String? response = await rootBundle.loadString("assets/$brandMarca.json");
    final data = await json.decode(response);

    itemsFipeJson.value = data["items"];
  }

  funcAddItemsInCar(String brand) async {
    final dt = (int.parse(year ?? '0'));
    if (valueCopyStore == '0' || valueCopyStore == '-') {
      switch (model?.split(" ").elementAt(0).toLowerCase()) {
        case 'palio':
          if (dt >= 1996) {
            retValues('palio_96_02');
          } else if (dt >= 2003) {
            retValues('palio_03_16');
          }
          break;
        case 'pulse':
          retValues('pulse18mais');
          break;
        case 'punto':
          retValues('punto8a17');
          break;
        case 'siena':
          if (dt >= 1996) {
            retValues('siena96a00');
          } else if (dt >= 2001) {
            retValues('siena01a16');
          }
          break;
        case 'stilo':
          if (dt >= 2002 && dt <= 2011) {
            retValues('siena96a00');
          }
          break;
        case 'strada':
          if (dt >= 1996 && dt <= 2000) {
            retValues('strada96a00');
          } else if (dt >= 2001 && dt <= 2012) {
            retValues('strada1a12');
          } else if (dt >= 2020) {
            retValues('strada20mais');
          }
          break;
        case 'tempra':
          if (dt >= 1995 && dt <= 2000) {
            retValues('tempra95a0');
          }
          break;
        case 'toro':
          retValues('toro16mais');
          break;
        case 'uno':
          if (dt >= 2002 && dt <= 2013) {
            retValues('uno2a13');
          } else if (dt == 2014) {
            retValues('uno14');
          } else if (dt <= 2016) {
            retValues('uno15a16');
          } else if (dt >= 2017) {
            retValues('uno17mais');
          }
          break;
        case 'buggy':
          if (brand.toLowerCase() == 'fibravan') {
            retValues('fibra');
          }
          break;
        case 'courier':
          if (dt >= 1997 && dt <= 2000) {
            retValues('courier97a00');
          } else if (dt >= 2001 && dt <= 2002) {
            retValues('courier1e2');
          } else if (dt >= 2003) {
            retValues('courier3mais');
          }
          break;
        case 'escort':
          if (dt == 1995 || dt <= 1996) {
            retValues('escort9596');
          } else if (dt >= 1997 && dt <= 2003) {
            retValues('escort97a03');
          }
          break;
        case 'ecosport':
          if (dt >= 2003 && dt <= 2012) {
            retValues('ecos3a12');
          } else if (dt >= 2013 && dt <= 2021) {
            retValues('ecos13a21');
          } else if (dt >= 2022) {
            retValues('ecos22mais');
          }
          break;
        case 'edge':
          if (dt >= 2008 && dt <= 2014) {
            retValues('edge8a14');
          } else if (dt >= 2015) {
            retValues('edge15mais');
          }
          break;
        case 'f-150':
          if (dt >= 1999 && dt <= 2003) {
            retValues('f1599a3');
          } else if (dt >= 2004 && dt <= 2011) {
            retValues('f154a11');
          } else if (dt >= 2012 && dt <= 2015) {
            retValues('f1512a15');
          } else if (dt >= 2016 && dt <= 2020) {
            retValues('f151620');
          }
          break;
        case 'f-250':
          if (dt >= 1999 && dt <= 2003) {
            retValues('f1599a3');
          } else if (dt >= 2004 && dt <= 2011) {
            retValues('f154a11');
          } else if (dt >= 2012 && dt <= 2015) {
            retValues('f1512a15');
          } else if (dt >= 2016 && dt <= 2020) {
            retValues('f151620');
          }
          break;
        case 'focus':
          if (dt >= 2001 && dt <= 2008) {
            retValues('focs1a8');
          } else if (dt >= 2009 && dt <= 2010) {
            retValues('focs910');
          } else if (dt >= 2011 && dt <= 2021) {
            retValues('focs1121');
          }
          break;
        case 'ka':
          if (dt >= 2007 && dt <= 2014) {
            retValues('ka7a14');
          } else if (dt >= 2015 && dt <= 2017) {
            retValues('ka15a17');
          } else if (dt >= 2018) {
            retValues('ka18');
          }
          break;
        case 'mondeo':
          if (dt >= 2001 && dt <= 2007) {
            retValues('mon1a07');
          }
          break;
        case 'taurus':
          if (dt >= 1996) {
            retValues('taur96a99');
          }
          break;
        case 'territory':
          retValues('terri21m');
          break;
        case 'transit':
          if (dt >= 1995 && dt <= 1999) {
            retValues('trans95a99');
          } else if (dt >= 2000 && dt <= 2006) {
            retValues('trans00a6');
          } else if (dt == 2007 || dt == 2008) {
            retValues('trans7a8');
          } else if (dt >= 2009 && dt <= 2013) {
            retValues('trans9a13');
          } else if (dt == 2014 || dt == 2015) {
            retValues('trans1415');
          } else if (dt >= 2016) {
            retValues('trans16m');
          }
          break;
        case 'aumark':
          retValues('aumk');
          break;
        case 'ec7':
          retValues('ec7');
          break;
        case 'gc2':
          retValues('gc2');
          break;
        case 'agile':
          if (dt <= 2013) {
            retValues('agim13');
          } else {
            retValues('agi14m');
          }
          break;
        case 'astra':
          if (dt <= 2001) {
            retValues('astram1');
          } else if (dt >= 2002 && dt <= 2008) {
            retValues('astra2a8');
          } else {
            retValues('astra9m');
          }
          break;
        case 'bolt':
          retValues('bolt');
          break;
        case 'celta':
          if (dt >= 2000 && dt <= 2008) {
            retValues('celta0a8');
          } else if (dt >= 2009 && dt <= 2016) {
            retValues('celta9a16');
          }
          break;
        case 'corsa':
          if (dt >= 1996 && dt <= 2003) {
            retValues('corsa96a3');
          } else if (dt >= 2004 && dt <= 2012) {
            retValues('corsa4a12');
          }
          break;
        case 'corvete':
          if (dt >= 1996 && dt <= 2004) {
            retValues('corvt96a4');
          } else if (dt >= 2005 && dt <= 2007) {
            retValues('corvt5a7');
          } else if (dt >= 2008) {
            retValues('corvt8m');
          }
          break;
        case 'cruze':
          if (dt >= 2012 && dt <= 2016) {
            retValues('cruze12a16');
          } else if (dt >= 2017) {
            retValues('cruze17m');
          }
          break;
        case 'lumina':
          if (dt >= 1995) {
            retValues('lum95m');
          }
          break;
        case 'malibu':
          retValues('malibu');
          break;
        case 'meriva':
          if (dt >= 2002 && dt <= 2012) {
            retValues('meriva2a12');
          }
          break;
        case 'montana':
          if (dt >= 2004 && dt <= 2008) {
            retValues('montan4a8');
          } else if (dt >= 2009 && dt <= 2010) {
            retValues('montan9e10');
          } else if (dt >= 2011 && dt <= 2013) {
            retValues('montan11a13');
          } else if (dt >= 2014 && dt <= 2017) {
            retValues('montan14a17');
          } else if (dt >= 2018) {
            retValues('montan18m');
          }
          break;
        case 'omega':
          if (dt >= 1995 && dt <= 2007) {
            retValues('omg95a7');
          }
          break;
        case 'onix':
          if (dt >= 2013 && dt <= 2020) {
            retValues('onix13a20');
          } else if (dt >= 2021) {
            retValues('onix21m');
          }
          break;
        case 'accord':
          if (dt >= 2007 && dt <= 2009) {
            retValues('accord');
          }
          break;
        case 'city':
          if (dt >= 2010 && dt <= 2013) {
            retValues('city1013');
          } else if (dt >= 2014 && dt <= 2021) {
            retValues('city1421');
          }
          break;
        case 'civic':
          if (dt >= 2004 && dt <= 2006) {
            retValues('civic4a6');
          } else if (dt >= 2007 && dt <= 2013) {
            retValues('civic7a13');
          } else if (dt >= 2014 && dt <= 2021) {
            retValues('civic14a21');
          }
          break;
        case 'cr-v':
          if (dt >= 2000 && dt <= 2006) {
            retValues('fit3a8');
          } else if (dt >= 2007 && dt <= 2013) {
            retValues('fit9a13');
          } else if (dt >= 2014 && dt <= 2021) {
            retValues('fit14a21');
          }
          break;
        //todo ver nome do modelo
        case 'fit':
          if (dt >= 2003 && dt <= 2008) {
            retValues('fit3a8');
          } else if (dt >= 2009 && dt <= 2013) {
            retValues('fit9a13');
          } else if (dt >= 2014 && dt <= 2021) {
            retValues('fit14a21');
          }
          break;
        case 'hr-v':
          if (dt >= 2015 && dt <= 2021) {
            retValues('hrvwrv');
          }
          break;
        case 'wr-v':
          if (dt >= 2015 && dt <= 2021) {
            retValues('hrvwrv');
          }
          break;
        case 'azera':
          if (dt >= 2012 && dt <= 2015) {
            retValues('azr12m');
          } else if (dt == 2011) {
            retValues('azr11');
          }
          break;
        case 'creta':
          if (dt >= 2017 && dt <= 2021) {
            retValues('creta');
          }
          break;
        case 'elantra':
          if (dt >= 2012 && dt <= 2015) {
            retValues('elantra1215');
          } else if (dt == 2011) {
            retValues('elantra16');
          } else if (dt >= 2012 && dt <= 2015) {
            retValues('elantra1719');
          }
          break;
        case 'hb20':
          if (dt >= 2013 && dt <= 2018) {
            retValues('hb2013a18');
          } else if (dt == 2019) {
            retValues('hb2019');
          } else if (dt >= 2020) {
            retValues('hb20m');
          }
          break;
        case 'i30':
          if (dt >= 2009 && dt <= 2012) {
            retValues('i309a12');
          } else if (dt >= 2013 && dt <= 2017) {
            retValues('i301317');
          }
          break;
        case 'santa':
          if (dt >= 2001 && dt <= 2012) {
            retValues('stfe');
          }
          break;
        case 'tucson':
          if (dt >= 2005 && dt <= 2017) {
            retValues('tucs517');
          } else if (dt >= 2018 && dt <= 2021) {
            retValues('tucs1821');
          }
          break;
        case 'veloster':
          if (dt >= 2011 && dt <= 2013) {
            retValues('velos517');
          }
          break;
        case 'compass':
          if (dt >= 2012 && dt <= 2015) {
            retValues('compass1215');
          } else if (dt >= 2016) {
            retValues('compass16m');
          }
          break;
        case 'renegade':
          if (dt >= 2015 && dt <= 2021) {
            retValues('rngde');
          }
          break;
        case 'sportage':
          if (dt >= 2011 && dt <= 2013) {
            retValues('sprtg');
          }
          break;
        case 'nx':
          if (dt >= 2017 && dt <= 2019) {
            retValues('nx3');
          }
          break;
        case 'accelo':
          retValues('a');
          break;
        case 'actros':
          retValues('a');
          break;
        case 'atego':
          retValues('a');
          break;
        case 'atron':
          retValues('a');
          break;
        case 'axor':
          retValues('a');
          break;
        case 'classe':
          if (dt >= 1999 && dt <= 2005) {
            retValues('class99a5');
          }
          break;
        case 'gla':
          if (dt >= 2013 && dt <= 2014) {
            retValues('gla1314');
          } else if (dt >= 2015 && dt <= 2022) {
            retValues('gla1522');
          }
          break;
        case 'sprinter':
          if (dt >= 2001 && dt <= 2010) {
            retValues('spri1a10');
          } else if (dt >= 2012) {
            retValues('spri12m');
          }
          break;
        case 'asx':
          if (dt >= 2001 && dt <= 2010) {
            retValues('asx1016');
          } else if (dt >= 2012) {
            retValues('asx1719');
          }
          break;
        case 'eclipse':
          if (dt >= 2018 && dt <= 2022) {
            retValues('eclps1822');
          }
          break;
        case 'l200':
          if (dt >= 2020 && dt <= 2022) {
            retValues('l22022');
          }
          break;
        case 'outlander':
          if (dt >= 2010 && dt <= 2013) {
            retValues('outl1013');
          } else if (dt == 2014 && dt <= 2019) {
            retValues('outl1419');
          } else if (dt >= 2020) {
            retValues('outl20m');
          }
          break;
        case 'pajero':
          if (model!.toLowerCase().contains('full')) {
            if (dt == 2014 && dt <= 2016) {
              retValues('pjrfl1416');
            } else if (dt == 2017 && dt <= 2020) {
              retValues('pjrfl1720');
            }
          } else {
            if (dt >= 2012 && dt <= 2019) {
              retValues('pjrdkr');
            }
          }
          break;
        case 'atm14':
          if (dt >= 2020 && dt <= 2022) {
            retValues('atm14');
          }
          break;
        case 'frontier':
          if (dt >= 2020 && dt <= 2022) {
            retValues('front6a13');
          } else if (dt >= 2020 && dt <= 2022) {
            retValues('front14a19');
          }
          break;
        case 'kicks':
          if (dt >= 2016 && dt <= 2021) {
            retValues('kik16a21');
          } else if (dt >= 2022) {
            retValues('kik22m');
          }
          break;
        case 'livina':
          if (model!.contains('1.8')) {
            if (dt >= 2016 && dt <= 2021) {
              retValues('livn18_7a14');
            } else if (dt >= 2016 && dt <= 2021) {
              retValues('livn18_15m');
            }
          } else {
            if (dt >= 2007 && dt <= 2014) {
              retValues('livn7a14');
            } else if (dt >= 2015) {
              retValues('livn15m');
            }
          }
          break;
        case 'MARCH':
          if (model!.contains('1.6') && dt >= 2011) {
            retValues('marc1_6');
          } else {
            if (dt >= 2011 && dt <= 2014) {
              retValues('march11a14');
            } else if (dt >= 2015) {
              retValues('march15m');
            }
          }
          break;
        case 'sentra':
          if (dt >= 2000 && dt <= 2016) {
            retValues('sentr0a6');
          } else if (dt >= 2007 && dt <= 2014) {
            retValues('sentra7a14');
          }
          break;
        case 'tiida':
          retValues('tiida');
          break;
        case 'versa':
          if (dt >= 2011 && dt <= 2019) {
            retValues('vrs11a19');
          } else if (dt >= 2020) {
            retValues('vrsa20m');
          }
          break;
        case '2008':
          if (dt >= 2015 && dt <= 2019) {
            retValues('pg200815a19');
          } else if (dt >= 2020 && dt <= 2021) {
            retValues('pg20082021');
          }
          break;
        case '206':
          if (dt >= 1998 && dt <= 2003) {
            retValues('20698a3');
          } else if (dt >= 2004 && dt <= 2010) {
            retValues('2064a10');
          }
          break;
        case '208':
          if (dt >= 2013 && dt <= 2019) {
            retValues('20813a19');
          } else if (dt >= 2020) {
            retValues('20820m');
          }
          break;
        case '3008':
          if (dt >= 2011 && dt <= 2016) {
            retValues('3008');
          }
          break;
        case '307':
          if (dt >= 2004 && dt <= 2008) {
            retValues('307');
          }
          break;
        case '408':
          if (dt >= 2011 && dt <= 2016) {
            retValues('408308');
          } else if (dt >= 2011 && dt <= 2012) {
            retValues('408308');
          }
          break;
        case '308':
          if (dt >= 2011 && dt <= 2012) {
            retValues('408308');
          }
          break;
        case 'boxer':
          if (dt >= 2010 && dt <= 2017) {
            retValues('bxr');
          }
          break;
        case 'expert':
          if (dt >= 2018) {
            retValues('expert');
          }
          break;
        case 'hogga':
          if (dt >= 2010 && dt <= 2014) {
            retValues('hogga');
          }
          break;
        case 'clio':
          if (dt >= 1996 && dt <= 2002) {
            retValues('clio96a2');
          } else if (dt >= 2003 && dt <= 2016) {
            retValues('clio316');
          }
          break;
        case 'duster':
          if (dt >= 2012 && dt <= 2015) {
            retValues('dust12a15');
          } else if (dt >= 2016 && dt <= 2021) {
            retValues('dust16a211');
          }
          break;
        case 'kangoo':
          if (dt >= 2001 && dt <= 2012) {
            retValues('clio96a2');
          }
          break;
        case 'kwid':
          if (dt >= 2017) {
            retValues('kwid');
          }
          break;
        case 'oroch':
          if (dt >= 2017) {
            retValues('kwid');
          }
          break;
        case 'megane':
          if (dt >= 2005 && dt <= 2013) {
            retValues('meg5a13');
          }
          break;
        case 'logan':
          if (dt >= 2008 && dt <= 2013) {
            retValues('logan8a13');
          } else if (dt >= 2014 && dt <= 2022) {
            retValues('logan14a22');
          }
          break;
        case 'sandero':
          if (dt >= 2008 && dt <= 2014) {
            retValues('logan8a13');
          } else if (dt >= 2015 && dt <= 2022) {
            retValues('logan14a22');
          }
          break;
        case 'symbol':
          if (dt >= 2009 && dt <= 2013) {
            retValues('logan8a13');
          }
          break;
        case 'twingo':
          if (dt >= 1997 && dt <= 2002) {
            retValues('clio96a2');
          }
          break;
        case 'gran':
          retValues('gran');
          break;
        case 'jimmy':
          if (dt >= 2009 && dt <= 2017) {
            retValues('jimmy917');
          }
          break;
        case 'sx-4':
          retValues('sx-4');
          break;
        case 'corolla':
          if (dt >= 1998 && dt <= 2002) {
            retValues('corolla982');
          } else if (dt >= 2003 && dt <= 2008) {
            retValues('corolla3a8');
          } else if (dt >= 2009 && dt <= 2014) {
            retValues('corolla9a14');
          } else if (dt >= 2015 && dt <= 2019) {
            retValues('corolla1519');
          } else if (dt >= 2020) {
            retValues('corolla20m');
          }
          break;
        case 'etios':
          if (dt >= 2015 && dt <= 2019) {
            retValues('etios');
          }
          break;
        case 'fielder':
          if (dt >= 2005 && dt <= 2009) {
            retValues('fielder');
          }
          break;
        case 'hilux':
          if (dt >= 2005 && dt <= 2015) {
            retValues('hilux5a15');
          } else if (dt >= 2016 && dt <= 2022) {
            retValues('hilux1622');
          }
          break;
        case 'prado':
          if (dt >= 2007 && dt <= 2009) {
            retValues('prado');
          }
          break;
        case 'rav4':
          if (dt >= 2002 && dt <= 2004) {
            retValues('rav2a4');
          } else if (dt >= 2005 && dt <= 2012) {
            retValues('rav5a12');
          } else if (dt >= 2013 && dt <= 2019) {
            retValues('rav13a19');
          }
          break;
        case 'sw4':
          if (dt >= 2005 && dt <= 2015) {
            retValues('sw4515');
          } else if (dt >= 2016 && dt <= 2021) {
            retValues('sw41621');
          }
          break;
        case 'yaris':
          if (dt >= 2019 && dt <= 2021) {
            retValues('yars');
          }
          break;
        case 'amarok':
          if (dt >= 2011 && dt <= 2017) {
            retValues('amrk1117');
          } else if (dt >= 2018 && dt <= 2021) {
            retValues('amrk18a21');
          }
          break;
        case 'bora':
          if (dt >= 2000 && dt <= 2002) {
            retValues('bora02');
          } else if (dt >= 2003 && dt <= 2011) {
            retValues('bora311');
          }
          break;
        case 'crossfox':
          if (dt >= 2005 && dt <= 2009) {
            retValues('crossf59');
          } else if (dt == 2010) {
            retValues('crossf10');
          } else if (dt >= 2014 && dt <= 2018) {
            retValues('crossf1418');
          } else if (dt >= 2011 && dt <= 2013) {
            retValues('crossf1113');
          }
          break;
        case 'fox':
          if (dt >= 2004 && dt <= 2009) {
            retValues('crossf59');
          } else if (dt == 2010) {
            retValues('crossf10');
          } else if (dt >= 2014 && dt <= 2020) {
            retValues('crossf1418');
          } else if (dt >= 2011 && dt <= 2013) {
            retValues('crossf1113');
          }
          break;
        case 'fusca':
          if (dt >= 2013 && dt <= 2016) {
            retValues('fuc');
          }
          break;
        case 'gol':
          if (dt >= 1996 && dt <= 1998) {
            retValues('gol96a98');
          } else if (dt >= 1999 && dt <= 2002) {
            retValues('gol99a2');
          } else if (dt >= 2003 && dt <= 2004) {
            retValues('gol3e4');
          } else if (dt >= 2005 &&
              dt <= 2014 &&
              model!.toLowerCase().contains('g4')) {
            retValues('gol3e4');
          } else if (dt >= 2008 &&
              dt <= 2012 &&
              model!.toLowerCase().contains('g5')) {
            retValues('crossf1113');
          } else if (dt >= 2012 &&
              dt <= 2013 &&
              model!.toLowerCase().contains('g6')) {
            retValues('crossf1113');
          } else if (dt >= 2014 &&
              dt <= 2016 &&
              model!.toLowerCase().contains('g6')) {
            retValues('crossf1418');
          } else if (dt >= 2016 &&
              dt <= 2018 &&
              model!.toLowerCase().contains('g7')) {
            retValues('crossf1418');
          } else if (dt >= 2019 &&
              dt <= 2023 &&
              model!.toLowerCase().contains('g8')) {
            retValues('crossf1418');
          }
          break;
        case 'golf':
          if (dt >= 2008 && dt <= 2013) {
            retValues('golf');
          }
          break;
        case 'jetta':
          if (dt >= 2007 && dt <= 2010) {
            retValues('jt710');
          } else if (dt >= 2011 && dt <= 2016) {
            retValues('jt1116');
          } else if (dt >= 2017 && dt <= 2021) {
            retValues('jt1721');
          }
          break;
        case 'kombi':
          if (dt >= 1998 && dt <= 2014) {
            retValues('kombi');
          }
          break;
        case 'new':
          if (dt >= 1999 && dt <= 2003) {
            retValues('new99a3');
          } else if (dt >= 2004 && dt <= 2010) {
            retValues('new4a10');
          }
          break;
        case 'parati':
          if (dt >= 1996 && dt <= 1998) {
            retValues('gol96a98');
          } else if (dt >= 1999 && dt <= 2002) {
            retValues('prt99a2');
          } else if (dt >= 2003 && dt <= 2013) {
            retValues('prt3a13');
          }
          break;
        case 'passat':
          if (dt >= 1997 && dt <= 2004) {
            retValues('pst974');
          } else if (dt == 2005) {
            retValues('pst5');
          }
          break;
        case 'polo':
          if (dt >= 2002 && dt <= 2006) {
            retValues('pol2a6');
          } else if (dt >= 2007 && dt <= 2015) {
            retValues('pol7a15');
          } else if (dt >= 1996 &&
              dt <= 2002 &&
              model!.toLowerCase().contains('classic')) {
            retValues('polcl96a2');
          }
          break;
        case 'santana':
          if (dt >= 1996 && dt <= 2006) {
            retValues('santana');
          }
          break;
        case 'saveiro':
          if (dt >= 1996 && dt <= 2002) {
            retValues('save96a2');
          } else if (dt >= 2003 && dt <= 2004) {
            retValues('save34');
          } else if (model!.toLowerCase().contains('g4')) {
            retValues('saveg4');
          } else if (model!.toLowerCase().contains('g6') &&
              dt >= 2014 &&
              dt <= 2016) {
            retValues('saveg6');
          } else if (model!.toLowerCase().contains('g5') &&
              dt >= 2010 &&
              dt <= 2013) {
            retValues('crossf1113');
          } else if (model!.toLowerCase().contains('g7') &&
              dt >= 2017 &&
              dt <= 2018) {
            retValues('saveg6');
          } else if (model!.toLowerCase().contains('g8') && dt >= 2019) {
            retValues('saveg6');
          }
          break;
        case 'spacefox':
          if (dt >= 2006 && dt <= 2009) {
            retValues('space69');
          } else if (dt == 2010) {
            retValues('space10');
          } else if (dt >= 2011 && dt <= 2013) {
            retValues('space1113');
          } else if (dt >= 2014 && dt <= 2019) {
            retValues('space1419');
          }
          break;
        case 'tiguan':
          if (dt >= 2009 && dt <= 2011) {
            retValues('tiguan911');
          } else if (dt >= 2012 && dt >= 2013) {
            retValues('tiguan1213');
          } else if (dt >= 2014 && dt <= 2017) {
            retValues('tiguan1417');
          }
          break;
        case 'up':
          if (dt >= 2014 && dt <= 2021) {
            retValues('up');
          }
          break;
        case 'voyage':
          if (dt >= 2009 && dt <= 2013) {
            retValues('voy913');
          } else if (dt >= 2014 && dt <= 2020) {
            retValues('voy1420');
          }
          break;
        case 'xc60':
          if (dt >= 2016 && dt <= 2021) {
            retValues('xc');
          }
          break;
        case 'xc90':
          if (dt >= 2016 && dt <= 2021) {
            retValues('xc');
          }
          break;
        case '145':
          if (dt >= 1996 && dt <= 1999) {
            retValues('145');
          }
          break;
        case '155':
          if (dt >= 1995 && dt <= 1999) {
            retValues('145');
          }
          break;
        case '164':
          if (dt >= 1996 && dt <= 1999) {
            retValues('145');
          }
          break;
        case 'spider':
          if (dt >= 1991 && dt <= 1997) {
            retValues('145');
          }
          break;
        case 'sonic':
          if (dt >= 2012 && dt <= 2015) {
            retValues('sonic');
          }
          break;
        case 'equinox':
          if (dt >= 2018) {
            retValues('equi');
          }
          break;
        case 'silverado':
          if (dt == 1997) {
            retValues('silverado97');
          } else if (dt == 1998) {
            retValues('silverado98');
          } else if (dt >= 1993 && dt <= 1995 || dt >= 1999 && dt <= 2001) {
            retValues('silverado93a95_99a1');
          }
          break;
        case 'explorer':
          if (dt >= 1998 && dt <= 2005) {
            retValues('explorer9805');
          } else if (dt >= 1991 && dt <= 1997) {
            retValues('explorer91a97');
          }
          break;
        case 'expedition':
          if (dt == 1998) {
            retValues('expedition98');
          } else if (dt == 1997 || dt == 1999) {
            retValues('expedition97e99');
          }
          break;
        case 'fusion':
          if (dt >= 2006 && dt <= 2008) {
            retValues('fusion6a8');
          } else if (dt == 2009) {
            retValues('fusion9');
          } else if (dt >= 2010 && dt <= 2011) {
            retValues('fusion10e11');
          } else if (dt == 2012) {
            retValues('fusion12');
          } else if (dt >= 2013 && dt <= 2019) {
            retValues('fusiona13a19');
          }
          break;

        case 'captiva':
          if (dt >= 2015 && dt <= 2017) {
            retValues('captiva15a17');
          } else if (dt >= 2008 && dt <= 2014) {
            retValues('captiva8a14');
          }
          break;
        case 'mustang':
          if (dt >= 1994 && dt <= 2000) {
            retValues('mustang94a0');
          } else if (dt >= 2005 && dt <= 2013) {
            retValues('mustang5a13');
          } else if (dt >= 2015) {
            retValues('mustang15m');
          }
          break;
        case '116ia':
          retValues('116iA');
          break;
        case '118ia':
          if (dt == 2010) {
            retValues('118ia10');
          } else if (dt == 2011) {
            retValues('118ia11');
          } else if (dt >= 2012 && dt <= 2015) {
            retValues('118ia12a15');
          }
          break;
        case '120i':
          if (dt >= 2005 && dt <= 2010) {
            retValues('120i5a9');
          }
          break;
        case '120ia':
          if ((dt >= 2005 && dt <= 2011) || dt == 2015 || dt == 2016) {
            retValues('120ia5a11e15e16');
          } else if (dt == 2019) {
            retValues('120ia19');
          } else if (dt == 2012) {
            retValues('120ia12');
          }
          break;
        case '125i':
          if (dt >= 2013 && dt <= 2016) {
            retValues('120ia12');
          } else if (dt == 2019) {
            retValues('125i19');
          }
          break;
        case '130i':
          if (dt >= 2006 && dt <= 2009) {
            retValues('130i');
          }
          break;
        case '130ia':
          if (dt >= 2007 && dt <= 2011) {
            retValues('130i');
          } else if (dt == 2012) {
            retValues('130ia12');
          }
          break;
        case '218i':
          if (dt >= 2020) {
            retValues('218i20m');
          }
          break;
        case '220i':
          if (dt >= 2016 && dt <= 2017) {
            retValues('220i16e17');
          } else if (dt == 2018) {
            retValues('220i18');
          }
          break;
        case '225i':
          if (dt == 2015 || dt == 2016) {
            retValues('225i');
          }
          break;
        case '316i':
          if (dt == 2015 || dt == 2016) {
            retValues('316i1514');
          }
          break;
        case '318i/ia':
          if (dt >= 1995 && dt <= 1998) {
            retValues('318i/ia95a98');
          }
          break;
        case '318ia':
          if (dt >= 2011 && dt <= 2012) {
            retValues('318ia');
          }
          break;
        case '318is/isa':
          if (dt >= 1995 && dt <= 1998) {
            retValues('318is/isa95a98');
          }
          break;
        case '318ti':
          if (dt >= 1995 && dt <= 1998) {
            retValues('318is/isa95a98');
          }
          break;
        case '318ti/tia':
          if (dt >= 1995 && dt <= 1999) {
            retValues('318is/isa95a98');
          }
          break;
        case '320i':
          if (dt >= 2007 && dt <= 2006) {
            retValues('320i7e6');
          }
          break;
        case '320ia':
          if (dt >= 2001 && dt <= 2011) {
            retValues('320ia1a11');
          } else if (dt == 2012) {
            retValues('320ia12');
          } else if (dt == 2013) {
            retValues('320ia13');
          } else if (dt >= 2014 && dt <= 2018) {
            retValues('320ia14a18');
          } else if (dt >= 2019) {
            retValues('320ia19m');
          }
          break;
        case '323ci':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          }
          break;
        case '323cia':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          }
          break;
        case '323i':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt == 1998) {
            retValues('323i');
          }
          break;
        case '323i/ia':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt >= 1997 && dt <= 1998) {
            retValues('323i');
          }
          break;
        case '323ia':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt == 2001 || dt == 2002) {
            retValues('320ia01');
          } else if (dt == 1998) {
            retValues('323i');
          }
          break;
        case '323ti':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt >= 1997 && dt <= 1998) {
            retValues('323i');
          }
          break;
        case '325i':
          if (dt == 2001) {
            retValues('325i1');
          } else if (dt >= 1996 && dt <= 1995) {
            retValues('323i');
          }
          break;
        case '325i/ia':
          if (dt >= 1995 && dt <= 1996) {
            retValues('323i');
          }
          break;
        case '325ia':
          if (dt == 2012) {
            retValues('325ia12');
          } else if (dt == 2007 || dt == 2011) {
            retValues('325ia7a11');
          } else if (dt == 2001 || dt == 2006) {
            retValues('325ia1a6');
          } else if (dt == 1995 || dt == 1996) {
            retValues('325ia9596');
          } else if (model!.toLowerCase().contains('touring')) {
            retValues('325iaTour');
          }
          break;
        case '328i':
          if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt >= 1996 && dt <= 1998) {
            retValues('323i');
          }
          break;
        case '328i/ia':
          if (dt >= 1996 && dt <= 1998) {
            retValues('323i');
          } else if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          }
          break;
        case '328ia':
          if (dt >= 2013 && dt <= 2018) {
            retValues('328ia13a18');
          } else if (dt == 2012) {
            retValues('325ia12');
          } else if (dt >= 1999 && dt <= 2000) {
            retValues('323ci');
          } else if (dt >= 1996 && dt <= 1998) {
            retValues('325ia9596');
          }
          break;
        case '330ci':
          if (dt >= 2001 && dt <= 2004) {
            retValues('330ci1a4');
          } else if (dt == 2000) {
            retValues('323ci');
          }
          break;
        case '330cia':
          if (dt >= 2001 && dt <= 2006) {
            retValues('330cia1a6');
          }
          break;
        case '330e':
          if (dt >= 2020) {
            retValues('330e');
          }
          break;
        case '330i':
          if (dt >= 2019) {
            retValues('330e');
          } else if (dt >= 2001 && dt >= 2003) {
            retValues('cia1a6');
          }
          break;
        case '330ia':
          if (dt == 2007) {
            retValues('330ia07');
          } else if (dt >= 2001 && dt >= 2006) {
            retValues('330cia1a6');
          }
          break;
        case '335ia':
          if (dt >= 2007 && dt >= 2011) {
            retValues('330ia07');
          } else if (dt == 2012) {
            retValues('335ia');
          } else if (dt >= 2013 && dt >= 2015) {
            retValues('335ia13a15');
          }
          break;
        case '420i':
          if (dt >= 2015) {
            retValues('420i15m');
          }
          break;
        case '428i':
          if (dt >= 2014 && dt >= 2018) {
            retValues('420i15m');
          }
          break;
        case '430i':
          if (dt >= 2017) {
            retValues('420i15m');
          }
          break;
        case '435ia':
          if (dt >= 2014 && dt >= 2015) {
            retValues('420i15m');
          }
          break;
        case '525i/ia':
          if (dt >= 2001 && dt >= 2003) {
            retValues('525i/ia1a3');
          } else if (dt == 1995) {
            retValues('525i/ia95');
          } else if (dt == 1996) {
            retValues('525i/ia96');
          }
          break;
        case '528i/ia':
          if (dt == 2000) {
            retValues('528i/ia00');
          } else if (dt >= 1996 && dt >= 1999) {
            retValues('525i/ia96');
          }
          break;
        case '528ia':
          if (dt >= 2013 && dt >= 2016) {
            retValues('528ia13a16');
          } else if (dt == 2001) {
            retValues('528ia01');
          } else if (dt == 2000) {
            retValues('528i/ia00');
          } else if (dt >= 1996 && dt >= 1999) {
            retValues('525i/ia96');
          }
          break;
        case '530e':
          if (dt >= 2019) {
            retValues('530e19m');
          }
          break;
        case '530i':
          if (dt >= 2017 && dt >= 2018) {
            retValues('530i1718');
          } else if (dt == 2019) {
            retValues('530e19m');
          } else if (dt == 2008) {
            retValues('530i8');
          }
          break;
        case '530i/ia':
          if (dt >= 2007 && dt >= 2009) {
            retValues('530i/ia7a9');
          } else if (dt == 2010) {
            retValues('530i/ia10');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          } else if (dt >= 2001 && dt >= 2006) {
            retValues('530i/ia1a6');
          } else if (dt == 1996) {
            retValues('530i/ia96');
          }
          break;
        case '535ia':
          if (dt == 2010) {
            retValues('535ia10');
          } else if (dt >= 2011 && dt >= 2016) {
            retValues('535ia11a16');
          }
          break;
        case '540i':
          if (dt >= 1996 && dt >= 2000) {
            retValues('525i/ia96');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          } else if (dt >= 2019) {
            retValues('530e19m');
          } else if (dt >= 2017 || dt >= 2018) {
            retValues('530i1718');
          }
          break;
        case '540i/ia':
          if (dt >= 1996 && dt >= 2000) {
            retValues('525i/ia96');
          } else if (dt == 2001) {
            retValues('528i/ia00');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          }
          break;
        case '540ia':
          if (dt >= 1996 && dt >= 2000) {
            retValues('530i/ia96');
          } else if (dt >= 2001 && dt >= 2003) {
            retValues('528i/ia00');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          }
          break;
        case '540ita':
          if (dt >= 1996 && dt >= 2000) {
            retValues('530i/ia96');
          } else if (dt == 2001) {
            retValues('528i/ia00');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          }
          break;
        case '545ia':
          if (dt >= 2004 && dt >= 2006) {
            retValues('528i/ia00');
          }
          break;
        case '550ia':
          if (dt >= 1996 && dt >= 2000) {
            retValues('530i/ia96');
          } else if (dt == 2001) {
            retValues('528i/ia00');
          } else if (dt == 1995) {
            retValues('530i/ia95');
          } else if (dt == 2011 && dt == 2012) {
            retValues('530i1718');
          } else if (dt == 2010) {
            retValues('535ia10');
          } else if (dt == 2007 && dt == 2009) {
            retValues('530i8');
          } else if (dt == 2006) {
            retValues('528i/ia00');
          }
          break;
        case '640i':
          if (dt >= 2013 && dt >= 2015) {
            retValues('530i1718');
          }
          break;
        case '650i':
          if (dt >= 2012 && dt >= 2016) {
            retValues('650i');
          }
          break;
        case '650ia':
          if (dt >= 2007 && dt >= 2010) {
            retValues('650ia7a10');
          } else if (dt == 2012) {
            retValues('650i');
          }
          break;
        case '740i':
          if (dt >= 1995 && dt >= 1997) {
            retValues('530i/ia95');
          }
          break;
      }
    }
  }

  // "valueDataKeyChip": "" ,
  // "laminaTextDica": "",
  // "laminasKeys": "",
  // "laminaPalhetas":"",
  // "transponderClone": "",
  // "transponderNomenclatura": "",
  // "telecomandoBatery": "",
  // "telecomandoImage": "",
  // "transponderImage": "",
  // "telecomandoFrequency": "",
  // "telecomandoProcedure": "",
  // "maquinasCodificadoras": "",
  // "videoLink": ""

  retValues(String modelValue) {
    try {
      valueDataKeyChip = itemsFipeJson[0][modelValue]['valueDataKeyChip'] ?? '';
      keyLaminaTypeGold = itemsFipeJson[0][modelValue]['keyLaminaGold'] ?? '';
      laminaTextDica = itemsFipeJson[0][modelValue]['laminaTextDica'] ?? '';
      laminasKeys = itemsFipeJson[0][modelValue]['laminasKeys'] ?? '';
      laminaPalhetas = itemsFipeJson[0][modelValue]['laminaPalhetas'] ?? {};
      laminaPinCode = itemsFipeJson[0][modelValue]['laminaPinCode'] ?? '';
      transponderClone = itemsFipeJson[0][modelValue]['transponderClone'] ?? '';
      transponderCodigo =
          itemsFipeJson[0][modelValue]['transponderCodigo'] ?? '';
      transponderNomenclatura =
          itemsFipeJson[0][modelValue]['transponderNomenclatura'] ?? '';
      telecomandoBatery =
          itemsFipeJson[0][modelValue]['telecomandoBatery'] ?? '';
      telecomandoImage = itemsFipeJson[0][modelValue]['telecomandoImage'] ?? '';
      transponderImage = itemsFipeJson[0][modelValue]['transponderImage'] ?? '';
      telecomandoBrands =
          itemsFipeJson[0][modelValue]['telecomandoBrands'] ?? '';
      telecomandoFrequency =
          itemsFipeJson[0][modelValue]['telecomandoFrequency'] ?? '';
      telecomandoProcedure =
          itemsFipeJson[0][modelValue]['telecomandoProcedure'] ?? '';
      maquinasCodificadoras =
          itemsFipeJson[0][modelValue]['maquinasCodificadoras'] ?? '';
      videoLink = itemsFipeJson[0][modelValue]['videoLink'] ?? '';
    } catch (_) {}
  }
}
