class Song < ActiveRecord::Base
	include ActiveModel::Validations

	validates :title, presence: true
	validates :title, uniqueness: true
	validates :artist_name, presence: true
	validates :release_year, presence: true, if: :released?
	validate :rel_year_past, if: :release_year


	def released?
		self.released == true
	end


	def rel_year_past
    	if self.release_year > 2017
      		self.errors.add(:release_year, "can't be in the future")
    	end
    end
  

end

