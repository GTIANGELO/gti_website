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
      title: 'Educational Software',
      contentHeader: 'Educational Software',
      contentText:
          'We create engaging and interactive educational software that enhances learning experiences and improves outcomes for students and educators alike.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon2.png',
      title: 'Healthcare Software',
      contentHeader: 'Healthcare Software',
      contentText:
          'We develop smart healthcare software that streamlines medical processes, improves patient care, and simplifies data management for healthcare providers.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon3.png',
      title: 'Web Service Design and Development',
      contentHeader: 'Web Service Design and Development',
      contentText:
          'We craft powerful and scalable web services that enable seamless online interactions, data exchange, and integration across platforms and devices.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon4.png',
      title: 'Database Design and Optimization',
      contentHeader: 'Database Design and Optimization',
      contentText:
          'We build efficient, scalable databases and optimize them to deliver fast performance, reliable access, and seamless data management for your business.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon5.png',
      title: 'Application Development and Maintenance',
      contentHeader: 'Application Development and Maintenance',
      contentText:
          'We develop tailored applications that meet your business goals and provide ongoing maintenance to keep them running smoothly, securely, and efficiently.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon6.png',
      title: 'Co-development',
      contentHeader: 'Co-development',
      contentText:
          'We collaborate closely with your team through co-development to accelerate project delivery, share expertise, and build high-quality software together.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon7.png',
      title: 'Custom Development',
      contentHeader: 'Custom Development',
      contentText:
          'We deliver custom software solutions built specifically around your unique business needs, ensuring flexibility, scalability, and a perfect fit for your goals.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon8.png',
      title: 'Architecture Consulting',
      contentHeader: 'Architecture Consulting',
      contentText:
          'We provide expert architecture consulting to design scalable, secure, and efficient system structures that support your long-term technology strategy.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon9.png',
      title: 'E-Business',
      contentHeader: 'E-Business',
      contentText:
          'We create innovative e-business solutions that help you streamline operations, engage customers online, and grow your digital presence effectively.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon10.png',
      title: 'Hand Held Development, Games and Applications',
      contentHeader: 'Hand Held Development, Games and Applications',
      contentText:
          'We design and develop engaging handheld games and applications that deliver seamless performance and immersive experiences on mobile and portable devices.',
    ),
    ServiceItem(
      iconPath: 'assets/list_of_services/icon11.png',
      title: 'Client Server Application Development',
      contentHeader: 'Client Server Application Development',
      contentText:
          'We build robust client-server applications that ensure reliable communication, secure data exchange, and efficient performance across distributed systems.',
    ),
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

  static const sitemapItems = [
    {
      'header': 'Company',
      'links': [
        {'label': 'Overview', 'path': '/company/overview'},
        {'label': 'Partner', 'path': '/company/partner'},
        {'label': 'Philosophy', 'path': '/company/philosophy'},
        {'label': 'Milestone', 'path': '/company/milestone'},
        {'label': 'Careers & Opportunity', 'path': '/company/careers'},
      ],
    },
    {
      'header': 'Outsourcing',
      'links': [
        {'label': 'Why GTI?', 'path': '/outsourcing/why-gti'},
        {'label': 'Outsourcing Model', 'path': '/outsourcing/model'},
        {'label': 'Benefits and Opportunity', 'path': '/outsourcing/benefits'},
      ],
    },
    {
      'header': 'Services',
      'links': [
        {'label': 'Overview', 'path': '/services/overview'},
        {'label': 'Co-Development', 'path': '/services/co-development'},
        {'label': 'Custom Development', 'path': '/services/custom'},
        {'label': 'Maintenance', 'path': '/services/maintenance'},
        {'label': 'Porting', 'path': '/services/porting'},
      ],
    },
    {
      'header': 'Sectors',
      'links': [
        {'label': 'Overview', 'path': '/sectors/overview'},
        {'label': 'Educational', 'path': '/sectors/educational'},
        {'label': 'Healthcare', 'path': '/sectors/healthcare'},
        {'label': 'Web Services', 'path': '/sectors/web-services'},
        {'label': 'Interactive/Creative', 'path': '/sectors/interactive'},
      ],
    },
    {
      'header': 'Skills',
      'links': [
        {'label': 'Overview', 'path': '/skills/overview'},
        {'label': 'Windows', 'path': '/skills/windows'},
        {'label': 'Web Technology', 'path': '/skills/web-tech'},
        {'label': 'Database', 'path': '/skills/database'},
        {'label': 'Hand-held', 'path': '/skills/handheld'},
        {'label': 'E-learning', 'path': '/skills/e-learning'},
      ],
    },
    {
      'links': [
        {'label': 'Home', 'path': '/'},
        {'label': 'Customer', 'path': '/customer'},
        {'label': 'Contacts', 'path': '/contacts'},
      ],
    },
  ];
}
