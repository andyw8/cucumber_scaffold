def replace_spaces_with_underscores_in_keys(hashes)
  # hashes will either be a single hash or an array of hashes
  if hashes.class == Hash
    result = {}
    hashes.each_pair do |key, value|
      new_key = key.gsub(' ', '_')
      result[new_key] = value
    end
  else
    result = []
    hashes.each do |record|
      result << {}
      record.each_pair do |key, value|
        new_key = key.gsub(' ', '_')
        result.last[new_key] = value
      end
    end
  end
  result
end