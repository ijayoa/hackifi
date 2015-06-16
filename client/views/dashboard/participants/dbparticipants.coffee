AutoForm.hooks
  dbInsertParticipantForm:
    onSuccess: (formType, result) ->
      sAlert.success 'Registration Successful'
      Router.go 'allParticipants'
    onError: (formType, error) ->
      console.log error
    formToDoc: (doc, ss, formId) ->
      unless Hackathons.findOne({owner:Meteor.userId()})
        console.log 'in unless'
        sAlert.error 'You have not created a hackahon.'
      else
        console.log 'out of unless'
        hackathonId = Hackathons.findOne({owner:Meteor.userId()})
        console.log 'hacakthonId'
        console.log hackathonId._id
        doc.hackathon = hackathonId._id
        return doc

Template.allParticipants.helpers
  participants: ->
    mydata = Hackathons.findOne(owner: Meteor.userId())
    Participants.find(hackathon: mydata._id).fetch()

