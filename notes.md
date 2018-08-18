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

08/18:
1. Update Validation email for User to dump current session to create another. Or something.
2. Update sessions#welcome or maybe it will be fixed by updating 1.
