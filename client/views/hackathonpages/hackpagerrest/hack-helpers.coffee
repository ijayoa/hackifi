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

