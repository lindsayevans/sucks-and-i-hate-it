class Thing < ActiveRecord::Base

    Thing.inheritance_column = 'subtype'

    # Associations
    has_one :original_opinion, :class_name => 'Opinion', :conditions => 'opinions.original = 1', :dependent => :destroy
    has_many :good_opinions, :class_name => 'Opinion', :conditions => "opinions.type = 'love'", :dependent => :destroy, :order => 'opinions.created_at DESC'
    has_many :bad_opinions, :class_name => 'Opinion', :conditions => "opinions.type = 'hate'", :dependent => :destroy, :order => 'opinions.created_at DESC'

    has_one :creator, :class_name => 'Person', :through => :original_opinion, :source => 'person'
    has_many :lovers, :class_name => 'Person', :through => :good_opinions, :source => 'person'
    has_many :haters, :class_name => 'Person', :through => :bad_opinions, :source => 'person'

    # Validations


    def suffix
	case self.type
	when 'it'
	    'sucks and I hate it'
	when 'them'
	    'sucks and I hate them'
	when 'him'
	    'sucks and I hate him'
	when 'her'
	    'sucks and I hate her'
	end
    end

    def Thing.type_from_domain(domain)
	case domain.split('.')[0]
	when 'sucksandihateit'
	    'it'
	when 'suckandihatethem'
	    'them'
	when 'sucksandihatehim'
	    'him'
	when 'sucksandihateher'
	    'her'
	end

    end

end
