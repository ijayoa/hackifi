@Criteria = new Mongo.Collection("criterias")

Schemas.Criteria = new SimpleSchema
    name:
      type: String
    
    maximum_score: 
      type: Number
      max: 15

    hackathon:
     type: String
     autoform:
       omit: true
    
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

Criteria.attachSchema(Schemas.Criteria)