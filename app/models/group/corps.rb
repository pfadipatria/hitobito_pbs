# encoding: utf-8
# extends class Atbteilung because Corps is an Abteilung with additional Features.

class Group::Corps < Group::Abteilung
 
  self.layer = true
  self.used_attributes += [:pta, :vkp, :pbs_material_insurance]
  self.superior_attributes += [:pta, :vkp, :pbs_material_insurance]
                  
  children Group::Abteilung

  has_many :member_counts

  ### ROLES

  class Corpsleitung < ::Role
    self.permissions = [:layer_full, :contact_data]
  end

  class CorpsleitungStv < ::Role
    self.permissions = [:layer_full, :contact_data]
  end

 class MitgliedCorpsrat < ::Role
    self.permissions = [:group_read]
  end
  
  roles Corpsleitung,
        CorpsleitungStv,
        MitgliedCorpsrat

    


end
