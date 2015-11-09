class EmailDetector
  def self.parse(input)
    output = []
    input.split(' ').map do |word|
      if word.include?('@') && word.include?('.')
        email = self.strip_punctuation(word)
        output << email unless output.include?(email)
      end
    end
    output.sort_by{|word| word}.join(';')
  end

  def self.strip_punctuation(word)
    letters = word.chars
    # .chomp could also be used to remove the punctuation
    until letters.last[/[a-zA-Z]+/] == letters.last
      letters.pop
    end
    letters.join
  end
end

# also, check out the .encode method

# def pull_email(data)
#   valid_email = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/
#   data.map  { |datum|
#     datum.encode('UTF-8', :invalid => :replace, :undef => :replace, :replace => "")
#   }.map{ |line| line.scan(valid_email)}
#     .flatten
#     .uniq
#     .sort
#     .join(";")
# end
