class Person < ActiveRecord::Base

    has_many :things, :through => :opinions

end
