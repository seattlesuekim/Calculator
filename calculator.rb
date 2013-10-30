def add_numbers(first, second)
  first + second
end

def subtract_numbers(first, second)
  first - second
end

def divide_numbers(first, second)
	first / second
end

def multiply_numbers(first, second)
	first * second
end

def find_mean(first, second)
	(first + second) / 2
end

def find_exp(first, second)
	first ** second
end

def find_sqrt(first)
	Math.sqrt(first)
end

def factorial(first)
	if first == 0
		return 1
	else
		first * factorial(first - 1)
	end
end

def is_number(number)
  number.to_f.to_s == number.to_s || number.to_i.to_s == number.to_s
end

def is_single_number(action)
	if action == "sqrt" or action == "factorial" or action == "!"
		return true
	else
		return false
	end
end

def driver
	puts "what's your name: "
	name = gets.chomp
	if name == ""	
	  name = "Dave"
	end
	puts "add, subtract, multiply, divide, average, sqrt, factorial, or exponent?"
	action = gets.chomp.downcase

	puts "First number?"
	first_num = gets.chomp

	if is_single_number(action) == false
		puts "Second number?" 
		second_num = gets.chomp
		if is_number(second_num) == true
		  second_num = second_num.to_i
		end
	end

	if is_number(first_num) == true 
		first_num = first_num.to_i
	end
	
	if  (is_number(second_num) == false and is_single_number(action) == false) or is_number(first_num) == false
		puts "\n\n\n\n\nI can't do that becuase you entered a #{first_num.class} with a #{second_num.class}\n\n\n\n\n."
		return nil
	end
	return action, first_num, second_num, name
end

def do_math
	action, first_num, second_num, name = driver()
	if action == "add" || action == "+" || action == " + "
	  operator = "+"
	  result = add_numbers(first_num, second_num)
	elsif action == "subtract" || action ==  "-" ||  action == " - "
	  operator = "_"
	  result = subtract_numbers(first_num, second_num)
	elsif action == "multiply" || action ==  "*" || action ==  " * "
	   operator = "*"
	   result = multiply_numbers(first_num, second_num)
	elsif action == "divide" || action ==  "/" || action ==  " / "
	  operator = "/"
	  result = divide_numbers(first_num, second_num)
	elsif action == "average"
	  operator = "avg"
	  result = find_mean(first_num, second_num)
	elsif action == "exponent" || action ==  "**" || action ==  " ** "
	  operator = "**"
	  result = find_exp(first_num, second_num)
	elsif action == "factorial" || action == "!"
	  operator = "!"
	  result = factorial(first_num)	
	else
	  result = "Sorry, I don't know how to do that, #{name}."
	end

	puts "#{first_num} #{operator} #{second_num} = #{result}"
end

do_math()