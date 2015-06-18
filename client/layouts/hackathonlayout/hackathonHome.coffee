Template.hackathonHome.rendered = () ->
	$('.navbar').css('margin-bottom',0)

Template.hackathonHome.helpers
	url: ->
		hd = Session.get 'thisHackathon'
		photoId = hd.coverPhoto
		img = Attachments.findOne(_id: photoId)
		url = img.url()
