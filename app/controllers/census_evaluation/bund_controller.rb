# encoding: utf-8

#  Copyright (c) 2012-2014, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

class CensusEvaluation::BundController < CensusEvaluation::BaseController

  self.sub_group_type = Group::Kantonalverband

  def index
    super

    respond_to do |format|
      format.html do
        @show_confirmation_ratios = (year == current_year)
        @abteilungen = abteilung_confirmation_ratios if @show_confirmation_ratios
      end
    end
  end

  private

  def abteilung_confirmation_ratios
    @sub_groups.inject({}) do |hash, kantonalverband|
      hash[kantonalverband.id] = { confirmed: number_of_confirmations(kantonalverband),
                                   total: number_of_abteilungen(kantonalverband) }
      hash
    end
  end

  def number_of_confirmations(kantonalverband)
    MemberCount.where(kantonalverband_id: kantonalverband.id, year: year).count(:abteilung_id, distinct: true)
  end

  def number_of_abteilungen(kantonalverband)
    kantonalverband.descendants.where(type: Group::Abteilung.sti_name).count
  end

end