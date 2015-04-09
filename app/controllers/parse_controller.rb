class ParseController < ApplicationController
  before_filter :create_parse

  def index

    @json = @parse.run!
  end

  private
  def create_parse
    @parse = Parse.new
  end
end