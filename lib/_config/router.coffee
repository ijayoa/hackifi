@subs = new SubsManager()

Router.configure
  layoutTemplate: "masterLayout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  trackPageView: true
  routeControllerNameConverter: "camelCase"

  onBeforeAction: ->
  	# Redirect to set username if required
    if Config.username and Meteor.userId() and not Meteor.user().username
      @redirect '/setUserName'
    @next()

Router.waitOn ->
  subs.subscribe 'user'

onAfterAction = ->
  window.scrollTo(0,0)

  # Remove modal
  $bd =  $('.modal-backdrop')
  $bd.removeClass('in')
  setTimeout ->
    $bd.remove()
  , 300

Router.onAfterAction onAfterAction

# To allow non-logged in users to access more routes, add it in the config file
Router.plugin 'ensureSignedIn', except: [
  'home'
  'atSignIn'
  'atSignUp'
  'atForgotPassword'
  'atSignOut'
  'hackathonOverview'
  'hackathonSponsors'
  'hackathonJudges'
  'hackathonMentors'
  'hackathonRegister'
  'hackathonSubmissions'
  'hackathonFeedbacks'
  'hackathonScoreboard'
  'hackathonResources'
]
