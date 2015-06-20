Meteor.methods
    sendFeedback: (doc) ->
      Feedbacks.insert doc

    dbInsertParticipant: (doc) ->
      Participants.insert doc

    insertRegistration: (doc) ->
      Participants.insert doc
      
    insertSubmission: (doc) ->
      Submissions.insert doc

    insertJudge: (doc) ->
      Judges.insert doc

    insertCriteria: (doc) ->
      Criteria.insert doc

    insertScore: (criteriaId, score, hackathon, submissionId) ->
        doc = Scores.findOne(criteriaId: criteriaId)
        if typeof doc == 'undefined'
          Scores.insert {
            score: score
            submissionId: submissionId
            hackathon: hackathon
            criteriaId: criteriaId
            scoreTimes: 1
            accumulatedScores: score
          }, (err, id) ->
        else
          scoreTimes = doc.scoreTimes
          accumulatedScores = doc.accumulatedScores
          actualScore = accumulatedScores / scoreTimes
          roundedScore = Math.round(actualScore)
          Scores.update { _id: doc._id },
            $set: score: roundedScore
            $inc:
              scoreTimes: 1
              accumulatedScores: score


