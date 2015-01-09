define [
		'marionette', 
		'components/roadmapList/RoadmapListView.coffee', 
		'components/roadmap/RoadmapView.coffee',
		'models/Roadmap.coffee'
	], (
		Marionette, RoadmapListView, RoadmapView, Roadmap
	) ->

	Marionette.AppRouter.extend
		
		appRoutes:
			'': 'listRoadmaps'
			'roadmap/:id': 'showRoadmap'

		controller: 

			listRoadmaps: () ->
				view = new RoadmapListView()
				app.main.show view

			showRoadmap: (id) ->
				model = Roadmap.findOrCreate
					_id: id
				view = new RoadmapView
					model: model
				model.fetch().success -> app.main.show view
