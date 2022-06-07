class ElementsReflex < ApplicationReflex
  def sort
    elements = JSON.parse(element.dataset[:elements])
    elements.each do |element|
      element_row = Element.find(element['id'])
      element_row.update(position: element['position'])
    end
  end
end