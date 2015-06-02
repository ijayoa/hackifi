AutoForm.hooks
  insertMentorForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Mentor was successfully added'
      Router.go 'allMentors'
    onError: (formType, error) ->
      console.log 'error'

Template.addMentor.rendered = () ->
	sAlert.info 'You can add more than one mentor'

