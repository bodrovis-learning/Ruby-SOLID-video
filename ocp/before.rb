class Logger
  def log(message)
    $stdout.write "#{Time.now.strftime('%d-%b-%Y %H:%M:%S')} --> #{message}"
  end
end

logger = Logger.new
logger.log 'hi'