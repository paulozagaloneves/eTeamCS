		var myMenu =
		[
			[null,'Home','/eTeamCS/index.jsp',null,'Aplica��es'],
			_cmSplit,
			[null,'Site',null,null,'Site Management',
				['<img src="../includes/js/ThemeOffice/config.png" />','Global Configuration','index2.php?option=com_config&hidemainmenu=1',null,'Configuration'],
				['<img src="../includes/js/ThemeOffice/language.png" />','Language Manager',null,null,'Manage languages',
  					['<img src="../includes/js/ThemeOffice/language.png" />','Site Languages','index2.php?option=com_languages',null,'Manage Languages'],
  					['<img src="../includes/js/ThemeOffice/install.png" />','Install','index2.php?option=com_installer&element=language',null,'Install Languages'],
  				],
				['<img src="../includes/js/ThemeOffice/media.png" />','Media Manager','index2.php?option=com_media',null,'Manage Media Files'],
					['<img src="../includes/js/ThemeOffice/preview.png" />', 'Preview', null, null, 'Preview',
					['<img src="../includes/js/ThemeOffice/preview.png" />','In New Window','http://localhost/mambo/index.php','_blank','http://localhost/mambo'],
					['<img src="../includes/js/ThemeOffice/preview.png" />','Inline','index2.php?option=com_admin&task=preview',null,'http://localhost/mambo'],
					['<img src="../includes/js/ThemeOffice/preview.png" />','Inline with Positions','index2.php?option=com_admin&task=preview2',null,'http://localhost/mambo'],
				],
				['<img src="../includes/js/ThemeOffice/globe1.png" />', 'Statistics', null, null, 'Site Statistics',
					['<img src="../includes/js/ThemeOffice/search_text.png" />', 'Search Text', 'index2.php?option=com_statistics&task=searches', null, 'Search Text']
				],
				['<img src="../includes/js/ThemeOffice/template.png" />','Template Manager',null,null,'Change site template',
  					['<img src="../includes/js/ThemeOffice/template.png" />','Site Templates','index2.php?option=com_templates',null,'Change site template'],
  					['<img src="../includes/js/ThemeOffice/install.png" />','Install','index2.php?option=com_installer&element=template&client=',null,'Install Site Templates'],
  					_cmSplit,
  					['<img src="../includes/js/ThemeOffice/template.png" />','Administrator Templates','index2.php?option=com_templates&client=admin',null,'Change admin template'],
  					['<img src="../includes/js/ThemeOffice/install.png" />','Install','index2.php?option=com_installer&element=template&client=admin',null,'Install Administrator Templates'],
  					_cmSplit,
  					['<img src="../includes/js/ThemeOffice/template.png" />','Module Positions','index2.php?option=com_templates&task=positions',null,'Template positions']
  				],
				['<img src="../includes/js/ThemeOffice/trash.png" />','Trash Manager','index2.php?option=com_trash',null,'Manage Trash'],
				['<img src="../includes/js/ThemeOffice/users.png" />','User Manager','index2.php?option=com_users&task=view',null,'Manage users'],
			],
			_cmSplit,
			[null,'Menu',null,null,'Menu Management',
				['<img src="../includes/js/ThemeOffice/menus.png" />','Menu Manager','index2.php?option=com_menumanager',null,'Menu Manager'],
				_cmSplit,
				['<img src="../includes/js/ThemeOffice/menus.png" />','mainmenu','index2.php?option=com_menus&menutype=mainmenu',null,''],
				['<img src="../includes/js/ThemeOffice/menus.png" />','othermenu','index2.php?option=com_menus&menutype=othermenu',null,''],
				['<img src="../includes/js/ThemeOffice/menus.png" />','topmenu','index2.php?option=com_menus&menutype=topmenu',null,''],
				['<img src="../includes/js/ThemeOffice/menus.png" />','usermenu','index2.php?option=com_menus&menutype=usermenu',null,''],
			],
			_cmSplit,
			[null,'Content',null,null,'Content Management',
				['<img src="../includes/js/ThemeOffice/edit.png" />','Content by Section',null,null,'Content Managers',
					['<img src="../includes/js/ThemeOffice/document.png" />','News', null, null,'News',
						['<img src="../includes/js/ThemeOffice/edit.png" />', 'News Items', 'index2.php?option=com_content&sectionid=1',null,null],
						['<img src="../includes/js/ThemeOffice/add_section.png" />', 'Add/Edit News Categories', 'index2.php?option=com_categories&section=1',null, null],
					],
					['<img src="../includes/js/ThemeOffice/document.png" />','Newsflashes', null, null,'Newsflashes',
						['<img src="../includes/js/ThemeOffice/edit.png" />', 'Newsflashes Items', 'index2.php?option=com_content&sectionid=2',null,null],
						['<img src="../includes/js/ThemeOffice/add_section.png" />', 'Add/Edit Newsflashes Categories', 'index2.php?option=com_categories&section=2',null, null],
					],
					['<img src="../includes/js/ThemeOffice/document.png" />','FAQs', null, null,'FAQs',
						['<img src="../includes/js/ThemeOffice/edit.png" />', 'FAQs Items', 'index2.php?option=com_content&sectionid=3',null,null],
						['<img src="../includes/js/ThemeOffice/add_section.png" />', 'Add/Edit FAQs Categories', 'index2.php?option=com_categories&section=3',null, null],
					],
				],
				_cmSplit,
				['<img src="../includes/js/ThemeOffice/edit.png" />','All Content Items','index2.php?option=com_content&sectionid=0',null,'Manage Content Items'],
  				['<img src="../includes/js/ThemeOffice/edit.png" />','Static Content Manager','index2.php?option=com_typedcontent',null,'Manage Typed Content Items'],
  				_cmSplit,
  				['<img src="../includes/js/ThemeOffice/add_section.png" />','Section Manager','index2.php?option=com_sections&scope=content',null,'Manage Content Sections'],
				['<img src="../includes/js/ThemeOffice/add_section.png" />','Category Manager','index2.php?option=com_categories&section=content',null,'Manage Content Categories'],
				_cmSplit,
  				['<img src="../includes/js/ThemeOffice/home.png" />','Frontpage Manager','index2.php?option=com_frontpage',null,'Manage Frontpage Items'],
  				['<img src="../includes/js/ThemeOffice/edit.png" />','Archive Manager','index2.php?option=com_content&task=showarchive&sectionid=0',null,'Manage Archive Items'],
			],
			_cmSplit,
			[null,'Components',null,null,'Component Management',
				['<img src="../includes/js/ThemeOffice/install.png" />','Install/Uninstall','index2.php?option=com_installer&element=component',null,'Install/Uninstall components'],
  				_cmSplit,
				['<img src="../includes/js/ThemeOffice/component.png" />','Banners',null,null,'Banner Management',
					['<img src="../includes/js/ThemeOffice/edit.png" />','Manage Banners','index2.php?option=com_banners',null,'Active Banners'],
					['<img src="../includes/js/ThemeOffice/categories.png" />','Manage Clients','index2.php?option=com_banners&task=listclients',null,'Manage Clients']
				],
				['<img src="../includes/js/ThemeOffice/user.png" />','Contacts',null,null,'Edit contact details',
					['<img src="../includes/js/ThemeOffice/edit.png" />','Manage Contacts','index2.php?option=com_contact',null,'Edit contact details'],
					['<img src="../includes/js/ThemeOffice/categories.png" />','Contact Categories','index2.php?option=categories&section=com_contact_details',null,'Manage contact categories']
				],
				['<img src="../includes/js/ThemeOffice/mass_email.png" />','Mass Mail','index2.php?option=com_massmail&hidemainmenu=1',null,'Send Mass Mail'
				],
				['<img src="../includes/js/ThemeOffice/component.png" />','News Feeds',null,null,'News Feeds Management',
					['<img src="../includes/js/ThemeOffice/edit.png" />','Manage News Feeds','index2.php?option=com_newsfeeds',null,'Manage News Feeds'],
					['<img src="../includes/js/ThemeOffice/categories.png" />','Manage Categories','index2.php?option=com_categories&section=com_newsfeeds',null,'Manage Categories']
				],
				['<img src="../includes/js/ThemeOffice/component.png" />','Polls','index2.php?option=com_poll',null,'Manage Polls'
				],
				['<img src="../includes/js/ThemeOffice/component.png" />','Syndicate','index2.php?option=com_syndicate&hidemainmenu=1',null,'Manage Syndication Settings'
				],
				['<img src="../includes/js/ThemeOffice/globe2.png" />','Web Links',null,null,'Manage Weblinks',
					['<img src="../includes/js/ThemeOffice/edit.png" />','Weblink Items','index2.php?option=com_weblinks',null,'View existing weblinks'],
					['<img src="../includes/js/ThemeOffice/categories.png" />','Weblink Categories','index2.php?option=categories&section=com_weblinks',null,'Manage weblink categories']
				],
			],
			_cmSplit,
			[null,'Modules',null,null,'Module Management',
				['<img src="../includes/js/ThemeOffice/install.png" />', 'Install/Uninstall', 'index2.php?option=com_installer&element=module', null, 'Install custom modules'],
				_cmSplit,
				['<img src="../includes/js/ThemeOffice/module.png" />', 'Site Modules', "index2.php?option=com_modules", null, 'Manage Site modules'],
				['<img src="../includes/js/ThemeOffice/module.png" />', 'Administrator Modules', "index2.php?option=com_modules&client=admin", null, 'Manage Administrator modules'],
			],
			_cmSplit,
			[null,'Mambots',null,null,'Mambot Management',
				['<img src="../includes/js/ThemeOffice/install.png" />', 'Install/Uninstall', 'index2.php?option=com_installer&element=mambot', null, 'Install custom mambot'],
				_cmSplit,
				['<img src="../includes/js/ThemeOffice/module.png" />', 'Site Mambots', "index2.php?option=com_mambots", null, 'Manage Site Mambots'],
			],
			_cmSplit,
			[null,'Installers',null,null,'Installer List',
				['<img src="../includes/js/ThemeOffice/install.png" />','Templates - Site','index2.php?option=com_installer&element=template&client=',null,'Install Site Templates'],
				['<img src="../includes/js/ThemeOffice/install.png" />','Templates - Admin','index2.php?option=com_installer&element=template&client=admin',null,'Install Administrator Templates'],
				['<img src="../includes/js/ThemeOffice/install.png" />','Languages','index2.php?option=com_installer&element=language',null,'Install Languages'],
				_cmSplit,
				['<img src="../includes/js/ThemeOffice/install.png" />', 'Components','index2.php?option=com_installer&element=component',null,'Install/Uninstall Components'],
				['<img src="../includes/js/ThemeOffice/install.png" />', 'Modules', 'index2.php?option=com_installer&element=module', null, 'Install/Uninstall Modules'],
				['<img src="../includes/js/ThemeOffice/install.png" />', 'Mambots', 'index2.php?option=com_installer&element=mambot', null, 'Install/Uninstall Mambots'],
			],
			_cmSplit,
  			[null,'Messages',null,null,'Messaging Management',
  				['<img src="../includes/js/ThemeOffice/messaging_inbox.png" />','Inbox','index2.php?option=com_messages',null,'Private Messages'],
  				['<img src="../includes/js/ThemeOffice/messaging_config.png" />','Configuration','index2.php?option=com_messages&task=config&hidemainmenu=1',null,'Configuration']
  			],
			_cmSplit,
  			[null,'System',null,null,'System Management',
				['<img src="../includes/js/ThemeOffice/checkin.png" />', 'Global Checkin', 'index2.php?option=com_checkin', null,'Check-in all checked-out items'],
			],
			_cmSplit,
			[null,'Help','index2.php?option=com_admin&task=help',null,null]
		];