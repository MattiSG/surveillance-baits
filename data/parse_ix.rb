data = IO.read './ix.txt'

result = []

current_country = ''

data.each_line do |line|
	line.strip!

	if line[1] == '*'
		entry = []
		name, city = '', ''
		line.match /\[\[([^\[]+)\]\]/ do |match|
			name = match[1]
		end

		line.gsub!(name, '')

		line.match /\[\[([^\[]+)\]\]/ do |match|
			city = match[1]
		end

		entry.push name
		entry.push city
		entry.push current_country
	else
		current_country = line.tr('*', '').strip.tr('[[', '').tr(']]', '')
	end

	result.push entry if entry
end


puts 'name,city,country,lat,lng'
result.each do |entry|
	puts entry.join ','
end
