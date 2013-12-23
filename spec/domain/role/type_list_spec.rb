# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Role::TypeList do

  it 'contains all groups for top layer' do
    list = Role::TypeList.new(Group::Bund)
    all_groups = list.to_enum.collect do |layer, groups|
      [layer, groups.keys]
    end

    all_groups.should == [
      ['Bund', ['Bund']],
      ['Kantonalverband', ['Kantonalverband']],
      ['Region', ['Region']],
      ['Abteilung', ['Abteilung', 'Biber', 'Wölfe', 'Pfadi', 'Pio', 'PTA', 'Elternrat']],
      ['Global', ['Gremium', 'Rover']],
    ]
  end

end