# encoding: utf-8

#  Copyright (c) 2012-2014, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

module GroupsPbsHelper

  def format_group_website(group)
    if group.website?
      url = group.website.start_with?('http') ? group.website : "http://#{group.website}"
      link_to(group.website, url, target: '_blank')
    end
  end

end
