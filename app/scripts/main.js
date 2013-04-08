require.config({
    paths: {
        jquery: '../components/jquery/jquery',
        'jquery.cookie': '../components/jquery.cookie/jquery.cookie',
        underscore: '../components/underscore/underscore',
        backbone: '../components/backbone/backbone',
        handlebars: '../components/handlebars.js/dist/handlebars',
        bootstrap: 'vendor/bootstrap'
    },
    shim: {
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: ['jquery', 'underscore'],
            exports: 'Backbone'
        },
        bootstrap: {
            deps: ['jquery'],
            exports: 'jquery'
        },
        handlebars : {
            exports: "Handlebars"
        },
        'jquery.cookie': {
            deps: ['jquery'],
            exports: 'jQuery.fn.cookie'
        }
    }
});

define(['nestinrun-dashboard', 'jquery', 'jquery.cookie', 'bootstrap'], function(NestinrunDashboard, $){
    NestinrunDashboard.start();
});

// vim: ts=4 sw=4 expandtab:
