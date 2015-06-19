Meteor.methods
    deleteAccount: (userId) ->
        if @userId == userId
            Meteor.users.remove _id: @userId

if Meteor.isServer
    Meteor.startup ->
        process.env.MAIL_URL="smtp://support@hackifi.com:hackifi2015@smtp.gmail.com:465/";
        return