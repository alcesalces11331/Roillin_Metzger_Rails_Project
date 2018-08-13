<!-- Cat.spells iterator -->
<% @cat.spells.each do |s| %>
  <h3><%= s.name %></h3>
  <h3><%= s.type %></h3>
  <p><%= s.description %></p>
<% end %>

<!-- Cat.potions iterator -->
<% @cat.potions.each do |p| %>
  <h3><%= p.name %></h3>
  <p><%= p.description %></p>
<% end %>
