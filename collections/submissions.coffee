@Submissions = new Meteor.Collection('submissions')

Schemas.Submissions = new SimpleSchema

  productName:
    type: String

  githubLink:
    type: String
    optional: true

  productCategory:
    type: String
    allowedValues: [
      "Select Category"
      "Technology"
      "Finance"
      "Agriculture"
      "Safety and Alerts"
      "Environmental"
      "Business"
      "Communication"
      "Health"
    ]

  shortDescription:
    type: String
    autoform:
      rows: 5

  aboutTeam:
    type: String
    autoform:
      rows: 5

  motivation:
    type: String
    optional: true
    autoform:
      rows: 5

  teamPicture:
    type: String
    optional:true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  productLogo:
    type: String
    optional:true
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

Submissions.attachSchema(Schemas.Submissions)

