module TwitterBootstrapHelper

	def tb_alert_class_for flash_type
		case flash_type.to_s
		  when ''
		    'alert-success' # Green
		  when "error"
		    'alert-danger' # Red
		  when 'alert'
		    'alert-warning' # Yellow
		  when 'notice'
		    'alert-info' # Blue
		  else
		    flash_type.to_s
		end
	end

	def tb_show_errors_for model, message = nil
		render 'layouts/form_errors', model:model, message:message
	end

	def tb_has_error model, field
		if model
			model.errors.any? && model.errors[field] != [] ? 'has-error' : ''
		end
	end
end