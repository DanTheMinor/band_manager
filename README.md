# Band Manager
This app is designed for a band manager to create venues and bands in a database. The bands can be updated and deleted as needed. Each band can be assigned venues and these venues will be displayed whenever the band's page is visited.

Author: Daniel Minor (github user: DanTheMinor)
known bugs:
--

#Rake instructions
rake db:create
rake db:create_migration NAME=create_table_venues
rake db:create_migration NAME=create_table_bands
rake db:create_migration NAME=create_table_bands_venues
rake db:migrate
rake db:test:prepare

ruby version: 2.2.0

GNU General Public License, version 2:
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
