Projet.require_files "helpers/html_helper"

class Controller
  include HtmlHelper
  attr_reader :params

  def initialize(params)
    @params = params
    @output_buffer = [""]
  end

  def concat x
    #Ajout dans la derniere chaine du tampon de buffer
    @output_buffer[-1] += x
  end

  def capture
    if block_given?
      open_buffer! #Creer un nouveau buffer
      yield #On ajoute via "concat" dans le buffer
      out = flush_buffer! #Et on transfert le buffer dans ERB.
      p @output_buffer

      out
    else
      ""
    end
  end

  def open_buffer!
    @output_buffer << "" #Ajout d'un element au tableau de tampon
  end

  def flush_buffer!
    output = @output_buffer.pop #Shift supprime le dernier element du tableau et retourne l'element supprimé

    #On combine les differents buffers
    @output_buffer[-1] += output
    @output_buffer.last
  end

  def render ctrl, action
    if @file_to_render.nil?
      @file_to_render = "./views/#{ctrl}/#{action}.html.erb"
    end
  end

  def print_out action
    if respond_to?(action)
      send(action)
    end

    controller_name = self.class.to_s.gsub(/Controller$/, "")

    render controller_name, action

    if File.exists?(@file_to_render)
      ERB.new(File.read @file_to_render).result(binding)
    else
      raise "Je ne trouve pas le template: #{@file_to_render}"
    end
  end
end