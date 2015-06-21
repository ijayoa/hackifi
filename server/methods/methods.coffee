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

    removeScores: ->
      Scores.remove({})

    insertScore: (criteriaId, score, hackathon, submissionId, judgeId) ->
        #check if there is an existing score, if not do an insert, else do an update
        #ISSUE, a default insert is done before the actual insert.
        #not sure why, but its not a problem cos functionality is not affected
        doc = Scores.findOne(
                criteriaId: criteriaId
                submissionId: submissionId
                judgeId:judgeId)
        if typeof doc == 'undefined'
          Scores.insert {
            score: score
            submissionId: submissionId
            hackathon: hackathon
            criteriaId: criteriaId
            scoreTimes: 1
            accumulatedScores: score
            judgeId: judgeId
          }, (err, id) ->
        else
          #update the score with the average score
          scoreTimes = doc.scoreTimes + 1
          accumulatedScores = doc.accumulatedScores + score
          actualScore = accumulatedScores / scoreTimes
          roundedScore = Math.round(actualScore)
          Scores.update { _id: doc._id },
            $set: score: roundedScore
            $inc:
              scoreTimes: 1
              accumulatedScores: score


