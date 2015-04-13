class ParseController < ApplicationController
  before_filter :parse

  def run
    render json: @report
  end

  private
  def parse
    parse = Parse.new
    @report = parse.run!
  end
end