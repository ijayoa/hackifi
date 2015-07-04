Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"

  @route "dashboard",
    path: "/dashboard"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'attachments'
        subs.subscribe 'hackathons'
        subs.subscribe 'participants'
        subs.subscribe 'submissions'
        subs.subscribe 'feedbacks'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()

  # @route "myHackathons",
  #   path: "dashboard/myhackathons"
  #   layoutTemplate: "dashboardlayout"
  
# update collections

  @route "updateHackathon",
    path: "dashboard/hackathon/edit/:_id"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'attachments'
      ]
    data: ->
      return Hackathons.findOne(this.params._id)

  @route "updateMentor",
    path: "dashboard/mentors/edit/:_id"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'mentors'
        subs.subscribe 'attachments'
      ]
    data: ->
      return Mentors.findOne(this.params._id)

  @route "updateSponsor",
    path: "dashboard/sponsors/edit/:_id"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
      ]
    data: ->
      return Sponsors.findOne(this.params._id)
  
  @route "updateJudge",
    path: "dashboard/judges/edit/:_id"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
      ]
    data: ->
      return Judges.findOne(this.params._id)
# end of update

# add collections

  @route "createHackathon",
    path: "dashboard/hackathon/settings"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'attachments'
      ]
    data: ->
      hack: Hackathons.findOne({owner:Meteor.userId()})

 # add hacakthon page
  @route "dashboardAddParticipant",
    path: "dashboard/hackathon/add/participant"
    layoutTemplate:'dashboardlayout'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'participants'
        subs.subscribe 'attachments'
      ]

  @route "addSponsor",
    path: "dashboard/hackathon/add/sponsor"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
      ]

  @route "addMentor",
    path: "dashboard/hackathon/add/mentor"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'mentors'
        subs.subscribe 'attachments'
      ]


  @route "addJudge",
    path: "dashboard/hackathon/add/judge"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
        subs.subscribe 'hackathons'
      ]
    data: ->
      userId = Meteor.userId()
      url = Hackathons.findOne({owner: userId}).personalizedUrl
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl: url})

    @route "addCriteria",
      path: "dashboard/hackathon/add/judging-criteria"
      layoutTemplate: "dashboardlayout"
      waitOn: ->
        [
          subs.subscribe 'judges'
          subs.subscribe 'attachments'
          subs.subscribe 'hackathons'
        ]
      data: ->
        userId = Meteor.userId()
        url = Hackathons.findOne({owner: userId}).personalizedUrl
        Session.set 'hackathon', Hackathons.findOne({personalizedUrl: url})

# end of add

