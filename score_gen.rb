# time-start name(const) time-dur pitch(0-127)
# "0 tone 0 0"
# "0.5 end"

def ending num
  "#{num+1} end"
end

def score start, instr
  dur = rand + rand(0.15..0.6)
  pch = rand(55..73)
  "#{start} #{instr} #{dur.round 1} #{pch}"
end

def repeat amount, instr
  arr = []
  next_start = 0.25
  amount.times do |f|
    arr << score(next_start, instr)
    next_start += arr[f].split[2].to_f
    next_start = next_start.round 2
  end
  arr << ending(next_start)
end

puts repeat(20, "tone")
