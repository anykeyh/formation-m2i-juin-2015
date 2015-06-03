Projet.require_files "helpers/html_helper"

class IndexController
  include HtmlHelper

  def initialize
    @accidents = Datas.load
  end

  def index
    ERB.new(File.read "./views/index.html.erb").result(binding)
  end
end