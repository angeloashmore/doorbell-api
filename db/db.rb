module DB
  def setup
    setup_connection_to_db
    load_files

    ROM.finalize.env
    ROM.env.gateways[:default].run_migrations
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
    host = ENV.fetch('POSTGRESQL_HOST')
    db = ENV.fetch('POSTGRESQL_DATABASE')
    user = ENV.fetch('POSTGRESQL_USER')
    password = ENV.fetch('POSTGRESQL_PASSWORD')
    uri = "postgres://#{host}/#{db}?user=#{user}&password=#{password}"
    ROM.setup(:sql, uri)
  end

  def dev_settings
    host = ENV.fetch('POSTGRESQL_HOST')
    db = ENV.fetch('POSTGRESQL_DATABASE')
    user = ENV.fetch('POSTGRESQL_USER')
    password = ENV.fetch('POSTGRESQL_PASSWORD')
    uri = "postgres://#{host}/#{db}?user=#{user}&password=#{password}"
    ROM.setup(:sql, uri)
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
