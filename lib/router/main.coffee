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

  @route "setUp",
    path: "dashboard/hackathon/configure"
    layoutTemplate: "dashboardlayout"

  @route "createHackathon",
    path: "dashboard/create/hackathon"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'hackathons'
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

  @route "allJudges",
    path: "dashboard/hackathon/judges"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'judges'
        subs.subscribe 'attachments'
      ]

  @route "allSponsors",
    path: "dashboard/hackathon/sponsors"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'sponsors'
        subs.subscribe 'attachments'
      ]

  @route "allMentors",
    path: "dashboard/hackathon/mentors"
    layoutTemplate: "dashboardlayout"
    waitOn: ->
      [
        subs.subscribe 'mentors'
        subs.subscribe 'attachments'
      ]