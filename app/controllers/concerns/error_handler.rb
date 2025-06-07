# Error Handlers
#
module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
    rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
    rescue_from StandardError, with: :handle_standard_error
  end

  private

  def handle_standard_error(error)
    Rails.logger.error("Standard Error: #{error.message}")
    Rails.logger.error(error.backtrace.join("\n"))
    
    respond_to do |format|
      format.html do
        flash[:error] = "An unexpected error occurred: #{error.message}"
        redirect_back(fallback_location: root_path)
      end
      format.json { render json: { error: error.message }, status: :internal_server_error }
    end
  end

  def handle_not_found(error)
    Rails.logger.error("Record Not Found: #{error.message}")
    
    respond_to do |format|
      format.html do
        flash[:error] = "The requested resource was not found: #{error.message}"
        redirect_back(fallback_location: root_path)
      end
      format.json { render json: { error: error.message }, status: :not_found }
    end
  end

  def handle_validation_error(error)
    Rails.logger.error("Validation Error: #{error.message}")
    
    respond_to do |format|
      format.html do
        flash[:error] = "Validation failed: #{error.record.errors.full_messages.join(", ")}"
        redirect_back(fallback_location: root_path)
      end
      format.json { render json: { errors: error.record.errors }, status: :unprocessable_entity }
    end
  end

  def handle_parameter_missing(error)
    Rails.logger.error("Parameter Missing: #{error.message}")
    
    respond_to do |format|
      format.html do
        flash[:error] = "Required parameters are missing: #{error.message}"
        redirect_back(fallback_location: root_path)
      end
      format.json { render json: { error: error.message }, status: :bad_request }
    end
  end
end