class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    list = self.readers.map {|reader| reader.email}
    list.join(";")
  end 

  def self.most_popular
    self.all.max_by {|magazine| magazine.subscriptions.count}
  end 
end
