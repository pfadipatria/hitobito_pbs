# encoding: utf-8
# extends class Atbteilung because Corps is an Abteilung with additional Features.

class Group::Corps < Group::Abteilung
 
 self.layer = true

  attr_accessible(*(accessible_attributes.to_a +
                    [:pbs_shortname, :pta, :vkp, :pbs_material_insurance]),
                  as: :superior)
                  
  children Group::Abteilung


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
