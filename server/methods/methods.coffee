Meteor.methods
    sendFeedback: (doc) ->
      Feedbacks.insert doc

    dbInsertParticipant: (doc) ->
      Participants.insert doc

    insertRegistration: (doc) ->
      Participants.insert doc
      
    insertSubmission: (doc) ->
      Submissions.insert doc

    removeSponsor: (_id) ->
    	console.log 'read'
    	Sponsors.remove {_id: _id}
