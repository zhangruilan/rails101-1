class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :groups
         has_many :group_relationships
         has_many :partcipated_groups, :through => :group_relationships, :source => :group
         has_many :posts
         def is_member_of?(group)
           partcipated_groups.include?(group)
         end

         def join!(group)
           partcipated_groups << group
         end

         def quit!(group)
           partcipated_groups.delete(group)
         end

end
