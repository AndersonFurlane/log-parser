class ParseController < ApplicationController

  def index
    @parse = Parse.run!
  end
end