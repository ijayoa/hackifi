@Judges = new Meteor.Collection('judges')

Schemas.Judges = new SimpleSchema

  name:
    type: String

  personalWebsiteLink:
    type: String
    optional: true

  about:
    type: String
    autoform:
      rows: 5

  picture:
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'
  username:
    type: String
  password:
    type: String
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

Judges.attachSchema(Schemas.Judges)

