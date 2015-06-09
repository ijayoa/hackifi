@Submissions = new Meteor.Collection('submissions')

Schemas.Submissions = new SimpleSchema

  productName:
    type: String

  githubLink:
    type: String
    optional: true

  productCategory:
    type: String
    label: "Select Product Category:"
    autoform:
      options: ->
          return [
            {value: 'Technology', label: 'Technology'}
            {value: 'Finance', label: 'Finance'},
            {value: 'Agriculture', label: 'Agriculture'},
            {value: 'Safety and Alerts', label: 'Safety and Alerts'},
            {value: 'Environmental', label: 'Environmental'},
            {value: 'Business', label: 'Business'},
            {value: 'Communication', label: 'Communication'},
            {value: 'Health', label: 'Health'},
            {value: 'Transportation', label: 'Transportation'}
            {value: 'Social or LifeStyle', label: 'Social or LifeStyle'}
           ]

  shortDescription:
    type: String
    autoform:
      rows: 5

  teamMembers:
    type: [String]
    autoform:
      type: 'tags'
      afFieldInput:
        maxTags: 4

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

Submissions.attachSchema(Schemas.Submissions)

