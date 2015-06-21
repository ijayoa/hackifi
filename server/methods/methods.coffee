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
    	Sponsors.remove {_id: _id}

    removeMentor: (_id) ->
    	Mentors.remove {_id: _id}
    
    removeJudge: (_id) ->
    	Judges.remove {_id: _id}

    removeParticipant: (_id) ->
    	Participants.remove {_id: _id}

