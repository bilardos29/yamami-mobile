import 'package:app/component/profile_menu_button.dart';
import 'package:app/component/user_greeting.dart';
import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/feature/cart/view/cart_page.dart';
import 'package:app/feature/loyalty/view/loyalty_page.dart';
import 'package:app/feature/notification/view/notification_page.dart';
import 'package:app/feature/profile/view/change_profile_page.dart';
import 'package:app/feature/profile/view/profile_change_password_page.dart';
import 'package:app/feature/profile/view/profile_delete_akun.dart';
import 'package:app/feature/profile/view/profile_faq_page.dart';
import 'package:app/feature/profile/view/profile_list_address_page.dart';
import 'package:app/feature/profile/view/profile_privacy_policy_page.dart';
import 'package:app/feature/profile/view/profile_terms_conditions_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, String>> menus = [
    {'icon': 'ic_faq.png', 'title': 'Pusat Bantuan'},
    {'icon': 'ic_profil.png', 'title': 'Profil'},
    {'icon': 'ic_change_password.png', 'title': 'Ubah Kata Sandi'},
    {'icon': 'ic_change_address.png', 'title': 'Atur Alamat'},
    {'icon': 'ic_terms.png', 'title': 'Syarat dan Ketentuan'},
    {'icon': 'ic_privacy.png', 'title': 'Kebijakan Privasi'},
    {'icon': 'ic_delete_acc.png', 'title': 'Hapus Akun Privasi'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6F1),
        elevation: 0,
        actions: [
          buildIconWithBadge(
            image: 'ic_notif.png',
            onTap: () {
              nextPage(context, NotificationPage());
            },
          ),
          SizedBox(width: 10),
          buildIconWithBadge(
            image: 'ic_cart.png',
            onTap: () {
              nextPage(context, CartPage());
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: UserGreeting(
                      userName: 'Kate',
                      imageUrl: 'https://i.pravatar.cc/150?img=5',
                      email: 'Kate@gmail.com',
                      isLargeImage: true,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      nextPage(context, LoyaltyPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'asset/icons/ic_point.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '2.000',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ).copyWith(bottom: 100),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: menus.length,
                      separatorBuilder: (_, __) => dividerLine(),
                      itemBuilder: (context, index) {
                        final menu = menus[index];
                        return ProfileMenuButton(
                          icon: menu['icon']!,
                          title: menu['title']!,
                          onTap: () {
                            Widget page =
                                (index == 0)
                                    ? ProfileFaqPage()
                                    : (index == 1)
                                    ? ChangeProfilePage()
                                    : (index == 2)
                                    ? ProfileChangePasswordPage()
                                    : (index == 3)
                                    ? ProfileListAddressPage()
                                    : (index == 4)
                                    ? ProfileTermsConditionsPage()
                                    : (index == 5)
                                    ? ProfilePrivacyPolicyPage()
                                    : ProfileDeleteAkun();
                            nextPage(context, page);
                          },
                        );
                      },
                    ),
                    dividerLine(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            backToMainPage(context, LoginPage());
                          },
                          child: const Text(
                            'Keluar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
