class EntriesController < ApplicationController
    before_filter :login_required, except: [:index, :show]
end
