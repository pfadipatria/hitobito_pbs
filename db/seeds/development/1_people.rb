# encoding: utf-8

#  Copyright (c) 2012-2014, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

require Rails.root.join('db', 'seeds', 'support', 'person_seeder')

class PbsPersonSeeder < PersonSeeder

  def amount(role_type)
    case role_type.name.demodulize
    when 'Passivmitglied', 'Biber', 'Wolf', 'Pfadi', 'Mitglied', 'Pio', 'Rover' then 5
    else 1
    end
  end

end

puzzlers = ['Pascal Zumkehr',
            'Pierre Fritsch',
            'Andreas Maierhofer',
            'Andre Kunz',
            'Roland Studer',
            'Mathis Hofer',
            'Bruno Santschi']

devs = {'Olivier Brian' => 'olivier.brian@bfh.ch'}
puzzlers.each do |puz|
  devs[puz] = "#{puz.split.last.downcase}@puzzle.ch"
end

seeder = PbsPersonSeeder.new

seeder.seed_all_roles

root = Group.root

devs.each do |name, email|
  seeder.seed_developer(name, email, root, Group::Bund::MitarbeiterGs)
end

# Seed Max Mustermann, Fidelio as Abteilungsleiter Pfadi Patria
patria = Group.find_by_name('Patria')
seeder.seed_developer('Max Mustermann', 'fidelio@pfadipatria.com', patria, Group::Abteilung::Abteilungsleitung)
seeder.seed_role(Person.find_by_email('fidelio@pfadipatria.com'), patria, Group::Abteilung::Abteilungsleitung)

person = Person.find_by_email('fidelio@pfadipatria.com')
person.nickname = 'Fidelio'
person.save
