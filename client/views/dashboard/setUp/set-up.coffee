AutoForm.hooks
  insertHackathonForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Hackathon was successfully created'
      Router.go 'setUp'
    onError: (formType, error) ->
      console.log 'error'



Template.configureHackathon.rendered = () ->
  if  Hackathons.find(Meteor.userId).fetch()
    $('.js-able-create').attr('disabled','disabled')
    $('.js-disable-create').hide()
    $('.js-able-create').toggle 'slow'
    sAlert.success 'Add sponsors next!'






