require 'user_agent/browsers/base'
require 'user_agent/browsers/chrome'
require 'user_agent/browsers/gecko'
require 'user_agent/browsers/internet_explorer'
require 'user_agent/browsers/opera'
require 'user_agent/browsers/webkit'
require 'user_agent/browsers/windows_media_player'
require 'user_agent/browsers/itunes'
require 'user_agent/browsers/apple_core_media'

class UserAgent
  module Browsers
    Security = {
      "N" => :none,
      "U" => :strong,
      "I" => :weak
    }.freeze

    def self.all
      [InternetExplorer, Chrome, ITunes, Webkit, Opera, Gecko, WindowsMediaPlayer, AppleCoreMedia]
    end

    def self.extend(array)
      all.each do |extension|
        return extension.new(array) if extension.extend?(array)
      end
      array
    end
  end
end
