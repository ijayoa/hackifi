Template.allSubmissions.helpers
	submissions: ->
		mydata = Hackathons.findOne(owner: Meteor.userId())
		Submissions.find(hackathon: mydata._id).fetch()

