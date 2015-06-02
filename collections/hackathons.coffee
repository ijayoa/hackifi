@Hackathons = new Meteor.Collection('hackathons')

Schemas.Hackathons = new SimpleSchema

	about:
		type: String
		autoform:
			rows: 5

	title:
		type: String
		max: 60

	personalizedUrl:
		type: String
		max: 60

	prizes:
		type: String
		optional: true
		autoform:
			rows: 5

	rules:
		type: String
		autoform:
			rows: 5

	eligibility:
		type: String
		optional: true
		autoform:
			rows: 5

	timeline:
		type: String
		optional: true
		autoform:
			rows: 5

	coverPhoto:
		type: String
		autoform:
			afFieldInput:
				type: 'fileUpload'
				collection: 'Attachments'

	createdAt:
		type: Date
		autoform:
			omit: true
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional: true
		autoform:
			omit: true
		autoValue: ->
			if this.isUpdate
				new Date()

	owner:
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			omit: true
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id

Hackathons.attachSchema(Schemas.Hackathons)

