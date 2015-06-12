Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"

  @route "dashboard",
    path: "/dashboard"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()

  @route "myHackathons",
    path: "dashboard/myhackathons"
    layoutTemplate: "dashboardlayout"


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
      ]
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

  @route "allFeedback",
    path: "dashboard/hackathon/feedbacks"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'feedbacks'
        subs.subscribe 'participants'
        subs.subscribe 'attachments'
      ]
    data: ->
      feedbacks: Feedbacks.find().fetch()

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
      participants: Participants.find().fetch()



  # @route "hackathonHome",
  #   path: "/:_id"
  @route "hackathonOverview",
    path: "/:_id"
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
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})

  @route "hackathonSponsors",
    path: "/:_id/sponsors"
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
    path: "/:_id/mentors"
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
    path: "/:_id/judges"
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

 # end of show collections

# add hacakthon page
  @route "hackathonRegister",
    path: "/:_id/register"
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
        this.render 'hackathonRegister'
    data: ->
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})

  @route "hackathonSubmissions",
    path: "/:_id/submissions"
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
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonSubmissions'
    data: ->
      Session.set 'hackathon', Hackathons.findOne({personalizedUrl:this.params._id})
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})


  @route "hackathonFeedbacks",
    path: "/:_id/feedback"
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

  @route "scoreBoard",
    path: "/dashboard/hackathon/scoreboard"
    layoutTemplate:'dashboardlayout'
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

# end of add hackathon page