require 'rails_helper'

describe "weekdays endpoints", type: :request do
    it 'returns all weekdays' do
        get '/weekdays'
        expect(response).to have_http_status(401)
    end
end
