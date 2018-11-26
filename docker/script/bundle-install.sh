#!/bin/bash

bundle check || bundle install --path  vendor/cache

bundle exec rails s -b 0.0.0.0