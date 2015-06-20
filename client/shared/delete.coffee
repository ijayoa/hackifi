Template.dashboardlayout.events
	'click .btn-delete': (e,t) ->
		_id = $(e.target).attr('doc')
		Session.set 'db_admin_id', _id

Template.sponsorDeleteModal.events
	'click #confirm-delete': () ->
		_id = Session.get 'db_admin_id'
		Meteor.call 'removeSponsor', _id, (e,r)->
			$('#db-admin-delete-modal').modal('hide')