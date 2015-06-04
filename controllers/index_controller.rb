Projet.require_files "controllers/controller"

class IndexController < Controller
  def index
    @accidents = Datas.load[0..100]
    @cities = @accidents.map(&:county_name).compact.uniq.sort
  end

  def search
    value = params[:county]

    index
    @accidents = @accidents.select{|acc| acc.county_name == value }
    render :index, :index
  end
end