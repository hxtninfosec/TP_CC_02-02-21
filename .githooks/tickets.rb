#!/usr/bin/env ruby;C:/Ruby30-x64/bin/ruby.exe
$regex = /[\w\s\S]+ \[ref: \d+\]/
# Simple function, just for ease of testing
def parse_message(msg,re)
  if not re.match(msg)
    return false
  else 
    return true
  end
end

# enforced custom commit message format
def check_message_format(msg, ref)
  if not parse_message(msg,$regex)
    STDERR.puts "[git-hook] Your commit #{ ref } was rejected."
    STDERR.puts "[git-hook] Did you forget a ticket reference?"      
    exit 1
  end  
end

# The "main" method ... when executing this file:
#Only run this if the file itself is being executed
if __FILE__ == $0
  $ref, $tmp,  $commit_msg = ARGV[0].split(" ")
  check_message_format($commit_msg, $tmp)
end