# show collections
  @route "allJudges",
    path: "dashboard/hackathon/judges"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
      ]
    data: ->
      judges: Judges.find({owner:Meteor.userId()},{sort: {createdAt: -1}}).fetch()

  @route "allCriterias",
    path: "dashboard/hackathon/criterias"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
        subs.subscribe 'criterias'
      ]

  @route "allFeedback",
    path: "dashboard/hackathon/feedbacks"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'feedbacks'
        subs.subscribe 'participants'
        subs.subscribe 'attachments'
      ]

  @route "allSubmissions",
    path: "/dashboard/hackathon/submissions"
    layoutTemplate:'dashboardlayout'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'attachments'
        subs.subscribe 'submissions'
      ]

  @route "aboutSubmission",
    path: "/dashboard/hackathon/submissions/:_id"
    layoutTemplate:'dashboardlayout'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'attachments'
        subs.subscribe 'submissions'
      ]
    data: ->
      submission: Submissions.findOne(this.params._id)

  @route "scoreCards",
    path: "/dashboard/hackathon/scorecards"
    layoutTemplate:'dashboardlayout'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'criterias'
        subs.subscribe 'scores'
        subs.subscribe 'judges'
      ]

  @route "dashboardScoreBoard",
    path: "/dashboard/hackathon/scoreboard"
    layoutTemplate:'dashboardlayout'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'attachments'
        subs.subscribe 'criterias'
        subs.subscribe 'submissions'
        subs.subscribe 'judges'
        subs.subscribe 'scores'
      ]
    data: ->
      hackData: Hackathons.findOne(owner: Meteor.userId())

  @route "allSponsors",
    path: "dashboard/hackathon/sponsors"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
      ]
    data: ->
      sponsors: Sponsors.find({owner:Meteor.userId()},{sort: {createdAt: -1}}).fetch()

  @route "allMentors",
    path: "dashboard/hackathon/mentors"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'mentors'
        subs.subscribe 'attachments'
      ]
    data: ->
      mentors: Mentors.find({owner:Meteor.userId()},{sort: {createdAt: -1}}).fetch()

  @route "allParticipants",
    path: "dashboard/hackathon/participants"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'participants'
        subs.subscribe 'attachments'
      ]
    data: ->
      allP = Hackathons.findOne(owner: Meteor.userId())
      participants: Participants.find(hackathon: allP._id).fetch()

  @route "hackathonOverview",
    path: "/hackathon/:_id"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonOverview'
    data: ->
      Session.set 'thisHackathon',Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})


  @route "hackathonSponsors",
    path: "/hackathon/:_id/sponsors"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonSponsors'
    data: ->
      hData = Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})
      sponsorData: Sponsors.find({owner:hData.owner}).fetch()
 
  @route "hackathonMentors",
    path: "/hackathon/:_id/mentors"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonMentors'
    data: ->
      hData = Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})
      mentorData: Mentors.find({owner:hData.owner}).fetch()

  @route "hackathonJudges",
    path: "/hackathon/:_id/judges"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonJudges'
    data: ->
      hData = Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})
      judgeData: Judges.find({owner:hData.owner}).fetch()

  @route "hackathonResources",
    path: "/hackathon/:_id/resources"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonResources'
    data: ->
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})

  @route "hackathonScoreboard",
    path: "/hackathon/:_id/scoreboard"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'scores'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
        subs.subscribe 'submissions'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne(personalizedUrl: this.params._id)
        this.render 'notFound'
      else
        this.render 'hackathonScoreboard'
    data: ->
      Session.set 'hackathon', Hackathons.findOne(personalizedUrl: this.params._id)
      hackData: Hackathons.findOne(personalizedUrl: this.params._id)
      personalizedUrl: this.params._id
 # end of show collections

# add hacakthon page
  @route "hackathonRegister",
    path: "/hackathon/:_id/register"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne( personalizedUrl:this.params._id )
        this.render 'notFound'
      else
        this.render 'hackathonRegister'
    data: ->
      Session.set 'hackathon', Hackathons.findOne( personalizedUrl:this.params._id )
      hackData: Hackathons.findOne( personalizedUrl:this.params._id )

  @route "hackathonSubmissions",
    path: "/hackathon/:_id/submissions"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
        subs.subscribe 'submissions'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne( personalizedUrl: this.params._id )
        this.render 'notFound'
      else
        this.render 'hackathonSubmissions'
    data: ->
      Session.set 'hackathon', Hackathons.findOne( personalizedUrl:this.params._id )
      hackData: Hackathons.findOne( personalizedUrl:this.params._id )


  @route "hackathonFeedbacks",
    path: "/hackathon/:_id/feedback"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
        subs.subscribe 'feedbacks'
        subs.subscribe 'participants'
        subs.subscribe 'submissions'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonFeedbacks'
    data: ->
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})



  @route "newMessage",
    path: "dashboard/hackathon/new/message"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'messages'
        subs.subscribe 'attachments'
      ]



  @route "timeLine",
    path: "/dashboard/hackathon/timeline"
    layoutTemplate:'dashboardlayout'

  @route "hackifiSupport",
    path: "/dashboard/hackathon/support/hackifi"
    layoutTemplate:'dashboardlayout'

  @route "addscore",
    path: "/hackathon/:_id/:subId/addscore"
    layoutTemplate:'hackathonHome'
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'scores'
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
        subs.subscribe 'participants'
        subs.subscribe 'submissions'
        subs.subscribe 'criterias'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'addscore'
    data: ->
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})
      submission: Submissions.findOne(this.params.subId)
      #criterias: Criteria.find({: Meteor.userId()},{sort: {createdAt: -1}}).fetch()
    
# end of add hackathon 


