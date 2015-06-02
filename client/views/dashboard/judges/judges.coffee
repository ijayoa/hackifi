AutoForm.hooks
  insertJudgeForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Judge was successfully added'
      Router.go 'allJudges'
    onError: (formType, error) ->
      console.log 'error'

Template.addJudge.rendered = () ->
    sAlert.info 'You can add more than one judge'

