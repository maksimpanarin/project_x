# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: { message: 'Validation Failed', errors: ErrorSerializer.serialize(exception.record.errors) },
           status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { message: 'Not Found', error: exception.message }, status: :not_found
  end
end
