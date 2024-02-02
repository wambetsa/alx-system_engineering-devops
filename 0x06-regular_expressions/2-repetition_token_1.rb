#!/usr/bin/env ruby
# Check if an argument is provided
if ARGV.empty?
    puts "Usage: #{$PROGRAM_NAME} <string>"
    exit 1
  end
  
  # Regular expression pattern
  pattern = /hbt{2,5}n/
  
  # Input string
  input_string = ARGV[0]
  
  # Match the input string against the pattern
  if input_string.match?(pattern)
    puts "Match found: #{input_string}"
  else
    puts "No match found for 'hbt{2,5}n' in the input string."
  end