Template.allFeedback.helpers
	coverPhoto: () ->
		hdata = Hackathons.findOne(owner:Meteor.userId())
		return hdata.coverPhoto
