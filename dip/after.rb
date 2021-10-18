class TerminalPrinter
  def write(msg, _opts)
    $stdout.write "#{@prefix} #{msg}"
  end
end

class FilePrinter
  def write(msg, opts)
    filename = opts.fetch(:filename) { 'log.txt' }

    File.open(filename, 'a+:UTF-8') do |f|
      f.write msg
      f.write "\n"
    end
  end
end

class Logger
  def initialize
    @prefix = "#{Time.now.strftime('%d-%b-%Y %H:%M:%S')} -->"
  end

  def log(msg:, printer: TerminalPrinter, opts: {})
    printer.new.write "#{@prefix} #{msg}", opts
  end
end

logger = Logger.new
logger.log msg: 'hi'
logger.log msg: 'Log to file', printer: FilePrinter