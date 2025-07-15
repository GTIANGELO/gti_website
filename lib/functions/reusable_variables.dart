import 'package:gti_website/widgets/gti_software_brings.dart';
import 'package:gti_website/widgets/list_of_services.dart';

class Variables {
  static const navItemsTop = [
    {'label': 'HOME', 'route': '/'},
    {'label': 'SITEMAP', 'route': '/sitemap'},
    {'label': 'CONTACT', 'route': '/contact'},
  ];

  static const navItemsDropdown = [
    {
      'label': 'COMPANY',
      'items': [
        {'label': 'Overview', 'route': '/company/overview'},
        {'label': 'Philosophy', 'route': '/company/milestone'},
        {'label': 'Milestones', 'route': '/company/philosophy'},
        {'label': 'Partner', 'route': '/company/philosophy'},
        {'label': 'Careers & Opportunity', 'route': '/company/philosophy'},
      ],
    },
    {
      'label': 'OUTSOURCING',
      'items': [
        {'label': 'Why GTI?', 'route': '/help/support'},
        {'label': 'Outsourcing Model', 'route': '/help/faq'},
        {'label': 'Benefits and Opportunity', 'route': '/help/faq'},
      ],
    },
    {
      'label': 'SERVICES',
      'items': [
        {'label': 'Overview', 'route': '/help/support'},
        {'label': 'Co-development', 'route': '/help/faq'},
        {'label': 'Custom Development', 'route': '/help/faq'},
        {'label': 'Maintenance', 'route': '/help/faq'},
        {'label': 'Porting', 'route': '/help/faq'},
      ],
    },
    {
      'label': 'SECTORS',
      'items': [
        {'label': 'Overview', 'route': '/company/overview'},
        {'label': 'Educational', 'route': '/company/milestone'},
        {'label': 'Healthcare', 'route': '/company/philosophy'},
        {'label': 'Web Services', 'route': '/company/philosophy'},
        {'label': 'Interactive/Creative', 'route': '/company/philosophy'},
      ],
    },
    {
      'label': 'SKILLS',
      'items': [
        {'label': 'Consulting', 'route': '/services/consulting'},
        {'label': 'Web Technology', 'route': '/services/development'},
        {'label': 'Windows', 'route': '/services/development'},
        {'label': 'Database', 'route': '/services/development'},
        {'label': 'Hand-held', 'route': '/services/development'},
        {'label': 'E-learning', 'route': '/services/development'},
      ],
    },
    {
      'label': 'CUSTOMERS',
      'items': [
        {'label': 'Support', 'route': '/help/support'},
        {'label': 'FAQ', 'route': '/help/faq'},
      ],
    },
  ];

  static final List<ServiceItem> serviceItems = [
    ServiceItem(
        iconPath: 'assets/list_of_services/icon1.png',
        title: 'Educational Software'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon2.png',
        title: 'Healthcare Software'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon3.png',
        title: 'Web Service Design and Development'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon4.png',
        title: 'Database Design and Optimization'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon5.png',
        title: 'Application Development and Maintenance'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon6.png', title: 'Co-development'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon7.png',
        title: 'Custom Development'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon8.png',
        title: 'Architecture Consulting'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon9.png', title: 'E-Business'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon10.png',
        title: 'Hand Held Development, Games and Applications'),
    ServiceItem(
        iconPath: 'assets/list_of_services/icon11.png',
        title: 'Client Server Application Development'),
  ];

