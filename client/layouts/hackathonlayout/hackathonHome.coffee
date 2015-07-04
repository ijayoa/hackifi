Template.hackathonHome.rendered = () ->
  $('.navbar').css('margin-bottom',0)
  thisHackathon = Session.get 'thisHackathon'
  $('.sponsors').addClass 'hide' if Sponsors.find({owner:thisHackathon.owner})?
  $('.judges').addClass 'hide' if Judges.find({owner:thisHackathon.owner})?
  $('.mentors').addClass 'hide' if Mentors.find({owner:thisHackathon.owner})?
  console.log thisHackathon

Template.hackathonHome.events
  'click #judge-login': (e, t) ->
    $('.judge-login-div').toggle()
    return
  'submit #judge-login-form': (e, t) ->
    e.preventDefault()
    username = $('#j-username').val()
    password = $('#j-password').val()
    hackathonUrl = Router.current().params._id
    hackathonId = Hackathons.findOne({personalizedUrl: hackathonUrl})._id
    if isNotEmpty(username) and isNotEmpty(password) and isValidLogin(username, password, hackathonUrl)
        judge = Judges.findOne(
            hackathon: hackathonId 
            username: username 
            password: password)
        judgeId = judge._id
        Session.setAuth("AuthJudge", judgeId)
  'click .auth-sign-out': (e, t) ->
    Session.clearAuth()
    if Session.get('AuthJudge')
      location.reload()


isNotEmpty = (value) ->
  if value and value != ''
    return true
  console.log 'Please fill in all required fields.'
  false

isValidLogin = (username, password, hackathonUrl) ->
    hackathonId = Hackathons.findOne({personalizedUrl: hackathonUrl})._id
    if Judges.findOne(
            hackathon: hackathonId 
            username: username 
            password: password)
        return true
    return
  
Template.hackathonHome.helpers
  url: ->
    hd = Session.get 'thisHackathon'
    photoId = hd.coverPhoto
    img = Attachments.findOne(_id: photoId)
    url = img.url()
