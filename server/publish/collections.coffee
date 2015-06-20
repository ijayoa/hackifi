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

Meteor.publish 'scores', ->
	Scores.find()

Meteor.publish 'feedbacks', ->
	Feedbacks.find()

Meteor.publish 'messages', ->
	Messages.find()

Meteor.publish 'criterias', ->
	Criteria.find()


Meteor.publish 'submissions', ->
	Submissions.find()

Meteor.publish 'participants', ->
	Participants.find()

Meteor.publish 'attachments', ->
	Attachments.find()