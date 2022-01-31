dictionary = []

files = ['adj.tsv',
         'interjection.tsv',
         'noun.adjv.tsv',
         'noun.adverbal.tsv',
         'noun.number.tsv',
         'noun.tsv',
         'noun.verbal.tsv',
         'verb.tsv',
         'neologd-common-noun-ortho-variant-dict-seed.20170228.tsv',
         'neologd-noun-sahen-conn-ortho-variant-dict-seed.20160323.tsv']

files.each do |file|
  File.open(file) do |f|
    dictionary |= f.read.tr('ァ-ン', 'ぁ-ん').split.filter { |w| /^[ぁ-ん]+$/.match?(w) }
  end
end

File.open('dictionary.json', 'w') do |f|
  f.write("[#{dictionary.sort.map { |w| "\"#{w}\"" }.join(',')}]")
end

puts("#{dictionary.size} words")
