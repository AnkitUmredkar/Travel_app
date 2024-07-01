import 'dart:ui';

import 'package:flutter/material.dart';

Color bgColor = const Color(0xff22272c), blueColor = const Color(0xff0076EE);
int selectedIndex = 0;
List cartList = [];
List foundUser = [], showOptionImg = [];
List showList = packageList[0];
GlobalKey<FormState> formKey = GlobalKey();
List optionImgList = [
  //todo---------------> Popular
  [
    [
      'assets/images/CategoryWiseImages/AllImages/Balloon/HOT1.jpg',
      'assets/images/CategoryWiseImages/AllImages/Balloon/HOT3.jpg',
      'assets/images/CategoryWiseImages/AllImages/Balloon/HOT4.jpg',
      'assets/images/CategoryWiseImages/AllImages/Balloon/HOT5.jpg',
      'assets/images/CategoryWiseImages/AllImages/Balloon/HOT6.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Beach/GA2.jpg',
      'assets/images/CategoryWiseImages/AllImages/Beach/GA3.jpg',
      'assets/images/CategoryWiseImages/AllImages/Beach/GA7.jpg',
      'assets/images/CategoryWiseImages/AllImages/Beach/GA13.webp',
      'assets/images/CategoryWiseImages/AllImages/Beach/GA15.webp',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i3.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/NubraValley/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/NubraValley/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/NubraValley/i3.jpg',
      'assets/images/CategoryWiseImages/AllImages/NubraValley/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/EiffelTower/i1.jpeg',
      'assets/images/CategoryWiseImages/AllImages/EiffelTower/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/EiffelTower/i3.jpeg',
      'assets/images/CategoryWiseImages/AllImages/EiffelTower/i4.jpeg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/HillStation/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/HillStation/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/HillStation/i3.webp',
      'assets/images/CategoryWiseImages/AllImages/HillStation/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/GateIndia/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/GateIndia/i2.webp',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/JogFalls/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/JogFalls/i2.jpeg',
      'assets/images/CategoryWiseImages/AllImages/JogFalls/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Unity/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/Unity/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/Unity/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Rani/i1.jpg'
          '',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i3.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i4.jpg',
    ],
  ],
  //todo---------------> Mountain
  [
    [
      'assets/images/CategoryWiseImages/MountainImages/RopeWay/i1.jpeg',
      'assets/images/CategoryWiseImages/MountainImages/RopeWay/i2.jpg',
      'assets/images/CategoryWiseImages/MountainImages/RopeWay/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/RopeWay/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/HillStation/i1.jpg',
      'assets/images/CategoryWiseImages/MountainImages/HillStation/i2.jpg',
      'assets/images/CategoryWiseImages/MountainImages/HillStation/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/HillStation/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Shillong/i1.jpeg',
      'assets/images/CategoryWiseImages/MountainImages/Shillong/i2.jpeg',
      'assets/images/CategoryWiseImages/MountainImages/Shillong/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Shillong/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i1.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i2.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i1.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i2.webp',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i1.jpeg',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i2.webp',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Ladakh/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Jog/i1.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Jog/i2.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Jog/i3.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Jog/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i5.webp',
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i2.jpg',
      'assets/images/CategoryWiseImages/MountainImages/Lonavala/i6.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i1.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i2.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i3.jpg',
      'assets/images/CategoryWiseImages/AllImages/Gulmarg/i4.jpg',
    ],
  ],
  //todo---------------> Temple
  [
    [
      'assets/images/CategoryWiseImages/TempleImages/Kedarnath/i1.webp',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Kashi/i1.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Kashi/i2.webp',
      'assets/images/CategoryWiseImages/TempleImages/Kashi/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Tirupati/i1.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Tirupati/i2.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Tirupati/i3.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Tirupati/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/PadmanTemple/i1.jpg',
      'assets/images/CategoryWiseImages/TempleImages/PadmanTemple/i2.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Jagannath/i1.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Jagannath/i2.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Jagannath/i3.webp',
      'assets/images/CategoryWiseImages/TempleImages/Jagannath/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Dwarka/i1.webp',
      'assets/images/CategoryWiseImages/TempleImages/Dwarka/i2.webp',
      'assets/images/CategoryWiseImages/TempleImages/Dwarka/i3.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Dwarka/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Amarnath/i1.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Amarnath/i2.jpg',
      'assets/images/CategoryWiseImages/TempleImages/Amarnath/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/Kanchipuram/i1.webp',
      'assets/images/CategoryWiseImages/TempleImages/Kanchipuram/i2.webp',
    ],
    [
      'assets/images/CategoryWiseImages/TempleImages/SwarnMandir/i1.webp',
      'assets/images/CategoryWiseImages/TempleImages/SwarnMandir/i2.jpg',
      'assets/images/CategoryWiseImages/TempleImages/SwarnMandir/i3.jpg',
      'assets/images/CategoryWiseImages/TempleImages/SwarnMandir/i4.jpg',
    ],
  ],
  //todo---------------> Beach
  [
    [
      'assets/images/CategoryWiseImages/BeachImages/Goa/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Goa/i2.jpeg',
      'assets/images/CategoryWiseImages/BeachImages/Goa/i3.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Goa/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Lily/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Lily/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Lily/i3.webp',
      'assets/images/CategoryWiseImages/BeachImages/Lily/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Devka/i1.jpeg',
      'assets/images/CategoryWiseImages/BeachImages/Devka/i2.webp',
      'assets/images/CategoryWiseImages/BeachImages/Devka/i3.jpeg',
      'assets/images/CategoryWiseImages/BeachImages/Devka/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Wandoor/i1.png',
      'assets/images/CategoryWiseImages/BeachImages/Wandoor/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Wandoor/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Marina/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Marina/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Marina/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Serenity/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Serenity/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Serenity/i3.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Serenity/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Karavatti/i1.JPG',
      'assets/images/CategoryWiseImages/BeachImages/Karavatti/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Karavatti/i3.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Karavatti/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Anjuna/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Anjuna/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Anjuna/i3.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Anjuna/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/BeachImages/Malva/i1.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Malva/i2.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Malva/i3.jpg',
      'assets/images/CategoryWiseImages/BeachImages/Malva/i4.jpg',
    ],
  ],
  //todo---------------> Ancient Place
  [
    [
      'assets/images/CategoryWiseImages/AncientImages/Taj Mahal/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Taj Mahal/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Taj Mahal/i3.webp',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Qutab Minar/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Qutab Minar/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Qutab Minar/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Jalilawala Bagh/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Jalilawala Bagh/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Jalilawala Bagh/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Buland Darawaga/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Buland Darawaga/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Buland Darawaga/i3.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Buland Darawaga/i4.webp',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Hampi/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Hampi/i2.webp',
      'assets/images/CategoryWiseImages/AncientImages/Hampi/i3.webp',
      'assets/images/CategoryWiseImages/AncientImages/Hampi/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Sanchi/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Sanchi/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Sanchi/i3.webp',
      'assets/images/CategoryWiseImages/AncientImages/Sanchi/i4.webp',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Mohejo-dado/i1.webp',
      'assets/images/CategoryWiseImages/AncientImages/Mohejo-dado/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Mohejo-dado/i3.webp',
      'assets/images/CategoryWiseImages/AncientImages/Mohejo-dado/i4.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Char Minar/i1.webp',
      'assets/images/CategoryWiseImages/AncientImages/Char Minar/i2.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Char Minar/i3.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/AncientImages/Khajuraho Temple/i1.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Khajuraho Temple/i2.png',
      'assets/images/CategoryWiseImages/AncientImages/Khajuraho Temple/i3.jpg',
      'assets/images/CategoryWiseImages/AncientImages/Khajuraho Temple/i4.jpg',
    ],
  ],
  //todo---------------> Nature and Wild
  [
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Australia/Great Barrier Reef.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Australia/Kakadu National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Australia/Kangaroo Island.jpg',
      "assets/images/CategoryWiseImages/Nature & Wildlife/Australia/Tasmania's Wilderness World Heritage Area.jpg",
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Botswana/Central Kalahari Game Reserve.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Botswana/Makgadikgadi Pans National Par.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Botswana/Moremi Game Reserve.jpg',
      "assets/images/CategoryWiseImages/Nature & Wildlife/Botswana/Okavango Delta.jpg",
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Canada/Banff National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Canada/Gros Morne National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Canada/Jasper National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Canada/Pacific Rim National Park Reserve.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Chile/Chiloé National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Chile/Easter Island.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Chile/Torres del Paine National Park.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Ecuador/Cotopaxi National Park.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Ecuador/Cuyabeno Wildlife Reserve.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Ecuador/Galápagos Islands.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Ecuador/Yasuni National Park.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/i1.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/i3.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/i4.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/i5.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/i6.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/South Africa/i2.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/South Africa/i3.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/South Africa/i4.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/South Africa/i5.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Nature & Wildlife/Tanzania/i2.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Tanzania/i3.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Tanzania/i4.jpg',
      'assets/images/CategoryWiseImages/Nature & Wildlife/Tanzania/i5.jpg',
    ],
  ],
  //todo---------------> Foreign
  [
    [
      'assets/images/CategoryWiseImages/CulturalImages/Athens Greece/i2.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Athens Greece/i3.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Athens Greece/i4.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Athens Greece/i5.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i1.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i2.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i3.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i4.png',
      'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i5.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i1.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i2.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i3.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i4.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i6.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Jerusalem Israel/i1.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Jerusalem Israel/i2.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Jerusalem Israel/i4.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Jerusalem Israel/i5.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i1.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i2.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i4.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i5.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i6.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i7.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Mexico City Mexico/licensed-image.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Mexico City Mexico/Polanco.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Mexico City Mexico/Xochimilco.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Mexico City Mexico/Zócalo.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/co.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/Pantheon.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/Roman Forum.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/Spanish Steps.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/Trevi Fountain.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/CulturalImages/varansi india/Alamgir Mosque.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/varansi india/Dashashwamedh Ghat.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/varansi india/Durga Temple.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/varansi india/Manikarnika Ghat.jpg',
      'assets/images/CategoryWiseImages/CulturalImages/varansi india/Ramnagar Fort.jpg',
    ],
  ],
  //todo---------------> Family Vacation
  [
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/austellia/barrier reef.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/austellia/gold coast.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/austellia/melbourne.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/austellia/sydney.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/Canada/Toronto.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/Canada/Whistler.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Cancún.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Los Cabos.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Oaxaca.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Puerto Vallarta.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Riviera Maya.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/central park.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/central park2.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/effil tower.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/statue of unity.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/statue of unity2.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New york/time spuare.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Auckland.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Bay of Islands.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Queenstown.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Rotorua.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Taupo.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/South Africa/Durban.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/South Africa/Garden Route.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/South Africa/Kruger National Park.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/South Africa/Sun City.jpg',
    ],
    [
      'assets/images/CategoryWiseImages/Family Vaction Images/spain/barcelona.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/spain/Canary Island.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/spain/Costa del Sol.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/spain/madrid.jpg',
      'assets/images/CategoryWiseImages/Family Vaction Images/spain/Valencia.jpg',
    ],
  ],
];
int bookingIndex = 0, people = 1;


