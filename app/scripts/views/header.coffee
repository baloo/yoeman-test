define [
  'nestinrun-dashboard',
  'templates/header'], (NestinrunDashboard, Tmpl) ->
  class HeaderView extends Backbone.View
    el: $('#header')

    render: () ->
      content = Tmpl["app/scripts/templates/header.hbs"]()
      $(this.el).html(content)


  NestinrunDashboard.Views.HeaderView = HeaderView
  return HeaderView
