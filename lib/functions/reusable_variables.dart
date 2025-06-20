class Variables {
  static const kBreakpointLarge = 1024.0;
  static const kBreakpointMedium = 600.0;

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
}
