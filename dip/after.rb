class TerminalPrinter
  def write(msg, _opts)
    $stdout.write "#{@prefix} #{msg}\n"
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
    @format = '%d-%b-%Y %H:%M:%S -->'
  end

  def log(msg:, printer: TerminalPrinter, opts: {})
    prefix = Time.now.strftime @format
    printer.new.write "#{prefix} #{msg}", opts
  end
end

logger = Logger.new
logger.log msg: 'hi'
logger.log msg: 'Log to file', printer: FilePrinter