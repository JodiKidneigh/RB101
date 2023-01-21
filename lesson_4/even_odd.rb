count = 1

loop do
  if count % 2 == 0
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  break if count > 4
  count += 1
end
