class Logger
  def initialize
    @format = '%d-%b-%Y %H:%M:%S -->'
  end

  def log(message)
    prefix = Time.now.strftime @format
    $stdout.write "#{prefix} #{message}\n"
  end
end

class CustomLogger < Logger
  def initialize
    super
    @format = '%H:%M:%S -->'
  end
end

logger = Logger.new
logger.log 'hi'
puts '======'

c_logger = CustomLogger.new
c_logger.log 'custom log!'