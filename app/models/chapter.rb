# frozen_string_literal: true

# == Schema Information
#
# Table name: chapters
#
#  id               :integer          not null, primary key
#  bismillah_pre    :boolean
#  revelation_order :integer
#  revelation_place :string
#  name_complex     :string
#  name_arabic      :string
#  name_simple      :string
#  pages            :string
#  verses_count     :integer
#  chapter_number   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Chapter < QuranCoreRecord
  include Slugable
  include QuranNavigationSearchable
  include NameTranslateable

  has_many :verses
  has_many :chapter_infos

  serialize :pages

  default_scope { order 'chapter_number asc' }

  def default_slug
    default = slugs.where(is_default: true).first
    default&.slug || chapter_number
  end
end
