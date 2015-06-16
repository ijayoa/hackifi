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
    autoform:
      omit: true

  createdAt: 
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type:Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()


Feedbacks.attachSchema(Schemas.Feedbacks)

