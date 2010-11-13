module CucumberScaffold
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    def do_it

      template('step_definitions/web_steps_additional.rb', 'features/step_definitions/web_steps_additional.rb')
      template('support/table_helpers.rb', 'features/support/table_helpers.rb')

    end

  end
end