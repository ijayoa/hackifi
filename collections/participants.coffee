@Participants = new Meteor.Collection('participants')

Schemas.Participants = new SimpleSchema

  name:
    type: String

  age:
    type: Number

  linkToLinkedIn:
    type: String
    optional: true

  specialization:
    type: String
    label: 'Specialization'
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

  email:
    type: String

  picture:
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  location:
    type: String
    optional: true
    autoform:
      type: 'map'
      geolocation: true
      searchBox: true
      autolocate: true

  country:
    type: String
    label: 'Nationality'
    allowedValues: [
      "Select Country"
      "Afghanistan"
      "Albania"
      "Algeria"
      "Andorra"
      "Angola"
      "Anguilla"
      "Antigua & Barbuda"
      "Argentina"
      "Armenia"
      "Aruba"
      "Australia"
      "Austria"
      "Azerbaijan"
      "Bahamas"
      "Bahrain"
      "Bangladesh"
      "Barbados"
      "Belarus"
      "Belgium"
      "Belize"
      "Benin"
      "Bermuda"
      "Bhutan"
      "Bolivia"
      "Bosnia & Herzegovina"
      "Botswana"
      "Brazil"
      "British Virgin Islands"
      "Brunei"
      "Bulgaria"
      "Burkina Faso"
      "Burundi"
      "Cambodia"
      "Cameroon"
      "Cape Verde"
      "Cayman Islands"
      "Chad"
      "Chile"
      "China"
      "Colombia"
      "Congo"
      "Cook Islands"
      "Costa Rica"
      "Cote D Ivoire"
      "Croatia"
      "Cruise Ship"
      "Cuba"
      "Cyprus"
      "Czech Republic"
      "Denmark"
      "Djibouti"
      "Dominica"
      "Dominican Republic"
      "Ecuador"
      "Egypt"
      "El Salvador"
      "Equatorial Guinea"
      "Estonia"
      "Ethiopia"
      "Falkland Islands"
      "Faroe Islands"
      "Fiji"
      "Finland"
      "France"
      "French Polynesia"
      "French West Indies"
      "Gabon"
      "Gambia"
      "Georgia"
      "Germany"
      "Ghana"
      "Gibraltar"
      "Greece"
      "Greenland"
      "Grenada"
      "Guam"
      "Guatemala"
      "Guernsey"
      "Guinea"
      "Guinea Bissau"
      "Guyana"
      "Haiti"
      "Honduras"
      "Hong Kong"
      "Hungary"
      "Iceland"
      "India"
      "Indonesia"
      "Iran"
      "Iraq"
      "Ireland"
      "Isle of Man"
      "Israel"
      "Italy"
      "Jamaica"
      "Japan"
      "Jersey"
      "Jordan"
      "Kazakhstan"
      "Kenya"
      "Kuwait"
      "Kyrgyz Republic"
      "Laos"
      "Latvia"
      "Lebanon"
      "Lesotho"
      "Liberia"
      "Libya"
      "Liechtenstein"
      "Lithuania"
      "Luxembourg"
      "Macau"
      "Macedonia"
      "Madagascar"
      "Malawi"
      "Malaysia"
      "Maldives"
      "Mali"
      "Malta"
      "Mauritania"
      "Mauritius"
      "Mexico"
      "Moldova"
      "Monaco"
      "Mongolia"
      "Montenegro"
      "Montserrat"
      "Morocco"
      "Mozambique"
      "Namibia"
      "Nepal"
      "Netherlands"
      "Netherlands Antilles"
      "New Caledonia"
      "New Zealand"
      "Nicaragua"
      "Niger"
      "Nigeria"
      "Norway"
      "Oman"
      "Pakistan"
      "Palestine"
      "Panama"
      "Papua New Guinea"
      "Paraguay"
      "Peru"
      "Philippines"
      "Poland"
      "Portugal"
      "Puerto Rico"
      "Qatar"
      "Reunion"
      "Romania"
      "Russia"
      "Rwanda"
      "Saint Pierre & Miquelon"
      "Samoa"
      "San Marino"
      "Satellite"
      "Saudi Arabia"
      "Senegal"
      "Serbia"
      "Seychelles"
      "Sierra Leone"
      "Singapore"
      "Slovakia"
      "Slovenia"
      "South Africa"
      "South Korea"
      "Spain"
      "Sri Lanka"
      "St Kitts & Nevis"
      "St Lucia"
      "St Vincent"
      "St. Lucia"
      "Sudan"
      "Suriname"
      "Swaziland"
      "Sweden"
      "Switzerland"
      "Syria"
      "Taiwan"
      "Tajikistan"
      "Tanzania"
      "Thailand"
      "Timor L'Este"
      "Togo"
      "Tonga"
      "Trinidad & Tobago"
      "Tunisia"
      "Turkey"
      "Turkmenistan"
      "Turks & Caicos"
      "Uganda"
      "Ukraine"
      "United Arab Emirates"
      "United Kingdom"
      "United States"
      "Uruguay"
      "Uzbekistan"
      "Venezuela"
      "Vietnam"
      "Virgin Islands (US)"
      "Yemen"
      "Zambia"
      "Zimbabwe"
    ]
    optional: true

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

Participants.attachSchema(Schemas.Participants)

