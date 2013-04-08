define [
  'nestinrun-dashboard',
  'templates/home'
  ], (NestinrunDashboard, Tmpl) ->
  class HomeView extends NestinrunDashboard.Views.MainView
    render: () ->
      content = Tmpl['app/scripts/templates/home.hbs']()
      $(this.el).html(content)

  NestinrunDashboard.Views.HomeView = HomeView
  return HomeView
