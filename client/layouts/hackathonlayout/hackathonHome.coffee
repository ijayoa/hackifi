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
  'submit #judge-login-form': (e, t) ->
    e.preventDefault()
    username = $('#j-username').val()
    password = $('#j-password').val()
    #console.log("username: " username " password: " password)
    console.log(password)
  