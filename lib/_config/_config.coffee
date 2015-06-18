# These values get propagated through the app
# E.g. The 'name' and 'subtitle' are used in seo.coffee

@Config =

	# Basic Details
	name: 'Hackifi'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()

	# Emails
	emails:
		from: 'no-reply@' + Meteor.absoluteUrl()
		contact: 'hello' + Meteor.absoluteUrl()

	# Username - if true, users are forced to set a username
	username: false
	
	# Localisation
	defaultLanguage: 'en'
	dateFormat: 'D/M/YYYY'

	# Meta / Extenrnal content
	privacyUrl: '#'
	termsUrl: '#'

	# For email footers
	legal:
		address: 'East Legon, Accra, Ghana.'
		name: 'Hackifi'
		url: 'http://hackifi.com'

	about: 'http://hackifi.com'
	blog: 'http://blog.hackifi.com'

	socialMedia:
		facebook:
			url: 'http://facebook.com/hackifi'
			icon: 'facebook'
		twitter:
			url: 'http://twitter.com/hackifi'
			icon: 'twitter'
		github:
			url: 'http://github.com/ijayoa'
			icon: 'github'
		info:
			url: 'http://'
			icon: 'link'

	#Routes
	homeRoute: '/'
	publicRoutes: ['home']
	dashboardRoute: '/dashboard'