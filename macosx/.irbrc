# awesome print
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

# bond
begin
  require 'bond'
  Bond.start
rescue LoadError => err
  warn "Couldn't load bond: #{err}"
end

# configure irb
IRB.conf[:PROMPT_MODE] = :SIMPLE

