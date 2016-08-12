
def letter_frequency(text)
  text = text.downcase
  h = Hash.new(0)
  text.each_char { |c| h[c] += 1 if c != ' ' }
  ary = Array.new
  h.each do |k,v|
    ary.push([k,v])
  end
  ary.sort { |a,b| b[1] <=> a[1]}
  p ary
end

text = "uu AAaa bbbBB rrXZDSLAK"

letter_frequency(text)
