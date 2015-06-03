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

  # @route "setUp",
  #   path: "dashboard/hackathon/configure"
  #   layoutTemplate: "dashboardlayout"

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

  # @route "hackathonHome",
  #   path: "/:_id"
  @route "hackathonHome",
    path: "/:_id"
    waitOn: ->
      [
        subs.subscribe 'hackathons'
        subs.subscribe 'mentors'
        subs.subscribe 'judges'
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
      ]
    onBeforeAction: (pause) ->
      unless Hackathons.findOne({personalizedUrl:this.params._id})
        this.render 'notFound'
      else
        this.render 'hackathonHome'
    data: ->
      hackData: Hackathons.findOne({personalizedUrl:this.params._id})
