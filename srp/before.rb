class ExportCsv
  attr_reader :data

  def initialize(raw_data)
    @data = parse raw_data
  end

  def generate_file(filename)
    File.open(filename, 'w+:UTF-8') do |f|
      f.write @data
    end
  end

  def parse(raw_data)
    raw_data.inject('') do |result, item|
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

exporter = ExportCsv.new(data)
exporter.generate_file('out.csv')