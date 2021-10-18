class TerminalPrinter
  def write(msg)
    $stdout.write "#{@prefix} #{message}"
  end
end

class FilePrinter
  def write(msg)
    File.open('log.txt', 'a+:UTF-8') do |f|
      f.write msg
      f.write "\n"
    end
  end
end

class Logger
  def initialize
    @prefix = "#{Time.now.strftime('%d-%b-%Y %H:%M:%S')} -->"
  end

  def log_stdout(message)
    TerminalPrinter.new.write "#{@prefix} #{message}"
  end

  def log_file(message)
    FilePrinter.new.write "#{@prefix} #{message}"
  end
end

logger = Logger.new
logger.log_file 'hi'