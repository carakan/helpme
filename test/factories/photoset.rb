Factory.define :'picto/photoset' do |f|
  f.sequence(:title) { |n| "title_#{n}" }
end
