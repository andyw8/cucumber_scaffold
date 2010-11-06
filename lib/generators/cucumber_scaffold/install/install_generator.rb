module CucumberScaffold
  class InstallGenerator < Rails::Generators::NamedBase

    argument :model_name, :type => :string

    source_root File.expand_path('../templates', __FILE__)

    def do_it

      template('shared/web_steps_additional.rb', 'features/step_definitions/web_steps_additional.rb')

    end

  end
end