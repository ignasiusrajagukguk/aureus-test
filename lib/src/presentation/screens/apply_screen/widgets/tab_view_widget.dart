import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/text_fields/text_form_field.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';

class TabViewWidgets {
  static Widget documents(
    BuildContext context,
  ) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Heading.h4Bold('Resume'),
                  SeparatorWidget.height12(),
                  const BodyText.xSmall(
                      'Remember to include your most updated resume')
                ],
              ),
            ),
            const Icon(
              Icons.add,
              size: 28,
              color: ConstColors.dark80,
            )
          ],
        ),
        SeparatorWidget.height12(),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ConstColors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.file_present_sharp,
                size: 35,
                color: ConstColors.basicBackground,
              ),
              SeparatorWidget.width8(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText.size13Bold(
                    'My Resume.pdf',
                    color: ConstColors.basicBackground,
                  ),
                  BodyText.size13Regular(
                    '11/06/22',
                    color: ConstColors.basicBackground,
                  )
                ],
              )
            ],
          ),
        ),
        SeparatorWidget.height20(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Heading.h4Bold('Cover Letter'),
                  SeparatorWidget.height12(),
                  const BodyText.xSmall('Stand out with your cover letter')
                ],
              ),
            ),
            const Icon(
              Icons.add,
              size: 28,
              color: ConstColors.dark80,
            )
          ],
        ),
        SeparatorWidget.height12(),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ConstColors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.file_present_sharp,
                size: 35,
                color: ConstColors.basicBackground,
              ),
              SeparatorWidget.width8(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText.size13Bold(
                    'My Cover Letter.pdf',
                    color: ConstColors.basicBackground,
                  ),
                  BodyText.size13Regular(
                    '11/06/22',
                    color: ConstColors.basicBackground,
                  )
                ],
              )
            ],
          ),
        ),
        SeparatorWidget.height20(),
      ],
    );
  }

  static Widget education(
    BuildContext context, {
    required TextEditingController schoolNameC,
    required TextEditingController courseC,
    required TextEditingController yearC,
  }) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Heading.h4Bold('Education'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BodyText.size13Regular('Included in resume'),
            Switch(
              value: true,
              activeColor: ConstColors.orange,
              onChanged: (bool value) {},
            )
          ],
        ),
        SeparatorWidget.height12(),
        TextFormFieldWidget.textWithLabelHeight40(
          'Name of school',
          'Name of school',
          controller: schoolNameC,
          onChanged: (value) {},
        ),
        SeparatorWidget.height20(),
        TextFormFieldWidget.textWithLabelHeight40(
          'Course of study',
          'Course of study',
          controller: schoolNameC,
          onChanged: (value) {},
        ),
        SeparatorWidget.height20(),
        TextFormFieldWidget.textWithLabelHeight40(
          'Year graduated',
          'Year graduated',
          controller: schoolNameC,
          keyboardType: TextInputType.number,
          onChanged: (value) {},
        ),
        SeparatorWidget.height20(),
        const Heading.h4Bold('Work Experience'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BodyText.size13Regular('Included in resume'),
            Switch(
              value: true,
              activeColor: ConstColors.orange,
              onChanged: (bool value) {},
            )
          ],
        ),
        SeparatorWidget.height12(),
        const Heading.h4Bold('Additional Skills'),
        SeparatorWidget.height10(),
        TextFormFieldWidget.searchCustom(
          'Search Skill',
          backgroundColor: ConstColors.white.withOpacity(0.1),
        ),
        SeparatorWidget.height10(),
      ],
    );
  }

  static Widget profilePreview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
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
          Center(
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                    height: 100,
                    width: 100,
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
          SeparatorWidget.height12(),
          const BodyText.dfltBold(
            'Additional Skill',
            color: ConstColors.gray30,
          ),
          SeparatorWidget.height6(),
          Row(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: ConstColors.basicBackground,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: ConstColors.dark80, width: 2)),
                  child: const BodyText.size13Bold('Figma')),
            ],
          ),
        ],
      ),
    );
  }
}
