class Logger
  def initialize
    @prefix = "#{Time.now.strftime('%d-%b-%Y %H:%M:%S')} -->"
  end

  def log(message)
    $stdout.write "#{@prefix} #{message}"
  end
end

class CustomLogger < Logger
  def initialize
    super
    @prefix = "#{Time.now.strftime('%H:%M:%S')} -->"
  end
end

logger = Logger.new
logger.log 'hi'

puts '======'

c_logger = CustomLogger.new
c_logger.log 'custom log!'