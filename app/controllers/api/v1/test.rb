lines = IO.readlines('debug.log')
num_of_ip = {}
lines.each do |line|
  ip = line.match(/(?<="client_ip":")([\d|\.]+)/).to_a
  next if ip[0].nil?
  num_of_ip[ip[0]] ||= 0
  num_of_ip[ip[0]] += 1
end