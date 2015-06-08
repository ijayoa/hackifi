@Feedbacks = new Meteor.Collection('feedbacks')

Schemas.Feedbacks = new SimpleSchema

  name:
    type: String

  email:
  	type: String

  yourFeedback:
    type: String
    autoform:
      rows: 3

  hackathon:
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

Feedbacks.attachSchema(Schemas.Feedbacks)

