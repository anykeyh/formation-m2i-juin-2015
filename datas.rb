Projet.require_files "accident"

module Datas
  def self.load
    data = File.read "data.csv"

    rows = data.split("\n")

    @headers = rows.first.split(",").map(&:downcase)

    arr = rows[1..-1].map{|x| x.split(",") }.map do |x|
      creer_accident(x)
    end

    arr
  end

  def self.headers
    @headers
  end

  def self.creer_accident data
    a = Accident.new

    @headers.each_with_index do |header, idx|
      if a.respond_to? "#{header}="
        a.send "#{header}=", data[idx]
      end
    end

    return a
  end

  def self.filtre_ville arr, ville
    if ville.nil?
      arr
    else
      arr.select{|x|  x.county_name==ville }
    end
  end

  def self.filtre_injury arr, filtrer
    if filtrer
      arr.select{|x| x.injury=="YES" }
    else
      arr
    end
  end

end