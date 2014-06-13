# About

Assets squasher is exactly what it says on the tin: it takes an HTML file and replaces all included scripts with just one and the same for stylesheets.

One caveat here, it's meant to be used for **single page applications**. There you typically have one entry point HTML file which links all the necessary scripts and stylesheets. Like this one:

```html
<!DOCTYPE html>

<html ng-app="app" ng-controller="MainController">
  <head>
    <script defer src="/bower_components/angular/angular.min.js"></script>
    <script defer src="/bower_components/angular-route/angular-route.min.js"></script>
    <script defer src="/bower_components/angular-animate/angular-animate.min.js"></script>
    <script defer src="/bower_components/angular-ui-bootstrap/dist/ui-bootstrap-tpls-0.11.0.min.js"></script>
    <script defer src="/app.js"></script>
    <script defer src="/services.js"></script>

    <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/app.css">
  </head>

  <body>
    <div ng-view>Loading ...</div>
  </body>
</html>
```

Now let's save it into `app.html` (I'm assuming that all the assets exist). When you run `bundle exec assets-asquasher app.html build.html`, you'll get `build/build.min.js` and its source map, `build/build.min.css` and also `build.html` which will look like this:

```html
<!DOCTYPE html>

<html ng-app="app" ng-controller="MainController">
  <head>
    <script src="/build/build.min.js"></script>
    <link rel="stylesheet" href="/build/build.min.css">
  </head>

  <body>
    <div ng-view>Loading ...</div>
  </body>
</html>
```

## Why Is It Useful?

On production you want to use a single minified JS file and a single minified CSS file. Why? Because speed has significant impact on conversions. Yes, it's all cached after the first request, but how many times have you closed a web page before it even loaded?

On the other hand in development you want to include each unminified script separately, so the backtraces make sense[1].

Ultimately this the simplest solution: no need to change your code like you'd have to with say RequireJS. No need to define dependencies in an extra file – it's already there!

## Installation

```
# Assuming you have Node.js already installed.
npm -g uglify-js uglifycss
gem install assets-asquasher
```

## Footnotes

[1] Or alternatively you could use one build file with source maps, but then you have to user guard or something to constantly rebuild it.
