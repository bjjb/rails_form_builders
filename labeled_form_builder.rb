class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  %w(text_field collection_select text_area password_field).each do |method|
    define_method(method) do |field_name, *args|
      paragraph_tag(method) do
        label(field_name, *args) + "<br />" + super(field_name, *args)
      end
    end
  end

  def check_box(field_name, *args)
    paragraph_tag('check_box') do
      super(field_name, *args) + " " + label(field_name, *args)
    end
  end

  def submit(*args)
    paragraph_tag('submit') do
      super(*args)
    end
  end

  def check_boxes(name, objects, id_method, name_method, options = {})
    paragraph_tag('check_boxes') do
      field_name = "#{object_name}[#{name}][]"
      objects.map do |object|
        @template.check_box_tag(
          field_name,
          object.send(id_method),
          object.send(name_method).include?(object.send(id_method))
        ) + " " + object.send(name_method)
      end.join("<br />") + @template.hidden_field_tag(field_name, "")
    end
  end

private

  def label(field, *args)
    options = args.extract_options!
    options[:label_class] = "required" if options[:required]
    super(field, options[:label], :class => options[:label_class])
  end

  def paragraph_tag(field_name, &block)
    @template.content_tag(:p, { :class => field_name }, &block)
  end
end
