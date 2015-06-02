# You'll want to replace these functions. They publish the whole
# collection which is problematic after your app grows

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publish 'hackathons', ->
	Hackathons.find()

Meteor.publish 'judges', ->
	Judges.find()

Meteor.publish 'mentors', ->
	Mentors.find()

Meteor.publish 'sponsors', ->
	Sponsors.find()

Meteor.publish 'attachments', ->
	Attachments.find()