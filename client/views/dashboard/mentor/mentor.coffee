AutoForm.hooks
  insertMentorForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Mentor was successfully added'
      Router.go 'allMentors'
    onError: (formType, error) ->
      console.log 'error'

AutoForm.hooks
  updateMentorForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Mentor was successfully updated'
      Router.go 'allMentors'
    onError: (formType, error) ->
      console.log 'error'

Template.addMentor.rendered = () ->
	sAlert.info 'You can add more than one mentor'

# Template.allMentors.events
# 	'click .js-edit-mentor': (evt) ->
# 		console.log 'got here'
# 		Router.go 'updateMentor'
