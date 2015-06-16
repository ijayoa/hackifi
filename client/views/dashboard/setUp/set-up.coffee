AutoForm.hooks
  insertHackathonForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Hackathon was successfully created'
      Router.go 'createHackathon'
    onError: (formType, error) ->
      console.log 'error'
  updateHackathonForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Hackathon was successfully updated'
      Router.go 'createHackathon'
    onError: (formType, error) ->
      console.log 'error'



Template.createHackathon.rendered = () ->
  if Hackathons.findOne({owner:Meteor.userId()})
    Session.set 'exists', true
    sAlert.info 'Add sponsors next!'



