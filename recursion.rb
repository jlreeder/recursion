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

require 'byebug'

def range(start_num, end_num)
  return [] if end_num < start_num
  return [end_num] if start_num == end_num

  range(start_num+1,end_num).unshift(start_num)
end

def sum_recursive(arr)
  return arr.first if arr.length == 1
  arr.first + sum(arr[1..-1])
end

def sum_iterative(arr)
  # arr.inject(:+)
  sum = 0
  arr.each { |el| sum += el }
  sum
end

def exp_1(b, n)
  return 1 if n == 0
  b * exp_1(b, n-1)
end

def exp_2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp_half = exp_2(b, n/2)
    exp_half * exp_half
  else
    exp_half_odd = exp_2(b, (n-1) / 2)
    b * exp_half_odd * exp_half_odd
  end
end

class Array

  def deep_dup
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end

  def subsets
    return [[]] if self.empty?

    copy = self.dup
    last_el = copy.pop
    subs = copy.subsets
    subs_with_last = subs.map { |sub_array| sub_array += [last_el] }
    subs.concat(subs_with_last)
  end
end

def fibonacci(num)
  return [1] if num.zero?
  return [1, 1] if num == 1

  previous_fib = fibonacci(num - 1)
  sum = previous_fib.last(2).reduce(:+)
  previous_fib.push(sum)
end

def fibonacci_iter(num)
  return [1] if num.zero?
  return [1, 1] if num == 1

  fib_nums = [1,1]
  (num-2).times do
    sum = fib_nums.last(2).reduce(:+)
    fib_nums << sum
  end
  fib_nums
end

class Array

  def permutations
    return [[]] if self.empty?
    perms = []

    last_perm = self[0...-1].permutations

    last_perm.each do |permutation|
      (permutation.length+1).times do |idx|
        perms << permutation.dup.insert(idx, self.last)
      end
    end
    perms
  end

  def bsearch(target)
    midpoint = length / 2

    return midpoint if self[midpoint] == target
    return nil if length == 1 && self.first != target

    if self[midpoint] > target
      self[0...midpoint].bsearch(target)
    elsif self[midpoint] < target
      add_to_midpoint = self[midpoint..-1].bsearch(target)
      midpoint += add_to_midpoint unless add_to_midpoint.nil?
    end
  end

  def merge_sort
    return self if length <= 1

    midpoint = length / 2
    left = self[0...midpoint].merge_sort
    right = self[midpoint..-1].merge_sort
    Array.merge(left, right)
  end

  def self.merge(left, right)
    merged = []
    until right.empty? || left.empty?
      smaller = left.first > right.first ? right.shift : left.shift
      merged << smaller
    end
    merged += left + right
  end
end

def greedy_make_change(amount, coins)
  chosen = []
  return chosen if amount.zero?
  next_coin = coins.max

  if amount >= next_coin
    chosen << next_coin
    amount -= next_coin
  else
    coins.delete(next_coin)
  end

  chosen += greedy_make_change(amount,coins)
end

# FIXME: Not yet complete
def make_better_change(amount, coins)
  combinations = []
  return combinations if amount <= 0

  coins.each do |coin|
    # TODO: Consider adding base case here, next if amount - coin < 0
    new_amount = amount - coin if amount - coin > 0
    new_coins = coins.select { |other| other <= coin }
    # debugger
    sub_combos = make_better_change(new_amount, new_coins)
    combinations << sub_combos
  end

  combinations.min
end
