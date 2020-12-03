# frozen_string_literal: true

# implements main controller
class AutomorphsController < ApplicationController
  def input; end

  def view
    input_s = params[:search_range]
    # checking only creation of views by default raises error of nil input
    if input_s.nil?
      res = 'error 1'
    elsif input_s.match?(/[^0-9 -]/)
      res = 'error 2'
    else
      res = 'nice data'
      logger.info 'log nice case'
    end

    logger.info 'logger init'

    unless res.match?(/err/)

      cached_result = CachedResult.find_or_initialize_by(input: input_s)

      if cached_result.new_record?
        res_a = parse_sequence(parse_input(input_s))
        res = res_a.any? ? res_a.to_s : 'error 3'
        unless res.match?(/err/)
          cached_result.result = res
          cached_result.save!
        end
      end

      resp = CachedResult.find_by(input: input_s)
      res = resp.result unless resp.nil?
      logger.info('log result:' + res.to_s)


    end
    @result = res
  end

  def cached
    res = CachedResult.all.map { |inst| { input: inst.input, result: inst.result } }

    respond_to do |format|
      format.xml { render xml: res.to_xml }
      format.json { render json: res }
    end
  end

  def userlist
    res = User.all.map { |inst| { email: inst.email } }

    respond_to do |format|
      format.xml { render xml: res.to_xml }
      format.json { render json: res }
    end
  end
end

def square?(num)
  root = Math.sqrt(num)
  ((root - root.round).abs < 10e-5)
end

def parse_sequence(list)
  list.map { |elt| [elt, square?(elt)] }
      .slice_when { |elt1, elt2| elt1.last != elt2.last }
      .select { |grp| grp.first.last }
      .map { |grp| grp.map(&:first) }
end

def parse_input(input_string)
  input_string.strip.split.map(&:to_i)
end
