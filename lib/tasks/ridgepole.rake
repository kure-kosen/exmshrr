namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ridgepole('--apply', "--file #{schema_file}")
    Rake::Task['db:schema:dump'].invoke
  end

  private

  def schema_file
    Rails.root.join('db/Schemafile')
  end

  def config_file
    Rails.root.join('config/database.yml')
  end

  def ridgepole(*options)
    command = ['bundle exec ridgepole', "--config #{config_file}"]
    system [command + options].join(' ')
  end
end
