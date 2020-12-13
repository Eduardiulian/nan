# frozen_string_literal: true

# Some utilities
class AutomorphsController < ApplicationController
  skip_before_action :require_auth, only: :switch

  def input
    redirect_to invitelist_url
  end

  def view; end

  def switch
    logger.info('~log: switch locale')
    I18n.default_locale = if I18n.default_locale == :en
                            :ru
                          else
                            :en
                          end
    redirect_to invitelist_url
    # redirect_to :back
  end
end
