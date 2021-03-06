require "pry"
require "chingu"
require "ashton"
# require "ruby-prof"
require "securerandom"
require "texplay"

require_relative "lib/planet-wars/version"
require_relative "lib/planet-wars/asset_manager"

# require_relative "lib/planet-wars/net/server/config"
# require "gameoverseer"
# require_relative "lib/planet-wars/net/net_client"
# require_relative "lib/planet-wars/net/net_server"

require_relative "lib/planet-wars/gameui/gameui"

require_relative "lib/planet-wars/game/engine"
require_relative "lib/planet-wars/game/music_manager"
require_relative "lib/planet-wars/game/name_gen"
require_relative "lib/planet-wars/game/world_gen"
require_relative "lib/planet-wars/game/minimap_gen"

require_all "lib/planet-wars/achievements"

require_relative "lib/planet-wars/objects/notification"
require_relative "lib/planet-wars/objects/portal"
require_relative "lib/planet-wars/objects/target_area"
require_relative "lib/planet-wars/objects/planet"
require_relative "lib/planet-wars/objects/ship"
require_relative "lib/planet-wars/objects/enemy"
require_relative "lib/planet-wars/objects/empty"
require_relative "lib/planet-wars/objects/bullet"
require_relative "lib/planet-wars/objects/base"
require_relative "lib/planet-wars/objects/minimap"
require_relative "lib/planet-wars/objects/text"
require_relative "lib/planet-wars/objects/boost_bar"
require_relative "lib/planet-wars/objects/health_bar"

require_relative "lib/planet-wars/game/state/boot"
require_relative "lib/planet-wars/game/state/credits"
require_relative "lib/planet-wars/game/state/mainmenu"
require_relative "lib/planet-wars/game/state/multiplayer_menu"
require_relative "lib/planet-wars/game/state/settings_menu"
require_relative "lib/planet-wars/game/state/mode_menu"
require_relative "lib/planet-wars/game/state/game"
require_relative "lib/planet-wars/game/state/netgame"
require_relative "lib/planet-wars/game/state/gameover"
require_relative "lib/planet-wars/game/state/upgrade_ship"
require_relative "lib/planet-wars/game/state/planet_view"

Thread.abort_on_exception = true
Gosu::enable_undocumented_retrofication

begin
  build = Integer(open("#{Dir.pwd}/lib/planet-wars/dev_stats/build.dat").read)
  build += 1
  open("#{Dir.pwd}/lib/planet-wars/dev_stats/build.dat", 'w') do |file|
    file.write build
  end
  BUILD = build
rescue => e
  puts e
  open("#{Dir.pwd}/lib/planet-wars/dev_stats/build.dat", 'w') do |file|
    BUILD = 0
    file.write BUILD
  end
end
# if ARGV.join.include?('--debug')
  # at_exit do
    # puts "==== Garbage Collector ===="
    # GC.stat.each do |key, value|
      # puts "#{key}: #{value}"
    # end
  # end
# end

# result = RubyProf.profile do |prof|
  # prof.eliminate_methods!([/Integer#times/])
  # prof.eliminate_methods!([/Array#each/])
  # prof.eliminate_methods!([/Kernel#loop/])
  # prof.eliminate_methods!([/Kernel#sleep/])
  # prof.eliminate_methods!([/Class#new/])
  # game = Thread.new do
    Engine.new.show
  # end
  # game.join
# end
# 
# printer = RubyProf::GraphHtmlPrinter.new(result)
# printer.print(File.open("#{Dir.pwd}/lib/planet-wars/dev_stats/ruby-prof.html", 'w'))