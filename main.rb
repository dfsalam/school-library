# frozen_string_literal: true

require 'json'
require './app'

def main
  app = App.new
  app.run  
end

main()
