=begin

unpack(p1) public
Decodes str (which may contain binary data) according to the format string, returning an array of each value extracted.
The format string consists of a sequence of single-character directives, summarized in the table at the end of this entry.
Each directive may be followed by a number, indicating the number of times to repeat with this directive.
An asterisk (“*”) will use up all remaining elements.

Integer      |         |
Directive    | Returns | Meaning
-----------------------------------------------------------------
C         | Integer | 8-bit unsigned (unsigned char)

=end

# method that takes input string & shift factor integer
def caesar_cipher(input_string, shift_factor)

  #the unpack means it converts the string into ASCII values
  positions = input_string.unpack('C*')

  puts "This should be the ASCII values"
  puts positions

  #shifted positions is the loop
  #for each position in the map, do the following
  #pos is the current value being worked on
  shifted_positions = positions.map do |pos|

  #using switch statements
    case pos


    #A-Z inclusive, a-z inclusive means include everything
    #this checks to see if the input is a letter
    when (65..90), (97..122)

      #modulus 26
      #shifted is the current position plus the shift factor
      shifted = pos + (shift_factor % 26) # use % 26 to account for shift factors over 26

      #now check to make sure it is a-z or A-Z
      #check if b/w 90 and 97, or if greater than 122
      if (shifted > 90 && shifted < 97) || (shifted > 122) # loop around

      #if so, shift it by subtracting 26
      #minus 26 to wrap around, looks like a few others did the same technique
      shifted = shifted - 26
      #end of if statement
      end
      
      #new       
      pos = shifted
    else
    pos # ignore non-alphabet chars

    end
=begin
    puts "This should be the shifted ASCII values"
    puts pos
=end
  end
  result_string = shifted_positions.pack('C*')
  puts result_string
end

puts "Input string:"
string_to_encrypt = gets.chomp
puts "Shift factor:"
shift_factor = gets.chomp.to_i
puts "Caesar Cipher:"
caesar_cipher(string_to_encrypt, shift_factor)
