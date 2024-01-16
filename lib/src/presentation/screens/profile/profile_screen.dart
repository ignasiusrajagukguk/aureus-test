
import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/job-portal-36fdd.appspot.com/o/lippo.jpg?alt=media&token=a8dba742-fd9b-40c3-b2a1-486662b72c37',
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ConstColors.dark50,
                      border: Border.all(
                          width: 3, color: ConstColors.basicBackground)),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    color: ConstColors.basicBackground,
                  ))),
            ],
          )),
          SeparatorWidget.height20(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Heading.h5XW500('Contact Info'),
              Icon(
                Icons.edit,
                color: ConstColors.dark80,
                size: 25,
              )
            ],
          ),
          SeparatorWidget.height20(),
          const BodyText.dfltBold(
            'Full Name',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          const BodyText.dflt(
            'Amara',
            color: ConstColors.dark80,
          ),
          SeparatorWidget.height12(),
          const BodyText.dfltBold(
            'email',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          const BodyText.dflt(
            'email@mail.com',
            color: ConstColors.dark80,
          ),
          SeparatorWidget.height12(),
          const BodyText.dfltBold(
            'Mobile Number',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          const BodyText.dflt(
            '+6594717281',
            color: ConstColors.dark80,
          ),
          SeparatorWidget.height12(),
          const Divider(
            thickness: 2,
            color: ConstColors.gray20,
          ),
          SeparatorWidget.height12(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Heading.h5XW500('Employment Information'),
              Icon(
                Icons.edit,
                color: ConstColors.dark80,
                size: 25,
              )
            ],
          ),
          SeparatorWidget.height20(),
          const BodyText.dfltBold(
            'Resume',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.file_present_sharp,
                size: 35,
              ),
              SeparatorWidget.width8(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText.size13Bold('My Resume.pdf'),
                  BodyText.size13Regular('11/06/22')
                ],
              )
            ],
          ),
          SeparatorWidget.height12(),
          const BodyText.dfltBold(
            'Cover Letter',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.file_present_sharp,
                size: 35,
              ),
              SeparatorWidget.width8(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText.size13Bold('My Cover Letter.pdf'),
                  BodyText.size13Regular('11/06/22')
                ],
              )
            ],
          ),
          SeparatorWidget.height50(),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
              },
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                  color: ConstColors.gray30, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout,
                          color: ConstColors.basicBackground,
                          size: 22,
                        ),
                        SeparatorWidget.width6(),
                        const BodyText.dfltBold(
                          'Log Out',
                          color: ConstColors.basicBackground,
                        )
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
