Template.hackathonHome.rendered = () ->
	$('.navbar').css('margin-bottom',0)
  # $('.jumbotron').css('background-url','')

# Template.hackathonHome.helpers
# 	hacakthonName: () ->
# 		hdata = Session.get 'hackathon'
# 		console.log hdata.title
# 		return hdata.title

Template.hackathonHome.events
  'click #judge-login': (e, t) ->
    $('.judge-login-div').toggle()
    return
  