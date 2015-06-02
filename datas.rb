module Datas
  def self.load
    data = File.read "data.csv"

    rows = data.split("\n")

    $headers = rows.first.split(",")

    arr = rows[1..-1].map{|x| x.split(",") }.map do |x|
      creer_hash(x)
    end

    arr
  end

  def self.creer_hash data
    hash = {}

    data.each_with_index do |x, idx|
      hash[$headers[idx]] = x
    end

    return hash
  end


  def self.filtre_ville arr, ville
    if ville.nil?
      arr
    else
      arr.select{|x| x["COUNTY_NAME"]==ville }
    end
  end

  def self.filtre_injury arr, filtrer
    if filtrer
      arr.select{|x| x["INJURY"]=="YES" }
    else
      arr
    end
  end

end