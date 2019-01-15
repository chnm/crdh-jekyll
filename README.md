# CRDH

This repository contains the website for [*Current Research in Digital History*](http://crdh.rrchnm.org/), a publication of the [Roy Rosenzweig Center for History and New Media](http://rrchnm.org) at George Mason University.

## Building the site

This site is built using Jekyll (which has Ruby dependencies manged by bundler), and the site assets are built using Gulp (which has Node dependencies managed by npm).

Follow these steps to install the necessary software.

1. Install current versions of Node and Ruby for your platform. Current versions used for this site are Ruby 2.6.0 and Node 11.6.0.
2. Install bundler with `gem install bundler`.
3. Install Jeykll and its dependencies with `bundle install`.
4. Install the Node dependencies with `npm install`.

Once everything is installed, you should be able to preview the site by running `gulp`. Look at the output for the local URL. You can build the site to be deployed with `gulp build`. The output will be in the `_site` file.

