total_sms     = 0
total_minutes = 0
total_data    = 0

def minutes_from_string(string)
  # There's a bug here for call longer than 1 hour which are incorrectly
  # counted as 100 instead of 60. But since this is a really rare case for me,
  # I don't really care about fixing it
  string.gsub(':', '').to_i / 100 + 1
end

def data_from_string(string)
  string.downcase.gsub('mb', '').gsub(',', '').to_i
end

def is_minutes?(string)
  string.match /\d{2}:\d{2}:\d{2}/
end

def is_data?(string)
  string.downcase.match /mb/
end

def is_sms?(string)
  string == '00:01:00'
end

File.open('phone.data', 'r').each_line do |line|
  line.chomp!

  if is_minutes? line
    if is_sms? line
      total_sms += 1
    else
      total_minutes += minutes_from_string line
    end
  elsif is_data? line
    total_data += data_from_string line
  else
    puts "Error, cannot parse: #{line}"
  end
end

puts "Total SMS:     #{total_sms}"
puts "Total minutes: #{total_minutes}"
puts "Total phone:   #{total_sms + total_minutes}"
puts "Total data:    #{(total_data / 100.0).round(2)}MB"
