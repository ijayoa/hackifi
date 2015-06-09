AutoForm.hooks
  insertFeedbackForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Your feedback has been sent!'
    onError: (formType, error) ->
      console.log error
    formToDoc: (doc, ss, formId) ->
      hid = Session.get 'hackathon'
      id = hid._id
      console.log id
      unless id
        console.log 'in unless'
        sAlert.error 'Error, please try refreshing the page'
      else
        console.log 'out of unless'
        doc.hackathon = id
        return doc

  insertRegistrationForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Registrarion Successful!'
    onError: (formType, error) ->
      console.log error
    formToDoc: (doc, ss, formId) ->
      hid = Session.get 'hackathon'
      id = hid._id
      console.log id
      unless id
        console.log 'in unless'
        sAlert.error 'Error, please try refreshing the page'
      else
        console.log 'out of unless'
        doc.hackathon = id
        return doc

  insertSubmissionForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Submission successful'
    onError: (formType, error) ->
      console.log error
    formToDoc: (doc, ss, formId) ->
      hid = Session.get 'hackathon'
      id = hid._id
      console.log id
      unless id
        console.log 'in unless'
        sAlert.error 'Error, please try refreshing the page'
      else
        console.log 'out of unless'
        doc.hackathon = id
        return doc