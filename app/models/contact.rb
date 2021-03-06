class Contact < ActiveRecord::Base
    validates :name, presence:true 
    validates :phone, presence:true, numericality:true}
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	def self.search(search)
  		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['title LIKE ? OR description 	 		LIKE ?',search_condition,search_condition])
	end

end
