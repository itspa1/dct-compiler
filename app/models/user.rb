class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :answers
         has_many :permissions
         has_many :roles,through: :permissions
         has_many :assignments

         after_create :assign_user_role

         def role? role
           self.roles.pluck(:name).include? role
         end

         def assign_user_role
           Permission.create(user_id: self.id,role_id: Role.last.id)
         end
end
