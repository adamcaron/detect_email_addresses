class EmailDetector
  def self.parse(input)
    output = []
    input.split(' ').map do |word|
      if word.include?('@') && word.include?('.')
        email = self.strip_punctuation(word)
        output << email unless output.include?(email)
      end
    end
    output.sort_by{|word| word.downcase}.join(';')
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

# "Traveler@ngs.org;
# apps@ngs.org;
# askngs@nationalgeographic.com;
# feedback@natgeotv.com;
# genographic@ngs.org;
# genographicespanol@ngs.org;
# givinginfo@ngs.org;
# jbmccorm@ngs.org;
# maps@ngs.org;
# mpotts@ngs.org;
# newsdesk@nationalgeographic.com;
# ngassignment@ngs.org;
# ngsdigital@customersvc.com;
# ngsforum@nationalgeographic.com;
# ngsline@customersvc.com;
# pressroom@ngs.org;
# speakers@ngs.org;
# stock@ngs.org;
# topo@ngs.org"

# "apps@ngs.org;
# askngs@nationalgeographic.com;
# askngs@nationalgeographic.com;
# feedback@natgeotv.com;
# genographic@ngs.org;
# genographicespanol@ngs.org;
# givinginfo@ngs.org;
# jbmccorm@ngs.org;
# maps@ngs.org;
# mpotts@ngs.org;
# newsdesk@nationalgeographic.com;
# ngassignment@ngs.org;
# ngsdigital@customersvc.com;
# ngsdigital@customersvc.com;
# ngsforum@nationalgeographic.com;
# ngsline@customersvc.com;
# pressroom@ngs.org;
# speakers@ngs.org;
# stock@ngs.org;
# topo@ngs.org;
# traveler@ngs.org"