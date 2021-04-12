require 'rails_helper'

describe 'authentication routes' do
  it 'should route to users registration' do
    expect(post('/login')).to route_to('users#login')
  end

  it 'should route to users session' do
    expect(post('users')).to route_to('users#create')
  end
end