  static final List<BringItem> bringItems = [
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon1.png', title: 'Reduce Cost'),
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon2.png',
        title: 'Reduced design & implementation defects'),
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon3.png',
        title: 'Lessen time to market'),
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon4.png',
        title: 'Increase efficiency and competitive ability'),
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon5.png',
        title: 'Streamline product design and development'),
    BringItem(
        iconPath: 'assets/gti_sofware_brings/icon6.png',
        title: 'Skilled Professional @ 24/7'),
  ];

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/business_boosting/icon1.png',
      'header': 'SMS Integration',
      'features': [
        {'icon': "assets/verify.png", 'text': 'lorem ipsum dolor sit amet'},
        {'icon': "assets/verify.png", 'text': 'consectetur adipiscing elit'},
        {
          'icon': "assets/verify.png",
          'text': 'sed do eiusmod tempor incididunt'
        },
        {'icon': "assets/verify.png", 'text': 'Feature B'},
      ],
    },
    {
      'image': 'assets/business_boosting/icon2.png',
      'header': 'RFID & Biometrics',
      'features': [
        {'icon': "assets/verify.png", 'text': 'lorem ipsum dolor sit amet'},
        {'icon': "assets/verify.png", 'text': 'consectetur adipiscing elit'},
        {
          'icon': "assets/verify.png",
          'text': 'sed do eiusmod tempor incididunt'
        },
        {'icon': "assets/verify.png", 'text': 'Feature B'},
      ],
    },
    {
      'image': 'assets/business_boosting/icon3.png',
      'header': 'Online Enrollment',
      'features': [
        {'icon': "assets/verify.png", 'text': 'lorem ipsum dolor sit amet'},
        {'icon': "assets/verify.png", 'text': 'consectetur adipiscing elit'},
        {
          'icon': "assets/verify.png",
          'text': 'sed do eiusmod tempor incididunt'
        },
        {'icon': "assets/verify.png", 'text': 'Feature B'},
      ],
    },
    {
      'image': 'assets/business_boosting/icon4.png',
      'header': 'E-Wallet',
      'features': [
        {'icon': "assets/verify.png", 'text': 'lorem ipsum dolor sit amet'},
        {'icon': "assets/verify.png", 'text': 'consectetur adipiscing elit'},
        {
          'icon': "assets/verify.png",
          'text': 'sed do eiusmod tempor incididunt'
        },
        {'icon': "assets/verify.png", 'text': 'Feature B'},
      ],
    },
  ];

  final List<Map<String, String>> leftColumnItems = [
    {'image': 'assets/verify.png', 'text': 'Process Excellence'},
    {'image': 'assets/verify.png', 'text': 'Best technology practices'},
    {
      'image': 'assets/verify.png',
      'text': 'Technology, Domain, Business Process Leadership'
    },
    {
      'image': 'assets/verify.png',
      'text': 'Extensive Testing methodologies to ensure world class software'
    },
    {
      'image': 'assets/verify.png',
      'text': 'Strives for excellence in all areas of its business'
    },
  ];

  final List<Map<String, String>> rightColumnItems = [
    {
      'image': 'assets/verify.png',
      'text':
          'Guarantees the quality of its software products at all stages of development'
    },
    {
      'image': 'assets/verify.png',
      'text':
          'Guaranteed utmost level of quality in our operations for all clients'
    },
    {'image': 'assets/verify.png', 'text': 'On time delivery'},
    {
      'image': 'assets/verify.png',
      'text': '100% client satisfaction guaranteed'
    },
    {
      'image': 'assets/verify.png',
      'text': 'Best technology and solutions available at affordable price.'
    },
  ];

  final List<Map<String, String>> schoolautomateItems = [
    {
      'image': 'assets/verify.png',
      'text':
          'Guarantees the quality of its software products at all stages of development'
    },
    {
      'image': 'assets/verify.png',
      'text':
          'Guaranteed utmost level of quality in our operations for all clients'
    },
    {'image': 'assets/verify.png', 'text': 'On time delivery'},
    {
      'image': 'assets/verify.png',
      'text': '100% client satisfaction guaranteed'
    },
    {
      'image': 'assets/verify.png',
      'text': 'Best technology and solutions available at affordable price.'
    },
  ];

  final List<String> imagePaths = [
    'assets/client_logos/HSS.png',
    'assets/client_logos/JCFC.png',
    'assets/client_logos/LCCB.png',
    'assets/client_logos/CHST.png',
    'assets/client_logos/LCUP.png',
    'assets/client_logos/LDCU.png',
    'assets/client_logos/LSU.png',
    'assets/client_logos/MPCF.png',
    'assets/client_logos/HSA.png',
    'assets/client_logos/SBC.jpeg',
    'assets/client_logos/STIWNU.png',
    'assets/client_logos/VMUF.png',
    'assets/client_logos/HTC.png',
    'assets/client_logos/WUPA.png',
    'assets/client_logos/WUPC.png',
    'assets/client_logos/BFH.png',
  ];

  final List<Map<String, String>> comments = [
    {
      "text":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "user": "John Doe",
      "image": "assets/client_logos/STIWNU.png",
      "position": "MIS Manager - STI West Negros University",
    },
    {
      "text":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "user": "Jane Smith",
      "image": "assets/client_logos/STIWNU.png",
      "position": "MIS Manager - STI West Negros University",
    },
    {
      "text":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "user": "Robert Lee",
      "image": "assets/client_logos/STIWNU.png",
      "position": "MIS Manager - STI West Negros University",
    },
    {
      "text":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "user": "Emily Clark",
      "image": "assets/client_logos/STIWNU.png",
      "position": "MIS Manager - STI West Negros University",
    },
    {
      "text":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "user": "Daniel Kim",
      "image": "assets/client_logos/STIWNU.png",
      "position": "MIS Manager - STI West Negros University",
    },
  ];

  static const faqQuestions = [
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vel nulla at sapien fringilla fermentum.',
    },
    {
      'question': 'Curabitur non nulla sit amet nisl tempus?',
      'answer':
          'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla quis lorem ut libero malesuada feugiat.',
    },
    {
      'question': 'Quisque velit nisi pretium ut lacinia?',
      'answer':
          'Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada.',
    },
    {
      'question': 'Vivamus suscipit tortor eget felis porttitor?',
      'answer':
          'Vivamus suscipit tortor eget felis porttitor volutpat. Praesent sapien massa, convallis a pellentesque nec.',
    },
    {
      'question': 'Donec sollicitudin molestie malesuada?',
      'answer':
          'Donec sollicitudin molestie malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',
    },
  ];
}
