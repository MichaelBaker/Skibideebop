$coool = String.new

class Object
  def method_missing( thing , *args )
    $coool.insert( 0 , thing.to_s ) if %w[bodiddly dat dwee zibbidee].include?( thing.to_s )
  end
end

def sing_it_daddyo!( code )
  binary_to_scat_dictionary = Hash[ "00" => "bodiddly" , "01" => "dat" , "10" => "dwee" , "11" => "zibbidee" ]
  return "require_relative 'skibideebop'\n\n" + code.unpack('B*')[0].gsub(/../).map { |binary| binary_to_scat_dictionary[binary] }.join( ' ' )
end

END {
  scat_to_binary_dictionary = Hash[ /bodiddly/ => "00" , /dat/ => "01" , /dwee/ => "10" , /zibbidee/ => "11" ]
  scat_to_binary_dictionary.each_pair { |scat , binary| $coool.gsub!( scat, binary ) }
  eval $coool.gsub(/......../).to_a.map {|x| x.to_i(2) }.map{ |x| x.chr}.join
}