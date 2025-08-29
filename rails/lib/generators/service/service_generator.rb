class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def generate
    template 'app.erb',  path_of_app
    template 'spec.erb', path_of_spec
  end

  private
    def path_of_app
      File.join('app/services', "#{file_name}_service.rb")
    end

    def path_of_spec
      File.join('spec/services', "#{file_name}_service_spec.rb")
    end
end
