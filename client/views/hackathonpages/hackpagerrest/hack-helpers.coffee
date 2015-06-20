Template.hackathonScoreboard.helpers
    getPersonalizedUrl: ->
        url = Router.current().data().personalizedUrl
        return url

Template.registerHelper 'AuthJudge', ->
    if Session.get('AuthJudge')
        authSession = Session.get('AuthJudge')
        judge = Judges.findOne(authSession)
        hackathon = Router.current().params._id
        if judge.hackathon = hackathon
            return true
    return

Template.registerHelper 'judgeSignedInString', ->
    authSession = Session.get('AuthJudge')
    judge = Judges.findOne(authSession)
    name = judge.name
    firstName = name.split(' ').slice(0, -1).join(' ')
    return "Judge " + firstName 

Template.registerHelper 'criterias', ->
    hackUrl = Router.current().params._id
    hackId = Hackathons.findOne({personalizedUrl: hackUrl})._id
    return Criteria.find({hackathon: hackId}).fetch()

Template.registerHelper 'getSubId', ->
    return Router.current().params.subId

Template.registerHelper 'getHackId', ->
    hackUrl = Router.current().params._id
    return Hackathons.findOne({personalizedUrl: hackUrl})._id


