Template.dashboard.helpers
  totalFeedbacks:  ->
    init = 0
    mydata = Hackathons.findOne({owner: Meteor.userId()})
    if mydata
      return Feedbacks.find(hackathon: mydata._id).count()
    else
      return init
  totalParticipants: ->
    init = 0
    mydata = Hackathons.findOne({owner: Meteor.userId()})
    if mydata
      return Participants.find(hackathon: mydata._id).count()
    else
      return init
  totalSubmissions: ->
    init = 0
    mydata = Hackathons.findOne({owner: Meteor.userId()})
    if mydata
      return Submissions.find(hackathon: mydata._id).count()
    else
      return init