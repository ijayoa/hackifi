Template.hackathonScoreboard.helpers
    getPersonalizedUrl: ->
        url = Router.current().data().personalizedUrl
        console.log(url)
        return url