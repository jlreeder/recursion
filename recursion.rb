def sum_to(n)
  return 1 if n == 1
  return nil if n < 1 # Can this be acheived w/o a separe base case?
  n + sum_to(n - 1)
end
