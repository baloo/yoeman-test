define [
  'nestinrun-dashboard',
  ], (NestinrunDashboard) ->
  class MainView extends Backbone.View
    el: $('#main')

  NestinrunDashboard.Views.MainView = MainView
  return MainView
