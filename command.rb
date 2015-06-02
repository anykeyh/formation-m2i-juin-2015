require 'optparse'

module Command
  def self.get_options
    options = {}

    OptionParser.new do |opts|
      opts.on("-v [VILLE]", "Filtrer par ville") do |ville|
        options[:ville] = ville
      end
      opts.on("-i") do
        options[:injury] = true
      end
    end.parse!

    options
  end

end