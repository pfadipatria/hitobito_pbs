# encoding: utf-8

#  Copyright (c) 2012-2014, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

class Salutation

  I18N_KEY_PREFIX = 'activerecord.models.salutation.available'

  attr_reader :person

  class << self

    def available
      I18n.t(I18N_KEY_PREFIX).each_with_object({}) do |s, h|
        h[s.first.to_s] = s.last[:label]
      end
    end

  end

  def initialize(person)
    @person = person
  end

  def label
    I18n.translate("#{I18N_KEY_PREFIX}.#{person.salutation}.label") if person.salutation?
  end

  def value
    return nil unless person.salutation?

    gender = person.gender.presence || 'other'
    I18n.translate("#{I18N_KEY_PREFIX}.#{person.salutation}.value.#{gender}",
                   first_name: person.first_name,
                   last_name: person.last_name,
                   nickname: person.nickname,
                   company_name: person.company_name,
                   title: person.title,
                   title_last_name: "#{person.title} #{person.last_name}".strip)
  end

end
