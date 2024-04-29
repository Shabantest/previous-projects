import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/uitils/icons.dart';

import '../../view_model/uitils/images.dart';
class AccountOptionsModel{
  String? name;
  String? icon;
  Icon?  nextArrow;
  AccountOptionsModel({this.name,this.icon,this.nextArrow});
}
List<AccountOptionsModel> accountOptionsList=[
  AccountOptionsModel(
    name: LocaleKeys.Orders,
    icon: AppImages.a_order,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name:  LocaleKeys.MyDetails,
      icon: AppImages.a_delivery,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name:LocaleKeys.DeliveryAddress,
      icon: AppImages.location,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name: LocaleKeys.PaymentMethods,
      icon: AppImages.paymenth_methods,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name:  LocaleKeys.PromoCord,
      icon: AppImages.a_promocode,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name: LocaleKeys.Notification,
      icon: AppImages.a_noitification,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name: LocaleKeys.Help,
      icon: AppImages.a_help,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name: LocaleKeys.About,
      icon: AppImages.a_about,
    nextArrow:AppIcons.arrow_back,
  ),
  AccountOptionsModel(
    name: LocaleKeys.Language,
      icon: AppImages.language,
    nextArrow:AppIcons.arrow_back,
  ),

];