prawn_document() do |pdf|
  filename = "#{Rails.root}/app/assets/images/banorte.pdf"
  pdf.start_new_page(:template => filename, :template_page => 1, :margin => 0)
  pdf.fill_color "000000"
  @fields.each do |field|
  	pdf.text_box field[:value], :at => [field[:field][:axis_x], pdf.cursor-field[:field][:axis_y]]
  end
  pdf.fill_color "000000"
  pdf.stroke_bounds
end