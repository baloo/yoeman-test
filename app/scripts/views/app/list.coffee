define [
  'nestinrun-dashboard',
  '../main',
  'templates/app/list'
  ], (NestinrunDashboard, MainView, Tmpl) ->
  class AppListView extends MainView

    render: () ->
      content = Tmpl['app/scripts/templates/app/list.hbs']
        apps: [
            name: "foo"
          ,
            name: "bar"
          ,
            name: "baz"
        ]
      $(this.el).html(content)

  NestinrunDashboard.Views.AppListView = AppListView
  return AppListView
