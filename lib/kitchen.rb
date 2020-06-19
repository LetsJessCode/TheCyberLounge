require 'pry'
require 'rest-client'
require 'json'
require 'tty-prompt'
require 'colorize'

require_relative "the_cyber_lounge/version.rb"
require_relative "./meals_api.rb"
require_relative "./recipes.rb"
require_relative "./the_cyber_lounge/cli.rb"

require_relative "./the_cyber_lounge/cocktails_api.rb"
require_relative "./minibar.rb"