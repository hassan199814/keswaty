
import 'package:flutter/material.dart';
import 'package:keswaty/main.dart';

class Language extends ChangeNotifier{
  String _lang = language;

  getLanguage() {
    return _lang;
  }

  setLanguage(String lang){
    _lang = lang;
    notifyListeners();
  }

  String tGeneralsetting(){
    if (getLanguage() == 'AR') {
      return "الاعدادات العامة";
    } else if (getLanguage() == 'EN') {
      return "General Setting";
    }else {
      return "General Setting";
    }
  }
  String tLanguage(){
    if (getLanguage() == 'AR') {
      return "AR";
    } else if (getLanguage() == 'EN') {
      return "EN";
    }else {
      return "EN";
    }
  }
  String tLanguageSwitch(){
    if (getLanguage() == 'AR') {
      return "تبديل اللغة";
    } else if (getLanguage() == 'EN') {
      return "Language Switch";
    }else {
      return "Language Switch";
    }
  }
  String tGaneralSetting(){
    if (getLanguage() == 'AR') {
      return "الاعدادات العامة";
    } else if (getLanguage() == 'EN') {
      return "General Setting";
    }else {
      return "General Setting";
    }
  }
  String tLanguagelanguage(){
    if (getLanguage() == 'AR') {
      return "اللغة";
    } else if (getLanguage() == 'EN') {
      return "language";
    }else {
      return "language";
    }
  }
  String tsituation(){
    if (getLanguage() == 'AR') {
      return "الوضع";
    } else if (getLanguage() == 'EN') {
      return "situation";
    }else {
      return "situation";
    }
  }
  String taboutapp(){
    if (getLanguage() == 'AR') {
      return "عن التطبيق";
    } else if (getLanguage() == 'EN') {
      return "about app";
    }else {
      return "about app";
    }
  }
  String helptitle(){
    if (getLanguage() == 'AR') {
      return "مرحبا بك في صفحة المساعدة كيف يمكننا مساعدتك؟";
    } else if (getLanguage() == 'EN') {
      return "Welcome to the help page. How can you help us?";
    }else {
      return "Welcome to the help page. How can you help us?";
    }
  }
  String help(){
    if (getLanguage() == 'AR') {
      return "المساعدة";
    } else if (getLanguage() == 'EN') {
      return "Help";
    }else {
      return "Help";
    }
  }
  String tEditpersonaldata(){
    if (getLanguage() == 'AR') {
      return "اعدادات الحساب";
    } else if (getLanguage() == 'EN') {
      return "Account settings";
    }else {
      return "Account settings";
    }
  }
  String Account(){
    if (getLanguage() == 'AR') {
      return "الحساب";
    } else if (getLanguage() == 'EN') {
      return "Account";
    }else {
      return "Account";
    }
  }

