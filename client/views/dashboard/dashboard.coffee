Template.dashboard.helpers
	totalFeedbacks:  ->
		mydata = Hackathons.findOne({owner: Meteor.userId()})
		return Feedbacks.find(hackathon: mydata._id).count()
	totalParticipants: ->
		 mydata = Hackathons.findOne({owner: Meteor.userId()})
		 return Participants.find(hackathon: mydata._id).count()
	totalSubmissions: ->
		 mydata = Hackathons.findOne({owner: Meteor.userId()})
		 return Submissions.find(hackathon: mydata._id).count()