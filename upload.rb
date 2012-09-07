#!/usr/bin/env ruby

require 'aws/s3'

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3ACCESS'],
  :secret_access_key => ENV['S3SECRET']
)

class FuckAmazon
  include AWS::S3
  def self.put(file)
    S3Object.store(file, open(file), 'romney', :access => :public_read)
  end
end

sync = %w/index.html style.css poll.js/

sync.each do |file|
  STDERR.puts "Uploading: #{file}"
  FuckAmazon.put(file)
end
