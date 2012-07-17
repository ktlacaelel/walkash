
module Walkash

  def self.walk(hash, lambda_functions)
    id_generator  = Proc.new { Time.now.tv_sec.to_s + (1..10000).to_a.shuffle.first(10).to_s }
    targets = []
    targets << { :id => id_generator.call, :hash => hash }

    while(targets.size > 0) do
      targets.each do |object|
        id, target = object[:id], object[:hash]
        target.keys.each do |key|
          if target[key].is_a?(Hash)
            targets << { :id => id_generator.call, :hash => target[key] }
          end
        end
      end
      flattened_targets = targets
      targets = []
    end

    flattened_targets.each do |target|
      lambda_functions.each do |lambda_function|
        target[:hash].keys.each do |key|
          lambda_function.call(target[:hash], key, target[:hash][key])
        end
      end
    end
    nil
  end

end

