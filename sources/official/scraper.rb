#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.body .h3').text.tidy
    end

    def position
      noko.css('.body').xpath('text()').text.split(/ i (?=ministar)/).map(&:tidy)
    end
  end

  class Members
    def member_container
      noko.css('.page_content .one_fourth_col')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
