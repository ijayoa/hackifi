AutoForm.hooks
  insertCriteriaForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Criteria was successfully added'
      Router.go 'allCriterias'
    onError: (formType, error) ->
      console.log 'error'
    formToDoc: (doc, ss, formId) ->
      hid = Session.get 'hackathon'
      id = hid._id
      doc.hackathon = id
      return doc

  updateCriteriaForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Criteria was successfully updated'
      Router.go 'allCriterias'
    onError: (formType, error) ->
      sAlert.error 'Update failed'
