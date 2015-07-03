Template.dashboardlayout.events
	'click .btn-delete': (e,t) ->
		_id = $(e.target).attr('doc')
		Session.set 'db_admin_id', _id

Template.sponsorDeleteModal.events
	'click #confirm-delete': () ->
		_id = Session.get 'db_admin_id'
		Meteor.call 'removeSponsor', _id, (e,r)->
			$('#db-admin-delete-modal').removeClass('fade')
			$('#db-admin-delete-modal').modal('hide')

Template.mentorDeleteModal.events
	'click #confirm-delete': () ->
		_id = Session.get 'db_admin_id'
		Meteor.call 'removeMentor', _id, (e,r)->
			$('#db-admin-delete-modal').removeClass('fade')
			$('#db-admin-delete-modal').modal('hide')

Template.judgeDeleteModal.events
	'click #confirm-delete': () ->
		_id = Session.get 'db_admin_id'
		Meteor.call 'removeJudge', _id, (e,r)->
			$('#db-admin-delete-modal').removeClass('fade')
			$('#db-admin-delete-modal').modal('hide')

Template.participantDeleteModal.events
	'click #confirm-delete': () ->
		_id = Session.get 'db_admin_id'
		Meteor.call 'removeParticipant', _id, (e,r)->
			$('#db-admin-delete-modal').removeClass('fade')
			$('#db-admin-delete-modal').modal('hide')