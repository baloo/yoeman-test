define [
  'nestinrun-dashboard'
  ], (NestinrunDashboard) ->
  class DashboardRouter extends Backbone.Router
    routes:
      ""                  : "home"
      "logout"            : "logout"
      "apps"              : "appsList"
      "apps/:name"        : "apps"
      "access_token=*foo" : "login"


    isAuthenticated: (callback, authenticated) ->
      console.log NestinrunDashboard.session
      console.log NestinrunDashboard.session.authUrl
      if not NestinrunDashboard.session.authenticated()
        content =
          hash: callback

        $.cookie "authRedirect", JSON.stringify content

        url = NestinrunDashboard.session.authUrl()
        window.location = url

        console.log "not authenticated"
      else
        console.log "authenticated"

        authenticated()

    login: ->
      console.log "blah"
      console.log window.location.hash
      console.log "login"

      session = NestinrunDashboard.session
      session.onRedirect window.location.hash,
        onSuccess: (params) =>
          session.save params
          session.load()
          console.log session

          content = $.cookie('authRedirect')
          $.cookie('authRedirect', null)
          if content
            c = JSON.parse(content)
            if c.hash
              @navigate c.hash,
                trigger: true


        onError: (params) ->
          console.log "onError"
          console.log params


    home: ->
      view = new NestinrunDashboard.Views.HomeView()
      view.render()


    logout: ->

    appsList: ->
      @isAuthenticated "apps", ->
        console.log "appsList blah foo"

        view = new NestinrunDashboard.Views.AppListView()
        view.render()



  NestinrunDashboard.Routers.DashboardRouter = DashboardRouter
  return DashboardRouter
