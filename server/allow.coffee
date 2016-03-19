ProfilePictures.allow
	insert: (userId, doc) ->
		true
	update: (userId, doc, fieldNames, modifier) ->
		true
	download: (userId)->
		true

Posts.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Hackathons.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Criteria.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Messages.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Judges.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Mentors.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Sponsors.allow
	insert: (userId, doc) ->
		userId == doc.owner
	update: (userId, doc, fields, modifier) ->
		userId == doc.owner
	remove: (userId, doc) ->
		userId == doc.owner

Attachments.allow
	insert: (userId, doc) ->
		true
	update: (userId, doc, fieldNames, modifier) ->
		true
	download: (userId)->
		true

Meteor.users.allow
	update: (userId, doc, fieldNames, modifier) ->
		if userId == doc._id and not doc.username and fieldNames.length == 1 and fieldNames[0] == 'username'
			true
		else
			false

Submissions.allow
	insert: (userId, doc) ->
		true
	update: (userId, doc, fields, modifier) ->
		userId
	remove: (userId, doc) ->
		userId