class ParseController < ApplicationController
  before_filter :parse

  def run
    render json: @report
  end

  private
  def parse
    parse = Parse.new
    log = Rails.public_path.join('games.log')
    @report = parse.run!(log)
  end
end