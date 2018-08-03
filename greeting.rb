def greeting
    greet = ARGV.shift
    
  ARGV.each do |x|
      puts "#{greet} #{x}"
  end
end

greeting
