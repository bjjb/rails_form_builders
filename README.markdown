JJ's Ruby on Rails Form Builders
================================

Some convenient Ruby on Rails Rails form builders.

To use them (for example, the LabeledFormBuilder), you first need to download
the [labeled_form_builder.rb][] script, and plonk it into the Rails
application's lib/ directory. (You can put it in another directory, such as
app/forms - but you will have to add that directory to the load paths in the
environment).

Then you simply create a form in your ERB template with

<code class="ruby">
<% form_for @model, :builder => LabeledFormBuilder do |f| %>
  <%= f.text_field :name %>
  <%= f.text_area :description %>
<% end %>
</code>

[labeled_form_builder.rb]: http://github.com/jjbuckley/rails_form_builders/raw/master/labeled_form_builder.rb 
