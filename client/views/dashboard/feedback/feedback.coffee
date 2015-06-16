Template.allFeedback.helpers
	coverPhoto: () ->
		hdata = Hackathons.findOne(owner:Meteor.userId())
		return hdata.coverPhoto
	feedbacks: ->
		mydata = Hackathons.findOne(owner: Meteor.userId())
		Feedbacks.find(hackathon: mydata._id).fetch()


