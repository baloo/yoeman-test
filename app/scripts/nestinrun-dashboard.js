define([
  'backbone'
  ], function (Backbone) {
    NestinrunDashboard = {
        init: function () {
            // initialize router, views, data and layouts
            require([
                'models/session',
                'routers/dashboard',
                'views/header',
                'views/main',
                'views/home',
                'views/app/list'
                ], function(deps) {


                var view = new NestinrunDashboard.Views.HeaderView();
                view.render();

                NestinrunDashboard.session = new NestinrunDashboard.Models.SessionModel(
                  "190905319778-c44re5iok2obl9i1o369r3hgoaecuu1f.apps.googleusercontent.com",
                  "http://localhost:9010/"/*#/oauth2callback"*/);
                console.log(NestinrunDashboard.session);
 
                var router = new NestinrunDashboard.Routers.DashboardRouter();
                NestinrunDashboard.router = router


                Backbone.history.start();

            });

        },
        start: function () {
            NestinrunDashboard.init();
        },
        Views: {},
        Models: {},
        Collections: {},
        Routers: {}
    }

    return NestinrunDashboard;
});

// vim: ts=4 sw=4 expandtab:
