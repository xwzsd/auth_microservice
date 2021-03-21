  namespace :db do
    desc 'Run database schema'
    task :schema, %i[version] => :settings do |t|
      require 'sequel'

      Sequel.connect(Settings.db.to_hash) do |db|
        db.extension(:schema_dumper)

        File.open(File.join(Settings.app.schema_path, Settings.app.schema_file_name).to_s, 'w') do |file|
          file << db.dump_schema_migration(indexes: true, foreign_keys: true)
        end
      end
    end
  end
