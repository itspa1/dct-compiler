fname = File.open("pk_46.txt","w")
$stderr = fname
$stdout = fname
puts "this is ruby"
puts 10 + "a"
fname.close
