if Meteor.isServer
  options =
    siteName: Config.name

  if Config.socialMedia
    _.each Config.socialMedia, (v,k) ->
      options[k] = v.url

  if Config.legal
    options.companyAddress = Config.legal.address
    options.companyName = Config.legal.name
    options.companyUrl = Config.legal.url

  PrettyEmail.options =
    from: 'Hackifi'
    logo: 'http://hackifi.meteor.com/img/hackifilogo.png'
    companyName: 'Hackifi'
    companyUrl: 'http://hackifi.com'
    companyAddress: '20 Aluguntuguntu Street Ambassadorial Enclave East Legon, Greater Accra, Ghana.'
    companyTelephone: '+(233) 248-060-588'
    companyEmail: 'support@hackifi.com'
    siteName: 'Hackifi'
    showFooter: true