Widget background() {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.bottomLeft,
              radius: 0.765,
              colors: [
                Color(0xff5670ff),
                Color(0xff000206),
              ]),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 380,
          width: 380,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 0.75,
                colors: [
                  Color(0xff5670ff),
                  Color(0xff000206),
                ]),
          ),
        ),
      ),
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 400, sigmaY: 400),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    ],
  );
}

List packageList = [
  [
    {
      'category': 'All Popular',
      'name': 'Hot Air Balloon',
      'location': 'Himachal Pradesh',
      'img': 'assets/images/CategoryWiseImages/AllImages/i1.jpg',
      'time': '2.00 PM - 5.00 PM',
      'rate': 4.5,
      'description': 'Hot Air Balloon floats gracefully in the sky,Its colorful envelope billowing high.Driven by heated air, it ascends with ease,Offering passengers a view that can please.A symbol of adventure and freedom call,It glides serenely, majestic and tall.',
      'price': 6000,
    },
    {
      'category': 'All Popular',
      'name': 'Sinquerim Beach',
      'location': 'Goa',
      'img': 'assets/images/CategoryWiseImages/AllImages/i4.jpg',
      'time': '7.00 AM - 9.00 PM',
      'rate': 4.5,
      'description': 'Sinquerim Beach, located along the northern coast of Goa, India, is celebrated for its pristine beauty and tranquil ambiance. Its expansive stretch of golden sands invites visitors to relax under the sun or take leisurely strolls along the shore. The azure waters of the Arabian Sea gently lap against the beach, creating a serene atmosphere perfect for swimming and water sports like jet skiing and parasailing.',
      'price': 8500,
    },
    {
      'category': 'All Popular',
      'name': 'Gulmarg',
      'location': 'Kashmir',
      'img': 'assets/images/CategoryWiseImages/AllImages/i3.jpg',
      'time': '2.00 PM - 5.00 PM',
      'rate': 5.2,
      'description': 'Gulmarg, nestled in the Pir Panjal range of the Himalayas in the Indian-administered union territory of Jammu and Kashmir, is a breathtaking hill station renowned for its natural beauty and adventure tourism opportunities.',
      'price': 10000,
    },
    {
      'category': 'All Popular',
      'name': 'Nubra Valley',
      'location': 'Ladakh',
      'img': 'assets/images/CategoryWiseImages/AllImages/i2.webp',
      'time': '8.00 PM - 5.00 PM',
      'rate': 4.9,
      'description': 'Nubra Valley, located in the northern part of Ladakh in the union territory of Jammu and Kashmir, India, is a mesmerizing high-altitude desert region nestled between the Karakoram Range and the Ladakh Range. Here a glimpse into the unique characteristics and attractions of Nubra Valley',
      'price': 10800,
    },
    {
      'category': 'All Popular',
      'name': 'Eiffel Tower',
      'location': 'Paris',
      'img': 'assets/images/CategoryWiseImages/AllImages/i5.webp',
      'time': '8.00 AM - 9.00 PM',
      'rate': 6.1,
      'description': 'The Eiffel Tower, an iconic symbol of Paris and one of the most recognizable structures in the world, stands majestically on the Champ de Mars near the Seine River. Designed by Gustave Eiffel and completed in 1889 as the entrance arch to the 1889 Worlds Fair, it initially faced criticism but has since become a beloved emblem of French artistry and engineering.',
      'price': 10200,
    },
    {
      'category': 'All Popular',
      'name': 'Hill Station',
      'location': 'Manali',
      'img': 'assets/images/CategoryWiseImages/AllImages/i6.jpg',
      'time': '7.00 AM - 7.00 PM',
      'rate': 5.8,
      'description': 'Manali, nestled in the picturesque mountains of Himachal Pradesh, India, is a popular hill station renowned for its breathtaking natural beauty, adventurous activities, and cultural charm. Situated at an altitude of around 2,050 meters (6,726 feet) in the Kullu Valley.',
      'price': 8000,
    },
    {
      'category': 'All Popular',
      'name': 'Gateway of India',
      'location': 'Mumbai',
      'img': 'assets/images/CategoryWiseImages/AllImages/i7.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 5.4,
      'description': 'The Gateway of India, situated in Mumbai, India, is an iconic monument that holds historical and cultural significance. Constructed in 1924, it was originally built to commemorate the visit of King George V and Queen Mary to Mumbai in 1911, though its final construction was completed in 1924.',
      'price': 10800,
    },
    {
      'category': 'All Popular',
      'name': 'Jog Falls',
      'location': 'Karnataka',
      'img': 'assets/images/CategoryWiseImages/AllImages/i8.jpg',
      'time': '7.00 AM - 9.00 PM',
      'rate': 5.7,
      'description': 'Jog Falls, located in the Shimoga district of Karnataka, India, is one of the tallest waterfalls in the country and a breathtaking natural wonder. Here a glimpse into the beauty and allure of Jog Falls:Fed by the Sharavathi River',
      'price': 12500,
    },
    {
      'category': 'All Popular',
      'name': 'Statue of unity',
      'location': 'Kevadia',
      'img': 'assets/images/CategoryWiseImages/AllImages/i9.webp',
      'time': '8.00 AM - 9.00 PM',
      'rate': 7.1,
      'description': 'The Statue of Unity, located near Kevadia in the state of Gujarat, India, is the world tallest statue, standing at a towering height of 182 meters (597 feet). Here’s an overview of this monumental landmark:Commissioned in honor of Sardar Vallabhbhai Patel, one of India founding fathers and the first Deputy Prime Minister and Home Minister of independent India.',
      'price': 10000,
    },
    {
      'category': 'All Popular',
      'name': "Rani's Stepwell",
      'location': 'Patan',
      'img': 'assets/images/CategoryWiseImages/AllImages/i10.jpg',
      'time': '7.00 AM - 9.00 PM',
      'rate': 8.1,
      'description': 'Rani ki Vav, also known as the Queen Stepwell, is a magnificent and intricately designed stepwell located in Patan, Gujarat, India. Here’s an exploration of this historical marvel:Built during the 11th century AD by Queen Udayamati in memory of her husband, King Bhimdev I of the Solanki dynasty, Rani ki Vav is a UNESCO World Heritage Site renowned for its architectural brilliance and artistic detail.',
      'price': 8500,
    },
    {
      'category': 'All Popular',
      'name': "Lions Point",
      'location': 'Lonavala',
      'img': 'assets/images/CategoryWiseImages/AllImages/i11.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.1,
      'description': 'Lions Point is a popular viewpoint located near Lonavala in the state of Maharashtra, India. Here an overview of this scenic destination:Situated in the Sahyadri Range of the Western Ghats, Lions Point offers breathtaking panoramic views of the surrounding valleys, lush green hills, and the Pune cityscape in the distance.',
      'price': 10000,
    },
  ],
  //todo-------------------------------> Mountain
  [
    {
      'category': 'Mountain',
      'name': 'Rope way',
      'location': 'Shimla',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m1.webp',
      'time': '8.00 AM - 6.00 PM',
      'rate': 7.3,
      'description': 'The ropeway in Shimla, officially known as the Shimla Ropeway, is a popular tourist attraction that provides breathtaking aerial views of the picturesque landscape surrounding the hill station. Here are some details about the ropeway in Shimla:Route and Stations.',
      'price': 4000,
    },
    {
      'category': 'Mountain',
      'name': 'Hill Station',
      'location': 'Coorg',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m2.jpeg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.5,
      'description': 'Coorg, officially known as Kodagu, is a stunning hill station nestled amidst the Western Ghats in the state of Karnataka, India. Known for its lush greenery, coffee plantations, misty hills, and rich cultural heritage, Coorg is a popular destination for nature lovers, adventure enthusiasts, and those seeking a peaceful retreat.',
      'price': 5000,
    },
    {
      'category': 'Mountain',
      'name': 'View Point',
      'location': 'Shillong',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m4.jpeg',
      'time': '8.00 AM - 7.00 PM',
      'rate': 6.8,
      'description': 'Shillong, the capital city of Meghalaya in Northeast India, boasts several captivating viewpoints that offer panoramic vistas of its surrounding hills, valleys, and lush green landscapes. Here are some notable view points in and around Shillong:Shillong Peak.',
      'price': 5000,
    },
    {
      'category': 'Mountain',
      'name': 'Train View',
      'location': 'Lonavala',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m5.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.6,
      'description': 'The train journey to Lonavala, a scenic hill station in Maharashtra, India, offers breathtaking views of the Western Ghats and its verdant landscapes. Here’s what you can expect during a train ride to Lonavala:Scenic Route: The train journey from Mumbai or Pune to Lonavala traverses through the picturesque Western Ghats.',
      'price': 6000,
    },
    {
      'category': 'Mountain',
      'name': 'Hill Station',
      'location': 'Ladakh',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m3.jpeg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 6.4,
      'description': 'Ladakh, although renowned for its rugged terrain and high-altitude desert landscapes, is not typically considered a traditional hill station in the sense of lush greenery and moderate climates often associated with hill stations in India. However, Ladakh does have several high-altitude areas and passes that can be considered as hill stations or scenic viewpoints due to their stunning landscapes and panoramic views.',
      'price': 8000,
    },
    {
      'category': 'Mountain',
      'name': 'Hill Station',
      'location': 'Ladakh',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m6.webp',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.5,
      'description': 'Ladakh, although renowned for its rugged terrain and high-altitude desert landscapes, is not typically considered a traditional hill station in the sense of lush greenery and moderate climates often associated with hill stations in India.',
      'price': 4000,
    },
    {
      'category': 'Mountain',
      'name': 'Jog Falls',
      'location': 'Karnataka',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m7.jpeg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 6.4,
      'description': 'Jog Falls, located in Karnataka, India, is one of the highest plunge waterfalls in the country, cascading from a height of approximately 253 meters (830 feet) in the Western Ghats. Formed by the Sharavathi River, it consists of four distinct cascades known as Raja, Rani, Roarer, and Rocket.',
      'price': 3000,
    },
    {
      'category': 'Mountain',
      'name': 'Mountain View',
      'location': 'Lonavala',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m8.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.1,
      'description': 'Lonavala, nestled in the Western Ghats of Maharashtra, India, offers captivating mountain views and scenic landscapes. From viewpoints like Tiger Leap and Rajmachi Point, visitors can enjoy panoramic vistas of lush green hills, deep valleys, and cascading waterfalls during the monsoon.',
      'price': 3000,
    },
    {
      'category': 'Mountain',
      'name': 'Gulmarg',
      'location': 'Kashmir',
      'img': 'assets/images/CategoryWiseImages/MountainImages/m9.jpeg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 7.5,
      'description': 'gulamarg kashmir 10 line paregarp Gulmarg, nestled in the Baramulla district of Jammu and Kashmir, India, is celebrated for its breathtaking natural beauty and adventure opportunities amidst the Himalayan ranges. The region captivates visitors with its snow-capped peaks, verdant meadows, and dense forests, creating a picturesque paradise for nature enthusiasts.',
      'price': 5000,
    },
  ],
  //todo-------------------------------> Temple
  [
    {
      'category': 'Temple',
      'name': 'Kedarnath',
      'location': 'Garhwal Himalayan',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t1.jpg',
      'time': '8.00 AM - 6.00 PM',
      'rate': 10.3,
      'description': 'Kedarnath, located in Uttarakhand, India, is a revered pilgrimage site dedicated to Lord Shiva. Situated at an altitude of about 3,583 meters (11,755 feet) amidst the Garhwal Himalayas, it is one of the Char Dham pilgrimage destinations and houses one of the twelve Jyotirlingas.',
      'price': 7000,
    },
    {
      'category': 'Temple',
      'name': 'Kashi Vishwanath',
      'location': 'Varanasi',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t2.jpg',
      'time': '9.00 AM - 6.00 PM',
      'rate': 8.5,
      'description': 'The Kashi Vishwanath Temple, located in Varanasi, Uttar Pradesh, India, is one of the most revered Hindu temples dedicated to Lord Shiva. It stands on the western bank of the holy river Ganges and is believed to be one of the twelve Jyotirlingas, manifestations of Lord Shiva. The temple has a rich historical and spiritual significance.',
      'price': 7500,
    },
    {
      'category': 'Temple',
      'name': 'Tirupati Balaji',
      'location': 'Andhra Pradesh',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t3.jpg',
      'time': '7.00 AM - 5.00 PM',
      'rate': 5.9,
      'description': 'The Tirupati Balaji Temple, located in the hill town of Tirumala in Andhra Pradesh, India, is one of the richest and most visited Hindu temples in the world. Dedicated to Lord Venkateswara, an incarnation of Lord Vishnu, it attracts millions of pilgrims annually. The temple is situated atop the Seshachalam Hills at an altitude of approximately 853 meters.',
      'price': 8000,
    },
    {
      'category': 'Temple',
      'name': 'Padmanabhaswamy',
      'location': 'Kerala',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t4.webp',
      'time': '8.00 AM - 6.00 PM',
      'rate': 4.6,
      'description': 'The Padmanabhaswamy Temple, located in Thiruvananthapuram (Trivandrum), Kerala, India, is a prominent Hindu temple dedicated to Lord Padmanabhaswamy (a form of Lord Vishnu). It is renowned for its architectural grandeur, intricate Dravidian style of architecture, and historical significance. The temple is known for its massive gopuram (temple tower) adorned with elaborate sculptures and carvings.',
      'price': 5000,
    },
    {
      'category': 'Temple',
      'name': 'Jagannath',
      'location': 'Odisha',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t5.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 6.4,
      'description': 'The Jagannath Temple, located in Puri, Odisha, India, is a famous Hindu temple dedicated to Lord Jagannath, a form of Lord Vishnu. It is one of the Char Dham pilgrimage sites for Hindus.The temple kitchen is one of the largest in the world and prepares meals for thousands of devotees daily as part of the Mahaprasad, considered sacred and blessed.',
      'price': 8000,
    },
    {
      'category': 'Temple',
      'name': 'Dwarkadhish',
      'location': 'Dwarka',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t6.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 10.8,
      'description': 'The Dwarkadhish Temple, located in Dwarka, Gujarat, India, is a major Hindu temple dedicated to Lord Krishna, who is worshipped here as Dwarkadhish, meaning Lord of Dwarka. It is one of the Char Dham pilgrimage sites and holds immense religious significance for devotees of Lord Krishna. The temple is believed to have been built around 2,000 years ago and is mentioned in ancient Hindu texts like the Puranas.',
      'price': 9500,
    },
    {
      'category': 'Temple',
      'name': 'Amarnath',
      'location': 'Amarnath ',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t7.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 7.4,
      'description': 'The Amarnath Temple, located in the state of Jammu and Kashmir, India, is a revered Hindu pilgrimage site dedicated to Lord Shiva. It is situated at an altitude of approximately 3,888 meters (12,756 feet) in the Himalayas. The temple is famous for its naturally formed ice lingam (Shiva lingam), which forms inside a cave during the summer months due to freezing of water dripping from the cave roof.',
      'price': 7500,
    },
    {
      'category': 'Temple',
      'name': 'Kanchipuram',
      'location': 'Tamil Nadu',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t8.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.1,
      'description': 'Kanchipuram, often referred to as Kanchi, holds a significant place in the cultural and religious tapestry of Tamil Nadu, India. Known as the "City of Temples," Kanchipuram is revered for its ancient Hindu temples that showcase exquisite Dravidian architecture and intricate sculptures.',
      'price': 9000,
    },
    {
      'category': 'Temple',
      'name': 'Swarna mandir',
      'location': 'Amritsar',
      'img': 'assets/images/CategoryWiseImages/TempleImages/t9.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 7.9,
      'description': 'The Swarna Mandir, also known as Harmandir Sahib or the Golden Temple, is the holiest Gurdwara of Sikhism. It is located in the city of Amritsar in Punjab, India, and is revered by Sikhs worldwide. The temple was founded by Guru Ram Das, the fourth Sikh Guru, in the 16th century, with the construction completed by Guru Arjan Dev, the fifth Sikh Guru.',
      'price': 11000,
    }
  ],
  //todo-----------------------------------------> Beach
  [
    {
      'category': 'Beach',
      'name': 'Goa Beach',
      'location': 'North Goa',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b1.jpg',
      'time': '8.00 AM - 6.00 PM',
      'rate': 8.3,
      'description': 'Goa located on the western coast of India, is famous for its pristine beaches that stretch along the Arabian Sea. Here are ten lines about the beaches in Goa Goa boasts some of the most picturesque beaches in India, attracting visitors from around the world for their golden sands and clear waters.',
      'price': 9300,
    },
    {
      'category': 'Beach',
      'name': 'Lily Beach',
      'location': 'Maldives',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b3.jpg',
      'time': '8.00 AM - 6.00 PM',
      'rate': 8.4,
      'description': 'Lily Beach Resort & Spa is an exclusive luxury resort located on Huvahendhoo Island in the South Ari Atoll of the Maldives. It features overwater villas and beach villas, offering stunning views of the Indian Ocean. The resort is renowned for its pristine white sandy beaches and vibrant house reef, ideal for snorkeling and diving enthusiasts.',
      'price': 14500,
    },
    {
      'category': 'Beach',
      'name': 'Devka Beach',
      'location': 'Diu & Daman ',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b2.jpg',
      'time': '7.00 AM - 5.00 PM',
      'rate': 7.6,
      'description': 'Devka Beach, located in Daman, is a serene coastal stretch known for its picturesque views and tranquil atmosphere. Here an overview in 10 lines:Location: Devka Beach is situated in Daman, a union territory in India.',
      'price': 12000,
    },
    {
      'category': 'Beach',
      'name': 'Wandoor Beach',
      'location': 'Andaman Nicobar',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b4.jpg',
      'time': '8.00 AM - 6.00 PM',
      'rate': 5.3,
      'description': 'Wandoor Beach is a scenic coastal destination located in the Andaman and Nicobar Islands, India, renowned for its natural beauty and marine biodiversity. Here a concise overview in 10 lines:Location.',
      'price': 15000,
    },
    {
      'category': 'Beach',
      'name': 'Marina Beach',
      'location': 'Chennai',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b5.webp',
      'time': '7.00 AM - 6.00 PM',
      'rate': 7.1,
      'description': 'Marina Beach, located in Chennai, Tamil Nadu, India, is an iconic urban beach along the Bay of Bengal, renowned for its vast expanse and cultural significance. Here’s an overview in 10 lines:Length: Marina Beach spans approximately 13 kilometers, making it one of the longest natural urban beaches in the world.',
      'price': 18000,
    },
    {
      'category': 'Beach',
      'name': 'Serenity Beach',
      'location': 'Puducherry',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b6.jpeg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.9,
      'description': 'Serenity Beach is a tranquil and secluded coastal stretch located in the town of Pondicherry (Puducherry), India. It is known for its serene ambiance, golden sands, and clear blue waters, making it a peaceful retreat away from the hustle and bustle of city life.',
      'price': 16500,
    },
    {
      'category': 'Beach',
      'name': 'Kavaratti Beach',
      'location': 'lakshdrip ',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b7.webp',
      'time': '7.00 AM - 8.00 PM',
      'rate': 7.6,
      'description': 'Kavaratti Beach is a pristine coastal destination located in Kavaratti, the capital of the Union Territory of Lakshadweep in India. It features white sandy shores, turquoise waters, and coral reefs, making it an ideal spot for snorkeling and diving. The beach offers a serene ambiance with swaying palm trees and gentle waves, perfect for relaxation and leisure activities.',
      'price': 11500,
    },
    {
      'category': 'Beach',
      'name': 'Anjuna Beach',
      'location': 'North Goa',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b8.jpg',
      'time': '9.00 AM - 5.00 PM',
      'rate': 9.2,
      'description': 'Anjuna Beach, located in North Goa, India, is famous for its picturesque shoreline, rocky cliffs, and vibrant atmosphere. Once a hippie hangout in the 1960s, it retains its bohemian charm with lively beach parties and a bustling Wednesday flea market offering local crafts and souvenirs. ',
      'price': 8500,
    },
    {
      'category': 'Beach',
      'name': 'Malvan Beach',
      'location': 'Sindhudurg',
      'img': 'assets/images/CategoryWiseImages/BeachImages/b9.webp',
      'time': '8.00 AM - 7.00 PM',
      'rate': 7.9,
      'description': 'Malvan Beach is a serene coastal retreat located in Malvan, a town in the Sindhudurg district of Maharashtra, India. Known for its pristine shores and clear blue waters, Malvan Beach offers a tranquil escape away from the hustle and bustle of city life. The beach is characterized by its golden sands, gentle waves, and coconut palms lining the shoreline.',
      'price': 12000,
    }
  ],
  //todo-----------------------------------------> Ancient Place
  [
    {
      'category': 'Ancient Place',
      'name': 'Taj Mahal',
      'location': 'Agra',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a1.jpeg',
      'time': '7.00 AM - 9.00 PM',
      'rate': 5.3,
      'description': 'The Taj Mahal is an iconic monument located in Agra, India, renowned as a symbol of love and one of the Seven Wonders of the World. Built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal, it is celebrated for its exquisite white marble architecture, intricate carvings, and symmetrical gardens.',
      'price': 8000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Qutub Minar',
      'location': 'Delhi',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a2.jpg',
      'time': '7.00 AM - 10.00 PM',
      'rate': 5.6,
      'description': 'Qutub Minar is a UNESCO World Heritage site located in Delhi, India, renowned for its historical and architectural significance. Here a short overview:Qutub Minar is the tallest brick minaret in the world, standing at a height of 73 meters (240 feet) with five distinct storeys, each marked by intricately carved balconies.',
      'price': 7000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Jallianwala bagh',
      'location': 'Punjab',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a4.webp',
      'time': '8.00 AM - 6.00 PM',
      'rate': 5.3,
      'description': 'Jallianwala Bagh, located in Amritsar, Punjab, India, is a historical public garden that bears witness to a tragic event in India struggle for independence. On April 13, 1919, British troops under Colonel Reginald Dyer fired indiscriminately on a crowd of unarmed civilians who had gathered at the garden for a peaceful protest against colonial laws.',
      'price': 15000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Buland darwaza',
      'location': 'Fatehpur sikri',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a5.webp',
      'time': '7.00 AM - 6.00 PM',
      'rate': 7.1,
      'description': 'Buland Darwaza, meaning "High Gate," is a grand gateway located in Fatehpur Sikri, near Agra, India. Here  a concise overview:Buland Darwaza is an imposing structure built by Emperor Akbar in 1576 to commemorate his conquest of Gujarat.It stands at a height of 54 meters (177 feet) and is made of red sandstone with intricate marble inlays and carvings.',
      'price': 9000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Humpi',
      'location': 'Karnataka',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a6.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.9,
      'description': 'Hampi is an ancient and UNESCO World Heritage-listed site located in the state of Karnataka, India. Here a brief overview:Hampi was once the prosperous capital of the Vijayanagara Empire, one of the greatest Hindu kingdoms in Indian history, flourishing from the 14th to the 16th centuries.',
      'price': 6500,
    },
    {
      'category': 'Ancient Place',
      'name': 'Sanchi',
      'location': 'Madhya Pradesh ',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a7.webp',
      'time': '7.00 AM - 8.00 PM',
      'rate': 3.7,
      'description': 'Sanchi is a significant Buddhist site located in Madhya Pradesh, India, known for its ancient stupas, monasteries, temples, and pillars dating back to the Mauryan period and beyond. Here a concise overview:Historical Significance.',
      'price': 6000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Mohenjo-daro',
      'location': 'Sindh',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a8.jpg',
      'time': '9.00 AM - 5.00 PM',
      'rate': 11.2,
      'description': 'Mohenjo-daro is an ancient archaeological site located in the Sindh province of Pakistan, dating back to the Bronze Age Indus Valley Civilization. Here’s a concise overview Mohenjo-daro, meaning "Mound of the Dead," was one of the largest settlements of the Indus Valley Civilization, flourishing around 2500 BCE to 1900 BCE It was rediscovered in the 1920s.',
      'price': 10500,
    },
    {
      'category': 'Ancient Place',
      'name': 'Char Minar',
      'location': 'Hyderabad',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a9.jpg',
      'time': '8.00 AM - 7.00 PM',
      'rate': 8.6,
      'description': 'char minar short noteCharminar is a historic monument located in Hyderabad, Telangana, India, renowned for its distinctive architecture and cultural significance. Here’s a brief overview:Architecture: Charminar, meaning "Four Minarets," was built in 1591 by Sultan Muhammad Quli Qutb Shah.',
      'price': 9000,
    },
    {
      'category': 'Ancient Place',
      'name': 'Khajuraho Temple',
      'location': 'Madhya Pradesh',
      'img': 'assets/images/CategoryWiseImages/AncientImages/a3.jpg',
      'time': '7.00 AM - 5.00 PM',
      'rate': 6.4,
      'description': 'Khajuraho Temples are a group of ancient Hindu and Jain temples located in Madhya Pradesh, India, known for their intricate and erotic sculptures. Here a concise overview:Historical Significance: Built between 950 and 1050 CE by the Chandela dynasty, the temples are renowned for their exquisite architecture and detailed sculptures.',
      'price': 7000,
    }
  ],
  //todo-----------------------------------------> Nature & Wildlife
  [
    {
      'category': 'Nature & Wildlife',
      'name': 'Daintree Rainforest',
      'location': 'Australia',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Australia/Daintree Rainforest.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.4,
      'description':
          'In Australia north, where emerald canopies rise,Daintree Rainforest, ancient and wise, A verdant kingdom, untouched and grand, Where life teems in every leaf and strand.',
      'price': 19000,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Chobe National Park',
      'location': 'Botswana',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Botswana/Chobe National Park.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 5.4,
      'description':
          "In Botswana embrace, where the rivers flow,Chobe National Park, where wild wonders grow,Savannah stretches under the African sky,Where elephants roam, majestic and high.",
      'price': 16500,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Algonquin Provincial Park',
      'location': 'Canada',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Canada/Algonquin Provincial Park.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 6.5,
      'description':
          "In Canadas heart, where wilderness reigns,Algonquin Provincial Park, nature's domains.Lakes mirror pines in their tranquil embrace,Echoes of loons across quiet space.",
      'price': 17000,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Lauca National Park',
      'location': 'Chile',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Chile/Lauca National Park.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.5,
      'description':
          "In Chile's northern expanse, where the Andes soar,Lauca National Park, wild and pure.Volcanic peaks pierce the azure sky, High-altitude lakes reflect mountains high",
      'price': 12500,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Podocarpus National Park',
      'location': 'Ecuador',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Ecuador/Podocarpus National Park.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 7.4,
      'description':
          "In Ecuador's embrace, where biodiversity thrives,Podocarpus National Park, where nature thrives.Cloud forests cloak mountains in misty veils,Podocarpus, where diversity prevails.",
      'price': 10000,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Chitwan National Park',
      'location': 'Nepal',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Nepal/Chitwan National Park.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.4,
      'description':
          'In Nepal embrace, where jungles unfold,Chitwan National Park, a sanctuary bold.Rhinos roam freely in marshlands wide,Tigers prowl silently, their grace undenied.',
      'price': 8000,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Addo Elephant National Park',
      'location': 'South Africa',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/South Africa/i1.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 5.4,
      'description':
          "In South Africa's realm, where the sun's rays play,Addo Elephant National Park, where giants sway.Herds of elephants traverse the dusty plains,Their presence a testament to nature's reigns.",
      'price': 9000,
    },
    {
      'category': 'Nature & Wildlife',
      'name': 'Lake Manyara National Park',
      'location': 'Tanzania',
      'img':
          'assets/images/CategoryWiseImages/Nature & Wildlife/Tanzania/i1.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 8.5,
      'description':
          "In Tanzania's embrace, where the Rift Valley begins,Lake Manyara National Park, where nature's beauty wins.Acacia trees stretch with elegant grace,Reflecting in the lake's tranquil embrace.",
      'price': 11000,
    },
  ],
  //todo-----------------------------------------> Cultural
  [
    {
      'category': 'Foreign',
      'name': 'Athens',
      'location': 'Greece',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Athens Greece/i1.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 6.4,
      'description':
          "Athens stands as a living testament to the enduring legacy of ancient Greece and its profound impact on Western civilization, attracting millions of visitors each year to experience its historical richness and cultural vibrancy.",
      'price': 12500,
    },
    {
      'category': 'Foreign',
      'name': 'Barcelone',
      'location': 'Spain',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Barcelona Spain/i4.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 6.4,
      'description':
          "Barcelona's dynamic blend of history, culture, art, and cuisine makes it a top destination for travelers seeking both architectural marvels and Mediterranean charm.",
      'price': 15000,
    },
    {
      'category': 'Foreign',
      'name': 'Dubai',
      'location': 'UAE',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Dubail Uae/i6.jpeg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 9.4,
      'description':
          "Dubai’s blend of futuristic architecture, cultural richness, and luxurious experiences makes it a top destination for travelers seeking glamour, adventure, and a glimpse into the Middle East's dynamic spirit.",
      'price': 1300,
    },
    {
      'category': 'Foreign',
      'name': 'Jerusalem',
      'location': 'Israel',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Jerusalem Israel/i3.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 4.4,
      'description':
          "Jerusalem's blend of ancient history, religious significance, and cultural diversity continues to make it a compelling destination for travelers and pilgrims alike, offering a profound glimpse into the shared heritage of humanity.",
      'price': 15000,
    },
    {
      'category': 'Foreign',
      'name': 'Kyoto',
      'location': 'Japan',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Kyoto, Japan/i3.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 5.4,
      'description':
          "Kyoto's blend of ancient traditions, historical landmarks, and natural beauty continues to attract visitors from around the world, offering a glimpse into Japan's rich cultural heritage and serene landscapes.",
      'price': 14000,
    },
    {
      'category': 'Foreign',
      'name': 'Mexico City',
      'location': 'Mexico',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Mexico City Mexico/Palacio de Bellas Artes.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 9.4,
      'description':
          "Mexico City's blend of ancient history, colonial architecture, vibrant culture, and modern amenities makes it a captivating destination for travelers seeking a dynamic and diverse urban experience in the heart of Mexico.",
      'price': 17000,
    },
    {
      'category': 'Foreign',
      'name': 'Roman',
      'location': 'Italy',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/Rome Italy/Piazza Navona.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 6.4,
      'description':
          "The legacy of ancient Rome continues to shape our understanding of law, governance, culture, and urban development, making it a pivotal civilization in Western history and global influence.",
      'price': 16000,
    },
    {
      'category': 'Foreign',
      'name': 'Varansi',
      'location': 'India',
      'img':
          'assets/images/CategoryWiseImages/CulturalImages/varansi india/Assi Ghat.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 6.4,
      'description':
          "Varanasi’s blend of spirituality, culture, and history makes it a captivating destination for travelers seeking a deep immersion into India’s rich cultural tapestry and religious traditions.",
      'price': 18000,
    },
  ],
  //todo-----------------------------------------> Family Vacation
  [
    {
      'category': 'Family Vacation',
      'name': 'Cancún',
      'location': 'Maxico',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/Maxico/Cancún.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.4,
      'description':
          "Cancún is a world-renowned tourist destination located on the northeastern coast of the Yucatán Peninsula in Mexico. Known for its beautiful white sand beaches, turquoise waters, and vibrant nightlife, Cancún attracts millions of visitors each year. ",
      'price': 14000,
    },
    {
      'category': 'Family Vacation',
      'name': 'Bnaff',
      'location': 'Canada',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/Canada/bnaff.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.4,
      'description':
          "This is Canada's oldest national park, established in 1885. It covers over 6,600 square kilometers (2,564 square miles) of mountainous terrain, with glaciers, ice fields, dense coniferous forest, and alpine landscapes.",
      'price': 16000,
    },
    {
      'category': 'Family Vacation',
      'name': 'Toronto',
      'location': 'Canada',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/Canada/Toronto.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 10,
      'description':
          "Toronto is the capital city of the province of Ontario and the largest city in Canada. It is known for its vibrant cultural scene, diverse population, and economic significance.",
      'price': 9000,
    },
    {
      'category': 'Family Vacation',
      'name': 'barcelona',
      'location': 'Spain',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/spain/barcelona.jpg',
      'time': '7.00 AM - 7.00 PM',
      'rate': 9.8,
      'description':
          "Barcelona is a vibrant and cosmopolitan city located on the northeastern coast of Spain, along the Mediterranean Sea. Known for its unique blend of modernist architecture, rich history, cultural heritage, and lively atmosphere, Barcelona offers a wide range of attractions and experiences. ",
      'price': 12500,
    },
    {
      'category': 'Family Vacation',
      'name': 'Cape Town',
      'location': 'South Africa',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/South Africa/Cape Town.jpg',
      'time': '7.00 AM - 8.00 PM',
      'rate': 9.4,
      'description':
          "Cape Town is a vibrant city located on the southwestern coast of South Africa, often described as one of the most beautiful cities in the world.",
      'price': 11000,
    },
    {
      'category': 'Family Vacation',
      'name': 'Queenstown',
      'location': 'New Zealand',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/New zeland/Queenstown.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.4,
      'description':
          "Queenstown is a resort town located on the South Island of New Zealand, nestled on the shores of Lake Wakatipu and surrounded by the dramatic Southern Alps. Known as the Adventure Capital of the World, Queenstown attracts visitors with its stunning landscapes, outdoor activities, and vibrant atmosphere.",
      'price': 11000,
    },
    {
      'category': 'Family Vacation',
      'name': 'Statue of Liberty',
      'location': 'USA',
      'img':
          'assets/images/CategoryWiseImages/Family Vaction Images/New york/statue of unity.jpg',
      'time': '7.00 AM - 6.00 PM',
      'rate': 9.4,
      'description':
          "Queenstown is a resort town located on the South Island of New Zealand, nestled on the shores of Lake Wakatipu and surrounded by the dramatic Southern Alps. Known as the Adventure Capital of the World, Queenstown attracts visitors with its stunning landscapes, outdoor activities, and vibrant atmosphere.",
      'price': 12000,
    },
  ],
];
