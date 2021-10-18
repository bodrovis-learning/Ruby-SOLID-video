class PrintCsv
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def generate_file(data)
    File.open(@filename, 'w+:UTF-8') do |f|
      f.write data
    end
  end
end

class FormatData
  attr_reader :raw_data

  def initialize(raw_data)
    @raw_data = raw_data
  end

  def format
    @raw_data.inject('') do |result, item|
      result << [
        item[:name],
        item[:surname],
        item[:occupation]
      ].join(',')
      
      result << "\n"
    end
  end
end

data = [
  {
    name: 'Sherlock',
    surname: 'Holmes',
    occupation: 'private detective'
  },
  {
    name: 'John',
    surname: 'Watson',
    occupation: 'doctor'
  }
]

formatter = FormatData.new(data)
formatted_data = formatter.format

exporter = PrintCsv.new('out.csv')
exporter.generate_file(formatted_data)