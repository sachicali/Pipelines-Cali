module ApplicationHelper
  def react_component(name, props = {}, options = {})
    id = options[:id] || "react-#{name.downcase}-#{SecureRandom.hex(4)}"
    class_name = options[:class] || ''
    
    content_tag(:div, 
      '', 
      id: id,
      class: class_name,
      data: {
        react_component: name.dasherize,
        props: props.to_json
      }
    )
  end
end
