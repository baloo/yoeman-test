define ['nestinrun-dashboard'], (NestinrunDashboard) ->
  class SessionModel extends Backbone.Model
    defaults:
      access_token: null
      user_email: null
      client_id: null
      redirect_uri: null
      authscheme: null

    authschemes:
      google:
        auth_url: 'https://accounts.google.com/o/oauth2/auth'
        scope: 'https://www.googleapis.com/auth/userinfo.profile'

    initialize: (client_id, redirect_uri) ->
      @set
        authscheme: @authschemes.google
        client_id: client_id
        redirect_uri: redirect_uri

      @load()

    authenticated: ->
      Boolean(@get("access_token"))

    save: (auth_hash)->
      $.cookie('user_email', auth_hash.email)
      $.cookie('access_token', auth_hash.access_token)

    load: ->
      @set
        user_email: $.cookie('user_email')
        access_token: $.cookie('access_token')

    authUrl: ->
      Url = @attributes.authscheme.auth_url + '?client_id=' + @attributes.client_id \
        + '&redirect_uri=' + encodeURIComponent(@attributes.redirect_uri) \
        + '&response_type=token'
      Url += '&scope=' + @attributes.authscheme.scope

    onRedirect: (hash, options) ->
      params = @_parseHash(hash)
      if @authSuccess(params)
        options.onSuccess params
      else
        options.onError params

    authSuccess: (params) ->
      params.access_token

    _parseHash: (hash) ->
      params = {}
      queryString = hash.substring(1)
      regex = /([^&=]+)=([^&]*)/g

      while (m = regex.exec(queryString))
        params[decodeURIComponent(m[1])] = decodeURIComponent(m[2])

      params
      

  NestinrunDashboard.Models.SessionModel = SessionModel
  return SessionModel