  String tname(){
    if (getLanguage() == 'AR') {
      return "الاسم";
    } else if (getLanguage() == 'EN') {
      return "Name";
    }else {
      return "Name";
    }
  }
  String tphone(){
    if (getLanguage() == 'AR') {
      return "الهاتف";
    } else if (getLanguage() == 'EN') {
      return "Phone";
    }else {
      return "Phone";
    }
  }
  String tpassword(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Password";
    }else {
      return "Password";
    }
  }
  String temail(){
    if (getLanguage() == 'AR') {
      return "البريد الالكتروني";
    } else if (getLanguage() == 'EN') {
      return "Email";
    }else {
      return "Email";
    }
  }
  String tanswer(){
    if (getLanguage() == 'AR') {
      return "الإجابة";
    } else if (getLanguage() == 'EN') {
      return "Answer";
    }else {
      return "Answer";
    }
  }
  String tConfirmPass(){
    if (getLanguage() == 'AR') {
      return "تأكيد كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Confirm password";
    }else {
      return "Confirm password";
    }
  }
  String tquestion(){
    if (getLanguage() == 'AR') {
      return "السؤال";
    } else if (getLanguage() == 'EN') {
      return "Question";
    }else {
      return "Question";
    }
  }
  String tNewPass(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور الجديدة";
    } else if (getLanguage() == 'EN') {
      return "New password";
    }else {
      return "New password";
    }
  }
  String tOldPass(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور القديمة";
    } else if (getLanguage() == 'EN') {
      return "Old password";
    }else {
      return "Old password";
    }
  }
  String taddress(){
    if (getLanguage() == 'AR') {
      return "العنوان";
    } else if (getLanguage() == 'EN') {
      return "Address";
    }else {
      return "Address";
    }
  }
  String tlogout(){
    if (getLanguage() == 'AR') {
      return "تسجيل خروج";
    } else if (getLanguage() == 'EN') {
      return "Log out";
    }else {
      return "Log out";
    }
  }
  String tlogin(){
    if (getLanguage() == 'AR') {
      return "تسجيل دخول";
    } else if (getLanguage() == 'EN') {
      return "Login";
    }else {
      return "Login";
    }
  }
  String tAlertTitleLogout(){
    if (getLanguage() == 'AR') {
      return "هل تريد تسجيل الخروج ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want to log out ?";
    }else {
      return "Do you want to log out ?";
    }
  }
  String tAlertDescrLogout(){
    if (getLanguage() == 'AR') {
      return "تم تسجيل الخروج بنجاح. إذا كنت تريد إجراء أي عملية ، فيجب عليك تسجيل الدخول";
    } else if (getLanguage() == 'EN') {
      return "Logout completed successfully. If you want to perform any operation, you must log in";
    }else {
      return "Logout completed successfully. If you want to perform any operation, you must log in";
    }
  }
  String tAlertAlreadyLogout(){
    if (getLanguage() == 'AR') {
      return "تم تسجيل الخروج بالفعل";
    } else if (getLanguage() == 'EN') {
      return "Already logged out";
    }else {
      return "Already logged out";
    }
  }
  String tAlertSuccess(){
    if (getLanguage() == 'AR') {
      return "تم بنجاح";
    } else if (getLanguage() == 'EN') {
      return "Success";
    }else {
      return "Success";
    }
  }
  String tAlertinfor(){
    if (getLanguage() == 'AR') {
      return "يجب تسجيل الدخول اولا";
    } else if (getLanguage() == 'EN') {
      return "you have to login first";
    }else {
      return "you have to login first";
    }
  }
  String tAlertSoon(){
    if (getLanguage() == 'AR') {
      return "قريباً";
    } else if (getLanguage() == 'EN') {
      return "Soon";
    }else {
      return "Soon";
    }
  }
    String donthaveaccount(){
    if (getLanguage() == 'AR') {
      return " هل تمتلك حساب ؟";
    } else if (getLanguage() == 'EN') {
      return "Don't have an account ? ";
    }else {
      return "Don't have an account ? ";
    }
  }
    String keswaty(){
    if (getLanguage() == 'AR') {
      return "كسوتي";
    } else if (getLanguage() == 'EN') {
      return "Keswaty";
    }else {
      return "Keswaty";
    }
  }
    String resetpass(){
    if (getLanguage() == 'AR') {
      return "استعادة كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Reset Password";
    }else {
      return "Reset Password";
    }
  }
    String tValidateAnswer(){
    if (getLanguage() == 'AR') {
      return "التحقق من سؤال الأمان";
    } else if (getLanguage() == 'EN') {
      return "Validating secure question";
    }else {
      return "Validating secure question";
    }
  }
    String tChangePass(){
    if (getLanguage() == 'AR') {
      return "تغيير كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Change Password";
    }else {
      return "Change Password";
    }
  }
    String resetpassdesc(){
    if (getLanguage() == 'AR') {
      return "يرجى ادخال بريدك الالكتروني";
    } else if (getLanguage() == 'EN') {
      return "Pleas enter your email";
    }else {
      return "Pleas enter your email";
    }
  }
    String tValidateHelp(){
    if (getLanguage() == 'AR') {
      return "يرجى إدخال إجابة السؤال الذي قمت بإضافتة عند إنشاء الحساب";
    } else if (getLanguage() == 'EN') {
      return "Please enter question's answer you added when creating the account";
    }else {
      return "Please enter question's answer you added when creating the account";
    }
  }
    String signup(){
    if (getLanguage() == 'AR') {
      return " تسجيل";
    } else if (getLanguage() == 'EN') {
      return "Sign up ";
    }else {
      return "Sign up ";
    }
  }
  String tAlertUnCompleted(){
    if (getLanguage() == 'AR') {
      return "سلة التبرع فارغة !، يرجى إضافة مواد للتبرع";
    } else if (getLanguage() == 'EN') {
      return "Donation basket is null !, Please add donation materials";
    }else {
      return "Donation basket is null !, Please add donation materials";
    }
  }
  String imagereq(){
    if (getLanguage() == 'AR') {
      return "يرجى اضافة صورة واحدة على الاقل";
    } else if (getLanguage() == 'EN') {
      return "Please add at least one photo";
    }else {
      return "Please add at least one photo";
    }
  }
  String passnotmatch(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور غير متطابقة";
    } else if (getLanguage() == 'EN') {
      return "Password not match";
    }else {
      return "Password not match";
    }
  }
  String twronganswer(){
    if (getLanguage() == 'AR') {
      return "إجابة سؤال الأمان غير صحيحة ، في حال لم تكن تتذكر الإجابة يرجى التواصل معنا";
    } else if (getLanguage() == 'EN') {
      return "Answer is wrong, If you don't remember it please contact with us";
    }else {
      return "Answer is wrong, If you don't remember it please contact with us";
    }
  }
  String wrongpass(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور خاطئة او البريد الالكتروني غير صحيح";
    } else if (getLanguage() == 'EN') {
      return "Password is wrong or Email is wrong!";
    }else {
      return "Password is wrong or Email is wrong!";
    }
  }

  String locationpermission(){
    if (getLanguage() == 'AR') {
      return "      يجمع هذا التطبيق بيانات المواقع لتمكين موقع المتبرع وموقع نقطة التبرع حتى عندما يكون التطبيق مغلقًا أو غير مستخدم.";
    } else if (getLanguage() == 'EN') {
      return "this app collects locations data to enable Donater Location and Donation Point Location even when the app is closed or not in use !";
    }else {
      return "this app collects locations data to enable Donater Location and Donation Point Location even when the app is closed or not in use !";
    }
  }
  String locationpermission2(){
    if (getLanguage() == 'AR') {
      return "this app collects locations data to enable Donater Location and Donation Point Location even when the app is closed or not in use !";
    } else if (getLanguage() == 'EN') {
      return "this app collects locations data to enable Donater Location and Donation Point Location even when the app is closed or not in use !";
    }else {
      return "this app collects locations data to enable Donater Location and Donation Point Location even when the app is closed or not in use !";
    }
  }
  String tpasschanged(){
    if (getLanguage() == 'AR') {
      return "تم تغيير كلمة المرور بنجاح";
    } else if (getLanguage() == 'EN') {
      return "Password changed successfully";
    }else {
      return "Password changed successfully";
    }
  }
  String wrongemail(){
    if (getLanguage() == 'AR') {
      return "البريد الالكتروني غير صحيح";
    } else if (getLanguage() == 'EN') {
      return "Email is wrong";
    }else {
      return "Email is Wrong";
    }
  }
  String noemail(){
    if (getLanguage() == 'AR') {
      return "لا يوجد إيميل متطابق مع الإيميل المدخل، يرجى التأكد من البيانات أو إضافة حساب جديد";
    } else if (getLanguage() == 'EN') {
      return "There is no email match entered email, Please make sure or sign up new account";
    }else {
      return "There is no email match entered email, Please make sure or sign up new account";
    }
  }
  String tInformCompleted(){
    if (getLanguage() == 'AR') {
      return "تم تأكيد التبرع ، سيتم إرسال مندوب لاستلام التبرع";
    } else if (getLanguage() == 'EN') {
      return "Donation confirmed, a representative will be sent to receive the donation";
    }else {
      return "Donation confirmed, a representative will be sent to receive the donation";
    }
  }
  String Doyouwanttoconfirmyourdonationothibasket(){
    if (getLanguage() == 'AR') {
      return "هل تريد تأكيد التبرع لهذه السلة ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want to confirm your donation to this basket?";
    }else {
      return "Do you want to confirm your donation to this basket?";
    }
  }
  String Doyouwanttoconfirmdbasket(){
    if (getLanguage() == 'AR') {
      return "هل تريد تاكيد تسليم هذه السله ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want to confirm delivery of this basket?";
    }else {
      return "Do you want to confirm delivery of this basket?";
    }
  }
  String Basketdeliveryconfirmed(){
    if (getLanguage() == 'AR') {
      return "تم تأكيد تسليم السلة";
    } else if (getLanguage() == 'EN') {
      return "Basket delivery confirmed";
    }else {
      return "Basket delivery confirmed";
    }
  }
  String tAlertWrong(){
    if (getLanguage() == 'AR') {
      return "يجب عليك تسجيل الدخول";
    } else if (getLanguage() == 'EN') {
      return "You must login";
    }else {
      return "You must login";
    }
  }
  String tAlertWrongdelete(){
    if (getLanguage() == 'AR') {
      return "هل تريد الحذف ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want delete ?";
    }else {
      return "Do you want delete ?";
    }
  }
  String tAlertAlreadylogin(){
    if (getLanguage() == 'AR') {
      return "تم تسجيل الدخول بالفعل";
    } else if (getLanguage() == 'EN') {
      return "Already logged in";
    }else {
      return "Already logged in";
    }
  }
  String tDeleteAccount(){
    if (getLanguage() == 'AR') {
      return "حذف الحساب";
    } else if (getLanguage() == 'EN') {
      return "Delete Account";
    }else {
      return "Delete Account";
    }
  }
  String tyouwillnotbe(){
    if (getLanguage() == 'AR') {
      return "لن تكون";
    } else if (getLanguage() == 'EN') {
      return "you will not be";
    }else {
      return "you will not be";
    }
  }
  String tyouwillnotbe2(){
    if (getLanguage() == 'AR') {
      return "قادر على استعادة حسابك إذا قمت بحذفه.";
    } else if (getLanguage() == 'EN') {
      return "able to recover your account if you delete it.";
    }else {
      return "able to recover your account if you delete it.";
    }
  }
  String tNousers(){
    if (getLanguage() == 'AR') {
      return "لا يوجد مستخدم";
    } else if (getLanguage() == 'EN') {
      return "No users !!";
    }else {
      return "No users !!";
    }
  }
  String tMyPost(){
    if (getLanguage() == 'AR') {
      return "منشوراتي";
    } else if (getLanguage() == 'EN') {
      return "My Post";
    }else {
      return "My Post";
    }
  }
  String tMyaccount(){
    if (getLanguage() == 'AR') {
      return "حسابي";
    } else if (getLanguage() == 'EN') {
      return "My account";
    }else {
      return "My account";
    }
  }
  String tSettings(){
    if (getLanguage() == 'AR') {
      return "الاعدادات";
    } else if (getLanguage() == 'EN') {
      return "Settings";
    }else {
      return "Settings";
    }
  }
  String tMycomments(){
    if (getLanguage() == 'AR') {
      return "تعليقاتي";
    } else if (getLanguage() == 'EN') {
      return "My Comments";
    }else {
      return "My Comments";
    }
  }
  String tEditProfiledesc(){
    if (getLanguage() == 'AR') {
      return "هل تريد الاستمرار في تعديل بياناتك الشخصية ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want to continue Edit your information?";
    }else {
      return "Do you want to continue Edit your information?";
    }
  }
  String taccounthasbeenmodified(){
    if (getLanguage() == 'AR') {
      return "تم تعديل البيانات بنجاح. يجب عليك تسجيل الخروج لتحديث البيانات";
    } else if (getLanguage() == 'EN') {
      return "The data has been modified successfully, You must log out to update the data";
    }else {
      return "The data has been modified successfully, You must log out to update the data";
    }
  }
  String tEvaluation(){
    if (getLanguage() == 'AR') {
      return "التقييم";
    } else if (getLanguage() == 'EN') {
      return "Evaluation";
    }else {
      return "Evaluation";
    }
  }
  String tFeedback(){
    if (getLanguage() == 'AR') {
      return "الدعم الفني";
    } else if (getLanguage() == 'EN') {
      return "Feedback";
    }else {
      return "Feedback";
    }
  }
  String tVersion(){
    if (getLanguage() == 'AR') {
      return "الاصدار :";
    } else if (getLanguage() == 'EN') {
      return "Version :";
    }else {
      return "Version :";
    }
  }
  String trights(){
    if (getLanguage() == 'AR') {
      return "جميع الحقوق محفوظة لدى شركة روّق للتسويق والبرمجيات @2024";
    } else if (getLanguage() == 'EN') {
      return "All rights reserved to RUQ Marketing and Software Company @2024";
    }else {
      return "All rights reserved to RUQ Marketing and Software Company @2024";
    }
  }
  String tFeedbackPage(){
    if (getLanguage() == 'AR') {
      return "لديك اقتراحات او ملاحظات بخصوص\n تطبيق كسوتي  يسعدنا سماع اقتراحاتكم وآرائكم ";
    } else if (getLanguage() == 'EN') {
      return "You have suggestions or comments regarding\n the Kiswati application. We are happy to hear your\n suggestions and opinions";
    }else {
      return "You have suggestions or comments regarding\n the Kiswati application. We are happy to hear your\n suggestions and opinions";
    }
  }
  String tPleaseEnterNots(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال الملاحظة";
    } else if (getLanguage() == 'EN') {
      return "Please Enter  Notes";
    }else {
      return "Please Enter  Notes";
    }
  }
  String tWriteYourNotehere(){
    if (getLanguage() == 'AR') {
      return "اكتب ملاحظاتك هنا. . .";
    } else if (getLanguage() == 'EN') {
      return "Write your notes here . . .";
    }else {
      return "Write your notes here . . .";
    }
  }
  String tWriteYourdescrfound(){
    if (getLanguage() == 'AR') {
      return "اكتب كل ما يتعلق بالعنصر لاثبات الملكية . . . ";
    } else if (getLanguage() == 'EN') {
      return "Write down everything about the item to verify ownership . . .";
    }else {
      return "Write down everything about the item to verify ownership . . .";
    }
  }
  String tWriteYourdescrlost(){
    if (getLanguage() == 'AR') {
      return "اكتب كل م يتعلق بالمفقود من فضلك . . . ";
    } else if (getLanguage() == 'EN') {
      return "Write down everything about the lost . . .";
    }else {
      return "Write down everything about the lost . . .";
    }
  }
  String tNotes(){
    if (getLanguage() == 'AR') {
      return "الملاحظات";
    } else if (getLanguage() == 'EN') {
      return "Notes";
    }else {
      return "Notes";
    }
  }
  String tAlertNote(){
    if (getLanguage() == 'AR') {
      return "تمت إضافة الملاحظة الخاص بك بنجاح";
    } else if (getLanguage() == 'EN') {
      return "Your Nots has been added successfully";
    }else {
      return "Your Nots has been added successfully";
    }
  }
  String tadd(){
    if (getLanguage() == 'AR') {
      return "إضافة";
    } else if (getLanguage() == 'EN') {
      return "Add";
    }else {
      return "Add";
    }
  }
  String Next(){
    if (getLanguage() == 'AR') {
      return "التالي";
    } else if (getLanguage() == 'EN') {
      return "Next";
    }else {
      return "Next";
    }
  }
  String Reset(){
    if (getLanguage() == 'AR') {
      return "استعادة";
    } else if (getLanguage() == 'EN') {
      return "Reset";
    }else {
      return "Reset";
    }
  }
  String tChange(){
    if (getLanguage() == 'AR') {
      return "تغيير";
    } else if (getLanguage() == 'EN') {
      return "Change";
    }else {
      return "Change";
    }
  }
  String tHome(){
    if (getLanguage() == 'AR') {
      return "الرئيسية";
    } else if (getLanguage() == 'EN') {
      return "Home";
    }else {
      return "Home";
    }
  }
  String tProfile(){
    if (getLanguage() == 'AR') {
      return "الملف الشخصي";
    } else if (getLanguage() == 'EN') {
      return "Profile";
    }else {
      return "Profile";
    }
  }
  String tNotifications(){
    if (getLanguage() == 'AR') {
      return "الاشعارات";
    } else if (getLanguage() == 'EN') {
      return "Notifications";
    }else {
      return "Notifications";
    }
  }
  String tFilter(){
    if (getLanguage() == 'AR') {
      return "تصفيه";
    } else if (getLanguage() == 'EN') {
      return "Filter";
    }else {
      return "Filter";
    }
  }
  String tAll(){
    if (getLanguage() == 'AR') {
      return "الكل";
    } else if (getLanguage() == 'EN') {
      return "All";
    }else {
      return "All";
    }
  }
  String tCars(){
    if (getLanguage() == 'AR') {
      return "سيارات";
    } else if (getLanguage() == 'EN') {
      return "Care";
    }else {
      return "Care";
    }
  }
  String tlost(){
    if (getLanguage() == 'AR') {
      return "مفقودات";
    } else if (getLanguage() == 'EN') {
      return "Losts";
    }else {
      return "Losts";
    }
  }
  String tfound(){
    if (getLanguage() == 'AR') {
      return "موجودات";
    } else if (getLanguage() == 'EN') {
      return "Founds";
    }else {
      return "Founds";
    }
  }
  String tphones(){
    if (getLanguage() == 'AR') {
      return "تلفونات";
    } else if (getLanguage() == 'EN') {
      return "Phones";
    }else {
      return "Phones";
    }
  }
  String tCards(){
    if (getLanguage() == 'AR') {
      return "بطايق";
    } else if (getLanguage() == 'EN') {
      return "Cards";
    }else {
      return "Cards";
    }
  }
  String tWatches(){
    if (getLanguage() == 'AR') {
      return "ساعات";
    } else if (getLanguage() == 'EN') {
      return "Watches";
    }else {
      return "Watches";
    }
  }
  String tBags(){
    if (getLanguage() == 'AR') {
      return "حقائب";
    } else if (getLanguage() == 'EN') {
      return "Bags";
    }else {
      return "Bags";
    }
  }
  String tnoimage(){
    if (getLanguage() == 'AR') {
      return "لا توجد صورة";
    } else if (getLanguage() == 'EN') {
      return "no image";
    }else {
      return "no image";
    }
  }
  String tUpdate(){
    if (getLanguage() == 'AR') {
      return "تعديل";
    } else if (getLanguage() == 'EN') {
      return "Update";
    }else {
      return "Update";
    }
  }
  String tAlertTitleDelete(){
    if (getLanguage() == 'AR') {
      return "هل تريد الحذف ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you want to delete?";
    }else {
      return "Do you want to delete?";
    }
  }
  String tAlertDleteDone(){
    if (getLanguage() == 'AR') {
      return "تم الحذف";
    } else if (getLanguage() == 'EN') {
      return "Delete done";
    }else {
      return "Delete done";
    }
  }
  String tbtnYse(){
    if (getLanguage() == 'AR') {
      return "نعم";
    } else if (getLanguage() == 'EN') {
      return "Ok";
    }else {
      return "Ok";
    }
  }
  String cancel(){
    if (getLanguage() == 'AR') {
      return "رفض ";
    } else if (getLanguage() == 'EN') {
      return "Cancel";
    }else {
      return "Cancel";
    }
  }
  String agree(){
    if (getLanguage() == 'AR') {
      return "تأكيد وموافقة";
    } else if (getLanguage() == 'EN') {
      return "Agree";
    }else {
      return "Agree";
    }
  }
  String tconus(){
    if (getLanguage() == 'AR') {
      return "تواصل معنا";
    } else if (getLanguage() == 'EN') {
      return "Contact us";
    }else {
      return "Contact us";
    }
  }
  String tbtnOk(){
    if (getLanguage() == 'AR') {
      return "موافق";
    } else if (getLanguage() == 'EN') {
      return "Ok";
    }else {
      return "Ok";
    }
  }
  String tbtnGoLogin(){
    if (getLanguage() == 'AR') {
      return "تسجيل الدخول";
    } else if (getLanguage() == 'EN') {
      return "login";
    }else {
      return "login";
    }
  }
  String tbtnCancel(){
    if (getLanguage() == 'AR') {
      return "الغاء";
    } else if (getLanguage() == 'EN') {
      return "Cancel";
    }else {
      return "Cancel";
    }
  }
  String tClosePost(){
    if (getLanguage() == 'AR') {
      return "ايقاف المنشور";
    } else if (getLanguage() == 'EN') {
      return "Close Post";
    }else {
      return "Close Post";
    }
  }
  String tOpenPost(){
    if (getLanguage() == 'AR') {
      return "فتح المنشور";
    } else if (getLanguage() == 'EN') {
      return "Open Post";
    }else {
      return "Open Post";
    }
  }
  String tClosePostDescr(){
    if (getLanguage() == 'AR') {
      return "تم تغيير حالة المنشور لإغلاق بنجاح! يمكنك فتح منشور من صفحة ملفك الشخصي ";
    } else if (getLanguage() == 'EN') {
      return "Post state changed to Close successfully ! You can open post from your Profile Pag";
    }else {
      return "Post state changed to Close successfully ! You can open post from your Profile Pag";
    }
  }
  String tOpenPostDescr(){
    if (getLanguage() == 'AR') {
      return "تم تغيير حالة المنشور إلى مفتوح بنجاح! سيظهر المنشور في الصفحة الرئيسية العامة";
    } else if (getLanguage() == 'EN') {
      return "Post state changed to Open successfully ! Post will show in Public Home Page  ";
    }else {
      return "Post state changed to Open successfully ! Post will show in Public Home Page  ";
    }
  }
  String tsend(){
    if (getLanguage() == 'AR') {
      return "ارسال";
    } else if (getLanguage() == 'EN') {
      return "send";
    }else {
      return "send";
    }
  }
  String tPosttype(){
    if (getLanguage() == 'AR') {
      return "نوع البلاغ : ";
    } else if (getLanguage() == 'EN') {
      return "Post type :";
    }else {
      return "Post type :";
    }
  }
  String tItemtype(){
    if (getLanguage() == 'AR') {
      return "نوع العنصر : ";
    } else if (getLanguage() == 'EN') {
      return "Item type :";
    }else {
      return "Item type :";
    }
  }
  String tTitle(){
    if (getLanguage() == 'AR') {
      return "اسم العنصر :";
    } else if (getLanguage() == 'EN') {
      return "Title :";
    }else {
      return "Title :";
    }
  }
  String tadress(){
    if (getLanguage() == 'AR') {
      return "العنوان : ";
    } else if (getLanguage() == 'EN') {
      return "Address :";
    }else {
      return "Address :";
    }
  }
  String tnoOneCanSeeit(){
    if (getLanguage() == 'AR') {
      return "لا أحد يستطيع رؤية الردود ، فقط صاحب المنشور في ملفه الشخصي";
    } else if (getLanguage() == 'EN') {
      return "No one can see the responses, only the owner of the post on his profile";
    }else {
      return "No one can see the responses, only the owner of the post on his profile";
    }
  }
  String topen(){
    if (getLanguage() == 'AR') {
      return "مفتوح";
    } else if (getLanguage() == 'EN') {
      return "Open";
    }else {
      return "Open";
    }
  }
  String tClosed(){
    if (getLanguage() == 'AR') {
      return "مغلق";
    } else if (getLanguage() == 'EN') {
      return "Closed";
    }else {
      return "Closed";
    }
  }
  String tSerach(){
    if (getLanguage() == 'AR') {
      return "بحث";
    } else if (getLanguage() == 'EN') {
      return "Serach";
    }else {
      return "Serach";
    }
  }
  String tSerachDatrTime(){
    if (getLanguage() == 'AR') {
      return "بحث بالتاريخ ";
    } else if (getLanguage() == 'EN') {
      return "Serach by date";
    }else {
      return "Serach by date";
    }
  }
  String tSerachName(){
    if (getLanguage() == 'AR') {
      return "بحث بإسم العنصر";
    } else if (getLanguage() == 'EN') {
      return "Serach name of item";
    }else {
      return "Serach name of item";
    }
  }
  String tSearchhere(){
    if (getLanguage() == 'AR') {
      return "ابحث هنا . . .";
    } else if (getLanguage() == 'EN') {
      return "Search here . . .";
    }else {
      return "Search here . . .";
    }
  }
  String tPostdetails(){
    if (getLanguage() == 'AR') {
      return "تفاصيل البلاغ";
    } else if (getLanguage() == 'EN') {
      return "Post details";
    }else {
      return "Post details";
    }
  }
  String tCity(){
    if (getLanguage() == 'AR') {
      return "المدينة : ";
    } else if (getLanguage() == 'EN') {
      return "City : ";
    }else {
      return "City : ";
    }
  }
  String tDescrption(){
    if (getLanguage() == 'AR') {
      return "الوصف : ";
    } else if (getLanguage() == 'EN') {
      return "Descrption : ";
    }else {
      return "Descrption : ";
    }
  }
  String tStstus(){
    if (getLanguage() == 'AR') {
      return "الوصف : ";
    } else if (getLanguage() == 'EN') {
      return "Status : ";
    }else {
      return "Status : ";
    }
  }
  String tDate(){
    if (getLanguage() == 'AR') {
      return "التاريخ : ";
    } else if (getLanguage() == 'EN') {
      return "Date : ";
    }else {
      return "Date : ";
    }
  }
  String tTime(){
    if (getLanguage() == 'AR') {
      return "الوقت : ";
    } else if (getLanguage() == 'EN') {
      return "Time : ";
    }else {
      return "Time : ";
    }
  }
  String tLocationonthemap(){
    if (getLanguage() == 'AR') {
      return "الموقع على الخريطة";
    } else if (getLanguage() == 'EN') {
      return "Location on the map";
    }else {
      return "Location on the map";
    }
  }
  String tDetailsofthereporting(){
    if (getLanguage() == 'AR') {
      return "تفاصيل الشخص المبلّغ";
    } else if (getLanguage() == 'EN') {
      return "Details of the reporting person";
    }else {
      return "Details of the reporting person";
    }
  }
  String tThisisforyou(){
    if (getLanguage() == 'AR') {
      return "هذا لك ؟";
    } else if (getLanguage() == 'EN') {
      return "This is for you ?";
    }else {
      return "This is for you ?";
    }
  }
  String tDoyouFoundit(){
    if (getLanguage() == 'AR') {
      return "هل عثرت عليه ؟";
    } else if (getLanguage() == 'EN') {
      return "Do you found it ?";
    }else {
      return "Do you found it ?";
    }
  }
  String tSendcommentsfound(){
    if (getLanguage() == 'AR') {
      return "تأكيد ملكيه";
    } else if (getLanguage() == 'EN') {
      return "Confirmation";
    }else {
      return "Confirmation";
    }
  }
  String tSendcommentslost(){
    if (getLanguage() == 'AR') {
      return "تواصل معي";
    } else if (getLanguage() == 'EN') {
      return "Contact me";
    }else {
      return "Contact me";
    }
  }
  String tPersonaldata(){
    if (getLanguage() == 'AR') {
      return "البيانات الشخصية";
    } else if (getLanguage() == 'EN') {
      return "Personal data";
    }else {
      return "Personal data";
    }
  }
  String tYouCanEdit(){
    if (getLanguage() == 'AR') {
      return "يمكنك تعديل بياناتك الشخصية من هنا";
    } else if (getLanguage() == 'EN') {
      return "You can edit your personal data from here";
    }else {
      return "You can edit your personal data from here";
    }
  }
  String tNamee(){
    if (getLanguage() == 'AR') {
      return "الاسم : ";
    } else if (getLanguage() == 'EN') {
      return "Name : ";
    }else {
      return "Name : ";
    }
  }
  String tPhonee(){
    if (getLanguage() == 'AR') {
      return "رقم الهاتف : ";
    } else if (getLanguage() == 'EN') {
      return "Phone : ";
    }else {
      return "Phone : ";
    }
  }
  String tEmaill(){
    if (getLanguage() == 'AR') {
      return "الايميل : ";
    } else if (getLanguage() == 'EN') {
      return "Email : ";
    }else {
      return "Email : ";
    }
  }
  String tDelete(){
    if (getLanguage() == 'AR') {
      return "حذف";
    } else if (getLanguage() == 'EN') {
      return "Delete";
    }else {
      return "Delete";
    }
  }
  String tEdit(){
    if (getLanguage() == 'AR') {
      return "تعديل";
    } else if (getLanguage() == 'EN') {
      return "Edit";
    }else {
      return "Edit";
    }
  }
  String tEditProfile(){
    if (getLanguage() == 'AR') {
      return "تعديل الملف الشخصي";
    } else if (getLanguage() == 'EN') {
      return "Edit Profile";
    }else {
      return "Edit Profile";
    }
  }
  String tEnteryourname(){
    if (getLanguage() == 'AR') {
      return "ادخل اسمك";
    } else if (getLanguage() == 'EN') {
      return "Enter your name";
    }else {
      return "Enter your name";
    }
  }
  String tEnteryourname1(){
    if (getLanguage() == 'AR') {
      return "ادخل الاسم";
    } else if (getLanguage() == 'EN') {
      return "Enter name";
    }else {
      return "Enter name";
    }
  }
  String tFullname(){
    if (getLanguage() == 'AR') {
      return "الاسم كامل";
    } else if (getLanguage() == 'EN') {
      return "Full name";
    }else {
      return "Full name";
    }
  }
  String tPleaseenterphonenumber(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال رقم هاتفك";
    } else if (getLanguage() == 'EN') {
      return "Please enter your phone number";
    }else {
      return "Please enter your phone number";
    }
  }
  String tenterphonenumber(){
    if (getLanguage() == 'AR') {
      return "ادخال رقم هاتفك";
    } else if (getLanguage() == 'EN') {
      return "Enter your phone number";
    }else {
      return "Enter your phone number";
    }
  }
  String tThenumbermustbe9(){
    if (getLanguage() == 'AR') {
      return "يجب ان يكون رقم الهاتف 9 ارقام";
    } else if (getLanguage() == 'EN') {
      return "The number must be 9 digits";
    }else {
      return "The number must be 9 digits";
    }
  }
  String tPhonnumber(){
    if (getLanguage() == 'AR') {
      return "رقم الهاتف";
    } else if (getLanguage() == 'EN') {
      return "Phone number";
    }else {
      return "Phone number";
    }
  }
  String tPasswordistooshort(){
    if (getLanguage() == 'AR') {
      return "كلمة المرور قصيرة جدا";
    } else if (getLanguage() == 'EN') {
      return "Password is too shortmber";
    }else {
      return "Password is too shortPhone number";
    }
  }
  String tpassrequired(){
    if (getLanguage() == 'AR') {
      return "يرجى تعبئة الحقل";
    } else if (getLanguage() == 'EN') {
      return "Please fill this field";
    }else {
      return "Please fill this field";
    }
  }
  String tPleaseEnteryourpassword(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Please Enter your password";
    }else {
      return "Please Enter your password";
    }
  }
  String teEnteryourpassword(){
    if (getLanguage() == 'AR') {
      return " ادخال كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return " Enter your password";
    }else {
      return " Enter your password";
    }
  }
  String tPleaseEnterValidEmail(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال بريد الكتروني صحيح";
    } else if (getLanguage() == 'EN') {
      return "Please Enter Valid Email";
    }else {
      return "Please Enter Valid Email";
    }
  }
  String tEnterAnswer(){
    if (getLanguage() == 'AR') {
      return " إدخل إجابة لسؤال الأمان";
    } else if (getLanguage() == 'EN') {
      return " Enter the answer for restore question";
    }else {
      return " Enter the answer for restore question";
    }
  }
  String tpleaseEnterAnswer(){
    if (getLanguage() == 'AR') {
      return "الرجاء إدخال إجابة لسؤال الأمان";
    } else if (getLanguage() == 'EN') {
      return "Please enter the answer for restore question";
    }else {
      return "Please enter the answer for restore question";
    }
  }
  String tPleaseEnterAddress(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال العنوان ";
    } else if (getLanguage() == 'EN') {
      return "Please Enter Address";
    }else {
      return "Please Enter Address";
    }
  }
  String teEnterAddress(){
    if (getLanguage() == 'AR') {
      return "ادخال العنوان ";
    } else if (getLanguage() == 'EN') {
      return " Enter Address";
    }else {
      return " Enter Address";
    }
  }
  String EntertheQuestion(){
    if (getLanguage() == 'AR') {
      return "ادخل سؤال الامان ";
    } else if (getLanguage() == 'EN') {
      return "Enter the Question";
    }else {
      return "Enter the Question";
    }
  }
  String palseEntertheQuestion(){
    if (getLanguage() == 'AR') {
      return " الرجاء إدخال سؤال الامان ";
    } else if (getLanguage() == 'EN') {
      return " Please Enter the Question";
    }else {
      return "Please Enter the Question";
    }
  }
  String Registration(){
    if (getLanguage() == 'AR') {
      return "تسجيل";
    } else if (getLanguage() == 'EN') {
      return "Registration";
    }else {
      return "Registration";
    }
  }
  String Bycontinuingconfirm(){
    if (getLanguage() == 'AR') {
      return "بتسجيلك حساب ذلك يعني انك موافق على سياسة الخصوصية الخاصة بنا";
    } else if (getLanguage() == 'EN') {
      return "By continuing confirm that you agree \nwith our Team and Condition";
    }else {
      return "By continuing confirm that you agree \nwith our Team and Condition";
    }
  }
  String tEntertheaddress(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال العنوان";
    } else if (getLanguage() == 'EN') {
      return "Enter the address";
    }else {
      return "Enter the address";
    }
  }

  String tLanguageMypesonalpage(){
    if (getLanguage() == 'AR') {
      return "صفحتي الشخصبة";
    } else if (getLanguage() == 'EN') {
      return "My personal page";
    }else {
      return "My personal page";
    }
  }
  String tdarkLightMode(){
    if (getLanguage() == 'AR') {
      return "تبديل الوضع";
    } else if (getLanguage() == 'EN') {
      return "Mode switch";
    }else {
      return "Mode switch";
    }
  }
  String tWelcomBack(){
    if (getLanguage() == 'AR') {
      return "مرحبا بعودتك";
    } else if (getLanguage() == 'EN') {
      return "Welcom Back";
    }else {
      return "Welcom Back";
    }
  }
  String tSgininwithyouremail(){
    if (getLanguage() == 'AR') {
      return "قم بتسجيل الدخول باستخدام البريد الالكتروني وكلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Sgin in with your email and password";
    }else {
      return "Sgin in with your email and password";
    }
  }
  String tOR(){
    if (getLanguage() == 'AR') {
      return "أو";
    } else if (getLanguage() == 'EN') {
      return "OR";
    }else {
      return "OR";
    }
  }
  String tRememberme(){
    if (getLanguage() == 'AR') {
      return "تذكرني";
    } else if (getLanguage() == 'EN') {
      return "Remember me";
    }else {
      return "Remember me";
    }
  }
  String tForgetPassword(){
    if (getLanguage() == 'AR') {
      return "نسيت كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Forget Password";
    }else {
      return "Forget Password";
    }
  }
  String tHello(){
    if (getLanguage() == 'AR') {
      return "اهلا";
    } else if (getLanguage() == 'EN') {
      return "Hello";
    }else {
      return "Hello";
    }
  }
  String RegistrDon(){
    if (getLanguage() == 'AR') {
      return "تم تسجيل الحساب";
    } else if (getLanguage() == 'EN') {
      return "Registr done";
    }else {
      return "Registr done";
    }
  }
  String tWelcome(){
    if (getLanguage() == 'AR') {
      return "مرحبا : ";
    } else if (getLanguage() == 'EN') {
      return "Welcome : ";
    }else {
      return "Welcome : ";
    }
  }
  String tEnterYourEmail(){
    if (getLanguage() == 'AR') {
      return "ادخل بريدك الالكتروني";
    } else if (getLanguage() == 'EN') {
      return "Enter Your Email";
    }else {
      return "Enter Your Email";
    }
  }
  String tEnterRestoreAnswer(){
    if (getLanguage() == 'AR') {
      return "أدخل إجابة سؤال الأمان لاستعادة الحساب";
    } else if (getLanguage() == 'EN') {
      return "Enter question's answer to restore account";
    }else {
      return "Enter question's answer to restore account";
    }
  }
  String tDonthaveanaccount(){
    if (getLanguage() == 'AR') {
      return "لا تملك حساب ؟";
    } else if (getLanguage() == 'EN') {
      return "Don't have an account ?";
    }else {
      return "Don't have an account ?";
    }
  }
  String tSignup(){
    if (getLanguage() == 'AR') {
      return "تسجيل حساب";
    } else if (getLanguage() == 'EN') {
      return "Sign up";
    }else {
      return "Sign up";
    }
  }
  String tSnakbarlogin(){
    if (getLanguage() == 'AR') {
      return "خطا في البريد الالكتروني او كلمة المرور";
    } else if (getLanguage() == 'EN') {
      return "Wrong email or password";
    }else {
      return "Wrong email or password";
    }
  }
  String tMAFQWDAPP(){
    if (getLanguage() == 'AR') {
      return "تطبيق مفقود";
    } else if (getLanguage() == 'EN') {
      return "Mafqwd App";
    }else {
      return "Mafqwd App";
    }
  }
  String tMAFQWD(){
    if (getLanguage() == 'AR') {
      return "مفقود";
    } else if (getLanguage() == 'EN') {
      return "MAFQWD";
    }else {
      return "MAFQWD";
    }
  }
  String tAboutApplast(){
    if (getLanguage() == 'AR') {
      return "جميع الحقوق محفوظة @ لطلاب تقنية معلومات مستوى رابع";
    } else if (getLanguage() == 'EN') {
      return "All rights reserved @ for fourth level IT students";
    }else {
      return "All rights reserved @ for fourth level IT students";
    }
  }
  String tAboutAppdescr(){
    if (getLanguage() == 'AR') {
      return "";
    } else if (getLanguage() == 'EN') {
      return "A missing application is an Android mobile application (for lost or lost items) that provides a service to the community in general in retrieving lost items or reporting missing items.. The application also helps in searching for missing items or reporting items. They are of various kinds (personal cards, phones, personal items, etc, The application also makes it easier for the user to search and filter by section (phones section, personal cards and passports section, etc...The application will be easy to use and flexible so that anyone can use it and save time and effort in searching for lost items or reporting them.)";
    }else {
      return "MAFQWD";
    }
  }
  String tMAFQWD1(){
    if (getLanguage() == 'AR') {
      return "مرحبًا بكم في مفقود ، هيا بنا !";
    } else if (getLanguage() == 'EN') {
      return "Welcome to MAFQWD, Let's go !";
    }else {
      return "Welcome to MAFQWD, Let's go !";
    }
  }
  String tProfilePage(){
    if (getLanguage() == 'AR') {
      return "الملف الشخصي";
    } else if (getLanguage() == 'EN') {
      return "Profile";
    }else {
      return "Profile";
    }
  }
  String tMyPage(){
    if (getLanguage() == 'AR') {
      return "صفحتي";
    } else if (getLanguage() == 'EN') {
      return "My Page";
    }else {
      return "My Page";
    }
  }
  String tComments(){
    if (getLanguage() == 'AR') {
      return "التعليقات";
    } else if (getLanguage() == 'EN') {
      return "Comments";
    }else {
      return "Comments";
    }
  }
  String tNoComments(){
    if (getLanguage() == 'AR') {
      return "لا تعليقات للان";
    } else if (getLanguage() == 'EN') {
      return "No Comments yet";
    }else {
      return "No Comments yet";
    }
  }
  String tRespondtopost(){
    if (getLanguage() == 'AR') {
      return "الرد على المنشور";
    } else if (getLanguage() == 'EN') {
      return "Respond to post";
    }else {
      return "Respond to post";
    }
  }
  String tResponses(){
    if (getLanguage() == 'AR') {
      return "الردود";
    } else if (getLanguage() == 'EN') {
      return "Replies";
    }else {
      return "Rreplies";
    }
  }
  String tRespondtopost2(){
    if (getLanguage() == 'AR') {
      return "سيكون هذا الرد مرئيًا فقط للشخص\n الذي قام بنشر البلاغ، اكتب العلامات وكيفية الاتصال بك ";
    } else if (getLanguage() == 'EN') {
      return "This response will only be visible\n to the person who posted it, type in tags and how to contact you";
    }else {
      return "This response will only be visible\n to the person who posted it, type in tags and how to contact you";
    }
  }
  String tAddpost(){
    if (getLanguage() == 'AR') {
      return "اضافة بلاغ جديد";
    } else if (getLanguage() == 'EN') {
      return "Add New Post";
    }else {
      return "Add New Post";
    }
  }
  String tAddpostChoose(){
    if (getLanguage() == 'AR') {
      return "اختر ما إذا كنت تريد إضافة مفقود أو موجود";
    } else if (getLanguage() == 'EN') {
      return "Choose whether to add a lost or a found ";
    }else {
      return "Choose whether to add a lost or a found ";
    }
  }
  String tAddLost(){
    if (getLanguage() == 'AR') {
      return "اضافة مفقود";
    } else if (getLanguage() == 'EN') {
      return "Add Lost";
    }else {
      return "Add Lost";
    }
  }
  String tAddFound(){
    if (getLanguage() == 'AR') {
      return "اضافة موجود";
    } else if (getLanguage() == 'EN') {
      return "Add Found";
    }else {
      return "Add Found";
    }
  }
  String tAddLostFoundDesc(){
    if (getLanguage() == 'AR') {
      return "يجب عليك إدخال جميع البيانات بشكل صحيح\n ودقيق حتى نتمكن من مساعدتك في حل مشكلتك";
    } else if (getLanguage() == 'EN') {
      return "You must enter all data correctly and\n accurately so that we can help you solve your problem";
    }else {
      return "You must enter all data correctly and\n accurately so that we can help you solve your problem";
    }
  }
  String tType(){
    if (getLanguage() == 'AR') {
      return "نوع العنصر";
    } else if (getLanguage() == 'EN') {
      return "Item type";
    }else {
      return "Item type";
    }
  }
  String tPostType(){
    if (getLanguage() == 'AR') {
      return "نوع البلاغ";
    } else if (getLanguage() == 'EN') {
      return "Post Type";
    }else {
      return "Post Type";
    }
  }
  String tCity1(){
    if (getLanguage() == 'AR') {
      return "المدينة";
    } else if (getLanguage() == 'EN') {
      return "City";
    }else {
      return "City";
    }
  }
  String tChooseType(){
    if (getLanguage() == 'AR') {
      return "اختار النوع";
    } else if (getLanguage() == 'EN') {
      return "Choose Type";
    }else {
      return "Choose Type";
    }
  }
  String tChooseCity(){
    if (getLanguage() == 'AR') {
      return "اختار المدينة";
    } else if (getLanguage() == 'EN') {
      return "Choose City";
    }else {
      return "Choose City";
    }
  }
  String tPleaseselectType(){
    if (getLanguage() == 'AR') {
      return "الرجاء اختيار النوع";
    } else if (getLanguage() == 'EN') {
      return "Please select Type";
    }else {
      return "Please select Type";
    }
  }
  String tPleaseselectTypePost(){
    if (getLanguage() == 'AR') {
      return "الرجاء اختيار نوع المنشور";
    } else if (getLanguage() == 'EN') {
      return "Please select Post Type";
    }else {
      return "Please select Post Type";
    }
  }
  String tPleaseselectCity(){
    if (getLanguage() == 'AR') {
      return "الرجاء اختيار المدينة";
    } else if (getLanguage() == 'EN') {
      return "Please select City";
    }else {
      return "Please select City";
    }
  }
  String tPleaseEntername(){
    if (getLanguage() == 'AR') {
      return "الرجاء ادخال الاسم";
    } else if (getLanguage() == 'EN') {
      return "Please Enter name";
    }else {
      return "Please Enter name";
    }
  }
  String tlastrememberedoflost(){
    if (getLanguage() == 'AR') {
      return "اخر مكان تتذكرة للمفقود";
    } else if (getLanguage() == 'EN') {
      return "last remembered address of lost";
    }else {
      return "last remembered address of lost";
    }
  }
  String tDateandTime(){
    if (getLanguage() == 'AR') {
      return "تاريخ التسليم";
    } else if (getLanguage() == 'EN') {
      return "Delivery date";
    }else {
      return "Delivery date";
    }
  }
  String tChoseDateandTime(){
    if (getLanguage() == 'AR') {
      return " اختار تاريخ التسليم";
    } else if (getLanguage() == 'EN') {
      return "Chose delivery date";
    }else {
      return "Chose delivery date";
    }
  }
  String tPleaseselectadateandtime(){
    if (getLanguage() == 'AR') {
      return "يرجى تحديد تاريخ ووقت";
    } else if (getLanguage() == 'EN') {
      return "Please select a date and time";
    }else {
      return "Please select a date and time";
    }
  }
  String DonationDscrHint(){
    if (getLanguage() == 'AR') {
      return "يرجى كتابة وصف للتبرع";
    } else if (getLanguage() == 'EN') {
      return "Please enter a donation's description";
    }else {
      return "Please enter a donation's description";
    }
  }
  String taddlostfounddescr(){
    if (getLanguage() == 'AR') {
      return "ادخل وصف للتبرع";
    } else if (getLanguage() == 'EN') {
      return "Enter donation's description";
    }else {
      return "Enter donation's description";
    }
  }
  String tDescrabtion(){
    if (getLanguage() == 'AR') {
      return "الوصف";
    } else if (getLanguage() == 'EN') {
      return "Descrabtion";
    }else {
      return "Descrabtion";
    }
  }
  String donationdscr(){
    if (getLanguage() == 'AR') {
      return "وصف التبرع";
    } else if (getLanguage() == 'EN') {
      return "Donation's descrabtion";
    }else {
      return "Donation's descrabtion";
    }
  }String dlvryloc(){
    if (getLanguage() == 'AR') {
      return "يرجى تحديد موقع تسليم التبرع";
    } else if (getLanguage() == 'EN') {
      return "Please determine donation delivery location ";
    }else {
      return "Please determine donation delivery location";
    }
  }
  String tlocationfrommap(){
    if (getLanguage() == 'AR') {
      return "حدد موقعك";
    } else if (getLanguage() == 'EN') {
      return "Select your location";
    }else {
      return "Select your location";
    }
  }
  String Determinedeliverylocation(){
    if (getLanguage() == 'AR') {
      return "تحديد موقع التسليم";
    } else if (getLanguage() == 'EN') {
      return "Determine delivery location";
    }else {
      return "Determine delivery location";
    }
  }
  String tLongitude(){
    if (getLanguage() == 'AR') {
      return "خط الطول";
    } else if (getLanguage() == 'EN') {
      return "Longitude";
    }else {
      return "Longitude";
    }
  }
  String tLatitude(){
    if (getLanguage() == 'AR') {
      return "خط العرض";
    } else if (getLanguage() == 'EN') {
      return "Latitude";
    }else {
      return "Latitude";
    }
  }
  String tAlertAddLostFoundDesc(){
    if (getLanguage() == 'AR') {
      return "تم إضافة تبرعك بنجاح";
    } else if (getLanguage() == 'EN') {
      return "Your donation has been added successfully";
    }else {
      return "Your donation has been added successfully";
    }
  }
  String tAlertbasketsDesc(){
    if (getLanguage() == 'AR') {
      return "تم إضافة سلتك بنجاح الان عليك تعبئة السلة بالمواد المتبرع بها";
    } else if (getLanguage() == 'EN') {
      return "Your basket has been added successfully, Now you have to fill the basket with the donated items";
    }else {
      return "Your basket has been added successfully, Now you have to fill the basket with the donated items";
    }
  }
  String tNote(){
    if (getLanguage() == 'AR') {
      return "ملاحظة";
    } else if (getLanguage() == 'EN') {
      return "Note";
    }else {
      return "Note";
    }
  }
  String tNoteAddlostfound(){
    if (getLanguage() == 'AR') {
      return "إذا كنت ترغب في تعديل بعض التفاصيل\n فعليك القيام بذلك من ملف التعريف الخاص بك";
    } else if (getLanguage() == 'EN') {
      return "If you want to edit some details\n you have to do so from your profile";
    }else {
      return "If you want to edit some details\n you have to do so from your profile";
    }
  }
  String dontnnote(){
    if (getLanguage() == 'AR') {
      return "بعد تعبئة بيانات سلة التبرع يرجى اختيار \n  نوع المواد المتبرع بها وارفاق الصور";
    } else if (getLanguage() == 'EN') {
      return "After filling out the donation basket information \n please choose the type of donated items and attach the photos";
    }else {
      return "After filling out the donation basket information \n please choose the type of donated items and attach the photos";
    }
  }
  String tEnteraddressoffounditem(){
    if (getLanguage() == 'AR') {
      return "أدخل العنوان الذي وجدته فيه";
    } else if (getLanguage() == 'EN') {
      return "Enter address of found item";
    }else {
      return "Enter address of found item";
    }
  }
  String tEditpost(){
    if (getLanguage() == 'AR') {
      return "تعديل المنشور";
    } else if (getLanguage() == 'EN') {
      return "Edit Post";
    }else {
      return "Edit Post";
    }
  }
  String tAlertEditDesc(){
    if (getLanguage() == 'AR') {
      return "هل تريد التعديل";
    } else if (getLanguage() == 'EN') {
      return "Do you want to edit ?";
    }else {
      return "Do you want to edit ?";
    }
  }
  String tEditdone(){
    if (getLanguage() == 'AR') {
      return "تم التعديل ";
    } else if (getLanguage() == 'EN') {
      return " Edit done";
    }else {
      return " Edit done";
    }
  }
  String tSorry(){
    if (getLanguage() == 'AR') {
      return "المعذرة";
    } else if (getLanguage() == 'EN') {
      return "Sorry";
    }else {
      return "Sorry";
    }
  }
  String tappundemaintenance(){
    if (getLanguage() == 'AR') {
      return const Text("التطبيق تحت الصيانه").toString();
    } else if (getLanguage() == 'EN') {
      return "The app is under maintenance";
    }else {
      return "The app is under maintenance";
    }
  }
  String tSorryUodate(){
    if (getLanguage() == 'AR') {
      return "عذرًا ... \n هناك إصدار جديد من التطبيق يجب عليك تنزيله";
    } else if (getLanguage() == 'EN') {
      return "Sorry ...\n there is a new version\n of the app that you must download";
    }else {
      return "Sorry ...\n there is a new version\n of the app that you must download";
    }
  }
  String tDownload(){
    if (getLanguage() == 'AR') {
      return "تنزيل";
    } else if (getLanguage() == 'EN') {
      return "Download";
    }else {
      return "Download";
    }
  }
  String tnews(){
    if (getLanguage() == 'AR') {
      return "أخر الاخبار";
    } else if (getLanguage() == 'EN') {
      return "News";
    }else {
      return "News";
    }
  }
  String Camera(){
    if (getLanguage() == 'AR') {
      return "كاميرا";
    } else if (getLanguage() == 'EN') {
      return "Camera";
    }else {
      return "Camera";
    }
  }
  String ConfirmBasket(){
    if (getLanguage() == 'AR') {
      return "تأكيد التبرع";
    } else if (getLanguage() == 'EN') {
      return "Confirm Donation";
    }else {
      return "Confirm Donation";
    }
  }
  String Thisbaskethasbeen(){
    if (getLanguage() == 'AR') {
      return "تم استلام هذه السله";
    } else if (getLanguage() == 'EN') {
      return "This basket has been received";
    }else {
      return "This basket has been received";
    }
  }
  String Confirmdeliveryofdonation(){
    if (getLanguage() == 'AR') {
      return "تأكيد التسليم ";
    } else if (getLanguage() == 'EN') {
      return "Confirm delivery";
    }else {
      return "Confirm delivery";
    }
  }
  String AddDonation(){
    if (getLanguage() == 'AR') {
      return "إضافة تبرع";
    } else if (getLanguage() == 'EN') {
      return "Add Donation";
    }else {
      return "Add Donation";
    }
  }
  String Gallery(){
    if (getLanguage() == 'AR') {
      return "المعرض";
    } else if (getLanguage() == 'EN') {
      return "Gallery";
    }else {
      return "Gallery";
    }
  }
  String AddPhoto(){
    if (getLanguage() == 'AR') {
      return "إضافة صورة";
    } else if (getLanguage() == 'EN') {
      return "Add photo";
    }else {
      return "Add photo";
    }
  }

  String PhotoGallery(){
    if (getLanguage() == 'AR') {
      return "معرض الصور";
    } else if (getLanguage() == 'EN') {
      return "Photo Gallery";
    }else {
      return "Photo Gallery";
    }
  }
  String VideoGallery(){
    if (getLanguage() == 'AR') {
      return "معرض الفيديو";
    } else if (getLanguage() == 'EN') {
      return "Video Gallery";
    }else {
      return "Video Gallery";
    }
  }
  String socialmedia(){
    if (getLanguage() == 'AR') {
      return "التواصل الاجتماعي";
    } else if (getLanguage() == 'EN') {
      return "Social Media";
    }else {
      return "Social Media";
    }
  }
  String Donationbasket(){
    if (getLanguage() == 'AR') {
      return "سلة تبرعات";
    } else if (getLanguage() == 'EN') {
      return "Donation basket";
    }else {
      return "Donation basket";
    }
  }
  String Donations(){
    if (getLanguage() == 'AR') {
      return "تبرع";
    } else if (getLanguage() == 'EN') {
      return "Donate";
    }else {
      return "Donate";
    }
  }
  String Createreceiptrequest(){
    if (getLanguage() == 'AR') {
      return "انشاء طلب استلام";
    } else if (getLanguage() == 'EN') {
      return "Create request";
    }else {
      return "Create request";
    }
  }
  String MyDonations(){
    if (getLanguage() == 'AR') {
      return "تبرعاتي";
    } else if (getLanguage() == 'EN') {
      return "My donations";
    }else {
      return "My donations";
    }
  }
  String Books(){
    if (getLanguage() == 'AR') {
      return "كـــتب";
    } else if (getLanguage() == 'EN') {
      return " Books";
    }else {
      return " Books";
    }
  }
  String Clothes(){
    if (getLanguage() == 'AR') {
      return "ملابـــس";
    } else if (getLanguage() == 'EN') {
      return " Clothes";
    }else {
      return " Clothes";
    }
  }
  String Furneture(){
    if (getLanguage() == 'AR') {
      return "أثــــــاث";
    } else if (getLanguage() == 'EN') {
      return " Furneture";
    }else {
      return " Furneture";
    }
  }
  String Menus(){
    if (getLanguage() == 'AR') {
      return "قوائـــم";
    } else if (getLanguage() == 'EN') {
      return " Menus";
    }else {
      return " Menus";
    }
  }
  String Nearestpoint(){
    if (getLanguage() == 'AR') {
      return "اقـرب نقطة";
    } else if (getLanguage() == 'EN') {
      return " Nearest point";
    }else {
      return " Nearest point";
    }
  }
  String privacypolicy(){
    if (getLanguage() == 'AR') {
      return "سياسة الخصوصية";
    } else if (getLanguage() == 'EN') {
      return "Privacy policy";
    }else {
      return "Privacy policy";
    }
  }
  String Governmentagencies(){
    if (getLanguage() == 'AR') {
      return "جهات حكومية";
    } else if (getLanguage() == 'EN') {
      return "Gov Agencies";
    }else {
      return "Gov Agencies";
    }
  }
  String Contractingassociations(){
    if (getLanguage() == 'AR') {
      return "الجمعيات ";
    } else if (getLanguage() == 'EN') {
      return "Contract Assoc";
    }else {
      return "Contract Assoc";
    }

  }
  String AboutProject(){
    if (getLanguage() == 'AR') {
      return "عن المشروع";
    } else if (getLanguage() == 'EN') {
      return "About Project";
    }else {
      return "About Project";
    }
  }
  String NoBasketFound(){
    if (getLanguage() == 'AR') {
      return "لا توجد سلة";
    } else if (getLanguage() == 'EN') {
      return "No Basket Found";
    }else {
      return "No Basket Found";
    }
  }
  String NoMaterialsFound(){
    if (getLanguage() == 'AR') {
      return "لم يتم إضافة مواد للتبرع";
    } else if (getLanguage() == 'EN') {
      return "No donated materials were added";
    }else {
      return "No donated materials were added";
    }
  }
  String NoPicFound(){
    if (getLanguage() == 'AR') {
      return "لم يتم رفع صور";
    } else if (getLanguage() == 'EN') {
      return "No uploaded images";
    }else {
      return "No uploaded images";
    }
  }
  String  NoNews(){
    if (getLanguage() == 'AR') {
      return "  لا توجد اخبار حاليا";
    } else if (getLanguage() == 'EN') {
      return "There are not news yet";
    }else {
      return "There are not news yet";
    }
  }
  String BasketisEmpty(){
    if (getLanguage() == 'AR') {
      return "السلة فارغة";
    } else if (getLanguage() == 'EN') {
      return "Basket is Empty";
    }else {
      return "Basket is Empty";
    }
  }

  String BasketNO(){
    if (getLanguage() == 'AR') {
      return "رقم السلة : ";
    } else if (getLanguage() == 'EN') {
      return "Basket number : ";
    }else {
      return "Basket number : ";
    }
  }
  String Complated(){
    if (getLanguage() == 'AR') {
      return "مكتملة";
    } else if (getLanguage() == 'EN') {
      return "Complated";
    }else {
      return "Complated";
    }
  }
  String Delivered(){
    if (getLanguage() == 'AR') {
      return "تم التسليم";
    } else if (getLanguage() == 'EN') {
      return "Delivered";
    }else {
      return "Delivered";
    }
  }
  String Waiting(){
    if (getLanguage() == 'AR') {
      return "قيد الانتظار";
    } else if (getLanguage() == 'EN') {
      return "Waiting";
    }else {
      return "Waiting";
    }
  }

  String UnConfirm(){
    if (getLanguage() == 'AR') {
      return "غير مؤكد";
    } else if (getLanguage() == 'EN') {
      return "UnConfirm";
    }else {
      return "UnConfirm";
    }
  }
  String Confirmed(){
    if (getLanguage() == 'AR') {
      return "تم التأكيد";
    } else if (getLanguage() == 'EN') {
      return "Confirmed";
    }else {
      return "Confirmed";
    }
  }
  String Uncomplate(){
    if (getLanguage() == 'AR') {
      return "غير مكتمل";
    } else if (getLanguage() == 'EN') {
      return "Uncomplate";
    }else {
      return "Uncomplate";
    }
  }
  String AboutFoundation(){
    if (getLanguage() == 'AR') {
      return "عن المؤوسسة";
    } else if (getLanguage() == 'EN') {
      return "About foundation";
    }else {
      return "About foundation";
    }
  }
  String Urgent(){
    if (getLanguage() == 'AR') {
      return "عاجل";
    } else if (getLanguage() == 'EN') {
      return "Urgent - ";
    }else {
      return "Urgent - ";
    }
  }
  String Partners(){
    if (getLanguage() == 'AR') {
      return "الشركاء";
    } else if (getLanguage() == 'EN') {
      return "Partners";
    }else {
      return "Partners";
    }
  }
  String AboutDonations(){
    if (getLanguage() == 'AR') {
      return "عن التبرعات";
    } else if (getLanguage() == 'EN') {
      return "About donations";
    }else {
      return "About donations";
    }
  }
  String BasketInfo(){
    if (getLanguage() == 'AR') {
      return "معلومات السلة";
    } else if (getLanguage() == 'EN') {
      return "Basket Information";
    }else {
      return "Basket Information";
    }
  }  String DonationsType(){
    if (getLanguage() == 'AR') {
      return "المواد المتبرع بها";
    } else if (getLanguage() == 'EN') {
      return "Donated Materials";
    }else {
      return "Donated Materials";
    }
  } String DonationsPic(){
    if (getLanguage() == 'AR') {
      return "صور التبرعات";
    } else if (getLanguage() == 'EN') {
      return "Donated Photos";
    }else {
      return "Donated Photos";
    }
  }
  String AddBasket(){
    if (getLanguage() == 'AR') {
      return "إضافة سلة تبرعات";
    } else if (getLanguage() == 'EN') {
      return "Adding Donations Basket";
    }else {
      return "Adding Donations Basket";
    }
  }
  String Donate(){
    if (getLanguage() == 'AR') {
      return "تبرع";
    } else if (getLanguage() == 'EN') {
      return "Donate";
    }else {
      return "Donate";
    }
  }
  String NavNews(){
    if (getLanguage() == 'AR') {
      return " انتقال إلى الخبر  ";
    } else if (getLanguage() == 'EN') {
      return "Go to details";
    }else {
      return "Go to details ";
    }
  }


  //================
  String call(){
    if (getLanguage() == 'AR') {
      return "مكالمة";
    } else if (getLanguage() == 'EN') {
      return "call";
    }else {
      return "Call us";
    }
  }
  String supp(){
    if (getLanguage() == 'AR') {
      return "خدمةالعملاء";
    } else if (getLanguage() == 'EN') {
      return "Cust Service";
    }else {
      return "Cust Service";
    }
  }
  String mail(){
    if (getLanguage() == 'AR') {
      return "البريد الالكتروني";
    } else if (getLanguage() == 'EN') {
      return "Email";
    }else {
      return "Email";
    }
  }
  String FB(){
    if (getLanguage() == 'AR') {
      return "الفيس بوك";
    } else if (getLanguage() == 'EN') {
      return "Facebook";
    }else {
      return "Facebook";
    }
  }
  String X(){
    if (getLanguage() == 'AR') {
      return "اكس";
    } else if (getLanguage() == 'EN') {
      return "x";
    }else {
      return "x";
    }
  }
  String youtube(){
    if (getLanguage() == 'AR') {
      return "اليوتيوب";
    } else if (getLanguage() == 'EN') {
      return "YouTube";
    }else {
      return "YouTube";
    }
  }
  String Snapchat(){
    if (getLanguage() == 'AR') {
      return "سناب شات";
    } else if (getLanguage() == 'EN') {
      return "Snapchat";
    }else {
      return "Snapchat";
    }
  }
  String instagram(){
    if (getLanguage() == 'AR') {
      return "انستقرام";
    } else if (getLanguage() == 'EN') {
      return "Instagram";
    }else {
      return "Instagram";
    }
  }
  String whatsapp(){
    if (getLanguage() == 'AR') {
      return "واتساب";
    } else if (getLanguage() == 'EN') {
      return "Whatsapp";
    }else {
      return "Whatsapp";
    }
  }

  String con_us(){
    if (getLanguage() == 'AR') {
      return "اليوتيوب";
    } else if (getLanguage() == 'EN') {
      return "YouTube";
    }else {
      return "YouTube";
    }
  }
  String RegisterAccount(){
    if (getLanguage() == 'AR') {
      return "تسجيل حساب";
    } else if (getLanguage() == 'EN') {
      return "Register Account";
    }else {
      return "Register Account";
    }
  }
  String lighttheme(){
    if (getLanguage() == 'AR') {
      return "وضع النهار";
    } else if (getLanguage() == 'EN') {
      return "light theme";
    }else {
      return "light theme";
    }
  }
  String darktheme(){
    if (getLanguage() == 'AR') {
      return "الوضع الليلي";
    } else if (getLanguage() == 'EN') {
      return "Dark theme";
    }else {
      return "Dark theme";
    }
  }
  String theme(){
    if (getLanguage() == 'AR') {
      return "الوضع";
    } else if (getLanguage() == 'EN') {
      return "Theme";
    }else {
      return "Theme";
    }
  }
  String doneaddbaskests(){
    if (getLanguage() == 'AR') {
      return "تم اضافة السلة";
    } else if (getLanguage() == 'EN') {
      return "Cart has been added";
    }else {
      return "Cart has been added";
    }
  }
  String Success(){
    if (getLanguage() == 'AR') {
      return "بنجاح";
    } else if (getLanguage() == 'EN') {
      return "Success";
    }else {
      return "Success";
    }
  }




}
