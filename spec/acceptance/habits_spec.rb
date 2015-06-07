require 'rails_helper'

resource 'Habits' do
  let!(:habit1) { Fabricate(:habit) }
  let!(:habit2) { Fabricate(:habit) }
  get '/habits' do
    example 'Listing habits' do
      do_request
      expect(status).to be 200
    end
  end

  get '/habits/1' do
    example 'Get one habit' do
      do_request
      expect(status).to be 200
    end
  end

  post "/habits" do
    parameter :name, "Name of habit", required: true, scope: :habit
    parameter :streak, "Existing streak", required: false, scope: :habit

    response_field :id, 'ID', scope: :habit, 'Type' => 'Integer'
    response_field :name, "Name of habit", scope: :habit, "Type" => "String"
    response_field :streak, "Existing streak", scope: :habit, "Type" => "Integer"

    let(:name) { 'Swim 750m' }
    let(:streak) { 0 }

    let(:raw_post) { params }

    example_request "Creating a habit" do
      json_resp = JSON.parse(response_body)
      ap json_resp
      habit = json_resp['habit']
      expect(habit.except("id", "created_at", "updated_at")).to eq({
        'name' => name,
        'streak' => streak
      })
      expect(status).to eq(201)

      client.get(URI.parse(response_headers["location"]).path, {}, headers)
      expect(status).to eq(200)
    end
  end


end