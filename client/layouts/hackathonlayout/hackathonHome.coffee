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
    hackathon = Router.current().params._id
    if isNotEmpty(username) and isNotEmpty(password) and isValidLogin(username, password, hackathon)
        judge = Judges.findOne(
            hackathon: hackathon 
            username: username 
            password: password)
        judgeId = judge._id
        Session.setAuth("AuthJudge", "judgeId")


isNotEmpty = (value) ->
  if value and value != ''
    return true
  console.log 'Please fill in all required fields.'
  false

isValidLogin = (username, password, hackathon) ->
    if Judges.findOne(
            hackathon: hackathon 
            username: username 
            password: password)
        return true
    return
  