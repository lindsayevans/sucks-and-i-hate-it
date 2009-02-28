class Opinion < ActiveRecord::Base

    Opinion.inheritance_column = 'subtype'

    belongs_to :thing
    belongs_to :person

end
