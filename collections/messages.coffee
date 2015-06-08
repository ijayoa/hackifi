@Messages = new Meteor.Collection('messages');

Schemas.Messages = new SimpleSchema

  to: 
    type: String
    label: "To:"
    autoform:
      options: ->
        return [
          {value: 'All', label: 'All parties'}
          {value: 'Sponsors', label: 'Sponsors'},
          {value: 'Judges', label: 'Judges'},
          {value: 'Mentors', label: 'Mentors'},
          {value: 'Participants', label: 'Participants'}
         ]

  selectMedium: 
    type: String
    label: "Send Message Via:"
    autoform:
      options: ->
        return [
          {value: 'sms', label: 'SMS'},
          {value: 'Email', label: 'Email'}
         ]
 
  title:
    type: String

  content:
    type: String
    autoform:
      rows: 5

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

  addAttachment:
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  owner: 
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

Messages.attachSchema(Schemas.Messages)