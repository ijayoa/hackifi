Template.dashboardlayout.rendered = () ->
  $('.navbar').css('margin-bottom',0)
  # $('.navbar').addClass('navbar-fixed')

Template.dashboardlayout.helpers
  user: ->
    Meteor.users.findOne(Meteor.userId())
  email: ->
    user = Meteor.users.findOne(Meteor.userId())
    emailAdd = user.emails[0].address
    emailAdd = emailAdd.split('@')
    return emailAdd[0]