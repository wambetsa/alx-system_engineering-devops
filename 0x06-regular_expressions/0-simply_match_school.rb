#!/usr/bin/env ruby

# Check if the argument matches the regular expression
def match_school(string)
    regex = /School/
    return string.match(regex)
  end
  
  # Accept one argument from the command line
  input_string = ARGV[0]
  
  # Call the match_school method with the input string
  match_result = match_school(input_string)
  
  # Print the matched substring or an empty string
  puts match_result ? match_result[0] : ""  
