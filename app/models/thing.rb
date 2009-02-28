class Thing < ActiveRecord::Base

    Thing.inheritance_column = 'subtype'

    has_one :original_opinion, :class_name => 'Opinion', :conditions => 'opinions.original = 1', :dependent => :destroy
    has_many :good_opinions, :class_name => 'Opinion', :conditions => "opinions.type = 'love'", :dependent => :destroy, :order => 'opinions.created_at DESC'
    has_many :bad_opinions, :class_name => 'Opinion', :conditions => "opinions.type = 'hate'", :dependent => :destroy, :order => 'opinions.created_at DESC'

    has_one :creator, :class_name => 'Person', :through => :original_opinion, :source => 'person'
    has_many :lovers, :class_name => 'Person', :through => :good_opinions, :source => 'person'
    has_many :haters, :class_name => 'Person', :through => :bad_opinions, :source => 'person'

end
