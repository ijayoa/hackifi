AutoForm.hooks
  insertSponsorForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Sponsor was successfully added'
      Router.go 'allSponsors'
    onError: (formType, error) ->
      console.log 'error'

Template.addSponsor.rendered = () ->
  sAlert.info 'You can add more than one sponsor'