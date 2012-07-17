
require 'rubygems'
require 'walkash'
require 'pp'

hash = {
  1 => { 2 => { 3 => { 4 => { 5 => { 6 => { 7 => { 8 => { 9 => { 10 => { 'fix' => 'wrong', 'ignore' => 'wrong' }}}}}}}}}}
}

fix_wrong = lambda do |working_hash, key, value|
  working_hash[key] = 'correct' if (key == 'fix') && (value == 'wrong')
end

pp hash
Walkash.walk(hash, [fix_wrong])
pp hash

