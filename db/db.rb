module DB
  module_function

  def setup
    setup_connection_to_db
    load_files

    ROM.finalize.env
    ROM.env.gateways[:default].run_migrations
  end

  def setup_connection_to_db
    case ENV.fetch('RACK_ENV', 'development')
    when 'production'
      production_settings
    else
      dev_settings
    end.default.connection
  end

  private

  def production_settings
    # require 'pg'
    # host = ENV.fetch('POSTGRESQL_HOST')
    # db = ENV.fetch('POSTGRESQL_DATABASE')
    # user = ENV.fetch('POSTGRESQL_USER')
    # password = ENV.fetch('POSTGRESQL_PASSWORD')
    # uri = "postgres://#{host}/#{db}?user=#{user}&password=#{password}"
    # ROM.setup(:sql, uri)
  end

  def dev_settings
    # require 'pg'
    ROM.setup(:sql, 'postgres://eyvynourvkdgwq:vuD0Fuw2epiB5hgIEF1ve_Fs1M@ec2-54-204-26-8.compute-1.amazonaws.com:5432/dbmtfp4u97uvbd')
  end

  def load_files
    %w(models commands mappers relations).each { |dir| require_rel dir }
  end

  def root
    File.dirname(__FILE__)
  end
end
