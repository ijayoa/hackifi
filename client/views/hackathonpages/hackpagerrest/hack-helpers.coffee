Template.hackathonScoreboard.helpers
    getPersonalizedUrl: ->
        url = Router.current().data().personalizedUrl
        return url

Template.addscore.helpers
    getPUrl: ->
        url = Router.current().data().hackData.personalizedUrl
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
    hack = Hackathons.findOne owner: Meteor.userId()
    hackId = hack._id
    return Criteria.find(hackathon: hackId).fetch()

Template.registerHelper 'hackCriterias', ->
    hackUrl = Router.current().params._id
    hackId = Hackathons.findOne({personalizedUrl: hackUrl})._id
    return Criteria.find(hackathon: hackId).fetch()

Template.registerHelper 'getSubId', ->
    return Router.current().params.subId

Template.registerHelper 'getHackId', ->
    hackUrl = Router.current().params._id
    return Hackathons.findOne({personalizedUrl: hackUrl})._id

Template.registerHelper 'getTotalScore', (submissionId) ->
    scores = 0
    getScores = Scores.find({submissionId: submissionId}).fetch()
    if typeof getScores == "undefined"
        return
    else
        $(getScores).each (index, value) ->
            scores += value.score
    return scores    

Template.registerHelper 'AuthJudge', ->
    return Session.get('AuthJudge')


Template.registerHelper 'getScore', (criteriaId, submissionId) ->
    judgeId = Session.get('AuthJudge')
    findScore = Scores.findOne(
                    criteriaId: criteriaId
                    judgeId: judgeId 
                    submissionId: submissionId)
    if typeof findScore == "undefined"
        return
    else
        return findScore.score

Template.registerHelper 'getJudgeCriteriaScore', (criteriaId, submissionId, judgeId) ->
    findScore = Scores.findOne(
                    criteriaId: criteriaId
                    judgeId: judgeId
                    submissionId: submissionId)
    if typeof findScore == "undefined"
        return
    else
        return findScore.score

Template.registerHelper 'getJudgeTotalCriteriaScore', (submissionId, judgeId) ->
    scores = 0
    getScores = Scores.find(
                    submissionId: submissionId, judgeId: judgeId).fetch()
    if typeof getScores == "undefined"
        return
    else
        $(getScores).each (index, value) ->
            scores += value.score
    return scores    

Template.registerHelper 'getJudgeId', ->
    return Session.get('AuthJudge')


Template.scoreCards.helpers 
    scores: ->
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Scores.find(hackathon: hackId).fetch()
    criterias: ->
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Criteria.find(hackathon: hackId).fetch()
    judges: ->
        oddArray = [] 
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Judges.find(hackathon: hackId).fetch()
    submissions: -> 
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Submissions.find(hackathon: hackId).fetch()

Template.dashboardScoreBoard.helpers 
    scores: ->
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Scores.find(hackathon: hackId).fetch()
    criterias: ->
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        return Criteria.find(hackathon: hackId).fetch()
    submissions: -> 
        submissions = []
        score = 0
        hack = Hackathons.findOne owner: Meteor.userId()
        hackId = hack._id
        #can't get the submissions to rank from highest to lowest
        #this is because the score and submission are different collections
        #so here am tying the total score to the submission object
        #am basically creating new submission objects with the score value
        #i then return ranked submission objects
        findSubmissions =  Submissions.find(hackathon: hackId).fetch()
        $(findSubmissions).each (index, value) ->
            _id = value._id
            score = getmescores(_id)
            submissions[index] = {_id: _id, score: score, teamPicture: value.teamPicture, productName: value.productName, productLogo: value.productLogo, shortDescription: value.shortDescription, hackathon: value.hackathon}
        rankedSubmissions = submissions.sort (a, b) =>
                    return parseFloat(b.score) - parseFloat(a.score);
        return rankedSubmissions

Template.hackathonScoreboard.helpers
    rankedSubmissions: ->
        submissions = []
        score = 0
        hackUrl = Router.current().params._id
        hackId = Hackathons.findOne({personalizedUrl: hackUrl})._id
        #can't get the submissions to rank from highest to lowest
        #this is because the score and submission are different collections
        #so here am tying the total score to the submission object
        #am basically creating new submission objects with the score value
        #i then return ranked submission objects
        findSubmissions =  Submissions.find(hackathon: hackId).fetch()
        $(findSubmissions).each (index, value) ->
            _id = value._id
            score = getmescores(_id)
            submissions[index] = {_id: _id, score: score, teamPicture: value.teamPicture, productName: value.productName, productLogo: value.productLogo, shortDescription: value.shortDescription, hackathon: value.hackathon}
        rankedSubmissions = submissions.sort (a, b) =>
                    return parseFloat(b.score) - parseFloat(a.score);
        return rankedSubmissions

getmescores = (submissionId) ->
    scores = 0
    getScores = Scores.find({submissionId: submissionId}).fetch()
    if typeof getScores == "undefined"
        return
    else
        $(getScores).each (index, value) ->
            scores += value.score
    return scores 






