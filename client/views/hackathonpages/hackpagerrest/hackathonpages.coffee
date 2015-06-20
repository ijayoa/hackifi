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

  Template.addscore.created = ->
      instance = this
      # initialize the reactive variables
      instance.score = new ReactiveVar(0)
      instance.criteriaId = new ReactiveVar('criteriaId')
      instance.submissionId = new ReactiveVar('submissionId')
      instance.hackathon = new ReactiveVar('hackathon')
      instance.autorun ->
        # get the score and other values
        score = instance.score.get()
        criteriaId = instance.criteriaId.get()
        submissionId = instance.submissionId.get()
        hackathon = instance.hackathon.get()
        Meteor.call 'insertScore', criteriaId, score, hackathon, submissionId, (err, result) ->
          if err
            console.log err
          else
            console.log result
          return
        return
      return


    Template.addscore.rendered = ->
      $this = this
      score = $this.score.get()
      criteriaId = $this.criteriaId.get()
      submissionId = $this.submissionId.get()
      hackathon = $this.hackathon.get()
      $('.ui.star.rating').rating 'setting', 'onRate', (value) ->
          $this.score.set value
          $this.criteriaId.set this.getAttribute('data-crit-id')
          $this.submissionId.set this.getAttribute('data-sub-id')
          $this.hackathon.set this.getAttribute('data-hack-id')
      return  

  

  