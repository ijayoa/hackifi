Template.allSubmissions.helpers
	submissions: ->
		mydata = Hackathons.findOne(owner: Meteor.userId())
		Submissions.find(hackathon: mydata._id).fetch()

Template.allSubmissions.events
  'click #delete-submission': ( e, t) ->
    submissionId = @_id

    sweetAlert
      title: 'Are you sure you want to delete this submission?'
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: TAPi18n.__ 'remove'
      cancelButtonText: TAPi18n.__ 'cancel'
      closeOnConfirm: false
    , ->
      try
        Submissions.remove(submissionId)
        sweetAlert "Deleted!", "Submission deleted.", 'success'
      catch error
        sweetAlert title, description, 'error'

