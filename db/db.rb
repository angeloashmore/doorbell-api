module DB
  def setup
    ROM.use :auto_registration

    setup_connection_to_db
    load_files

    ROM.finalize.env
  end

  def setup_connection_to_db
    case ENV['RACK_ENV']
    when 'production'
      production_settings
    else
      dev_settings
    end.default.connection
  end

  private

  def production_settings
    options = {
      host: ENV.fetch('RETHINKDB_HOST'),
      port: ENV.fetch('RETHINKDB_PORT'),
      db: ENV.fetch('RETHINKDB_DATABASE')
    }
    ROM.setup(:rethinkdb, options)
  end

  def dev_settings
    options = {
      host: ENV.fetch('RETHINKDB_HOST'),
      port: ENV.fetch('RETHINKDB_PORT'),
      db: ENV.fetch('RETHINKDB_DATABASE')
    }
    ROM.setup(:rethinkdb, options)
  end

  def load_files
    %w(models relations mappers commands).each { |dir| require_rel dir }
  end

  def root
    File.dirname(__FILE__)
  end

  module_function :setup, :setup_connection_to_db, :production_settings,
                  :dev_settings, :load_files, :root
end
