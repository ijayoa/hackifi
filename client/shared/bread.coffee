Template.breadcrumb.helpers
	getCurrentRouteName: () ->
		routerName = Router.current().route.getName()
		return routerName.replace(/([A-Z])/g, ' $1').replace /^./, (str) ->
        str.toUpperCase()
		