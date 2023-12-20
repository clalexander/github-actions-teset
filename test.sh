vars='{"TEST_THIS__KEY":"value","TEST_ANOTHER_KEY":"value2","nottest":"notvalue"}'

function convert {
	values=$1
	prefix=$2
	output=$3
	echo $values | jq -r --arg prefix $prefix 'to_entries
		| map(select(.key | startswith($prefix)) | "\($prefix + (.key | ltrimstr($prefix) | ascii_downcase))=\(.value)")
		| .[]' >> $output
}

# echo $vars | jq -r 'to_entries
	# | map(select(.key | startswith("TEST_"))
	# | "\("TEST_" + (.key | ltrimstr("TEST_") | ascii_downcase))=\(.value)")
	# | .[]' >> output.txt

# echo $(convert $vars "TEST_") >> output.txt

# printf "$s\n" "$(convert $vars "TEST_")[@]" > output.txt

convert $vars "TEST_" output.txt

