def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n - 1)
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr.pop + add_numbers(arr)
end

def gamma_fnc(n)
  return nil if n <= 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end
