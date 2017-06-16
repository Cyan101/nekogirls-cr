def spacefree
  ng_space = `du ./public/p -s`.split.first.to_f / 1024
  ng_space = (ng_space / 1024).round(2)
  ng_spacefree = (17 - ng_space).to_s # -2.5GB to account for system/other files
  return ng_spacefree[0,5]
end

def amount
  (`ls ./public/p -l | wc -l`.to_i - 1).to_s
end
