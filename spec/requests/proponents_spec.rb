require 'rails_helper'

RSpec.describe '/proponents', type: :request do
  
  describe 'GET /index' do
    let(:proponents) { create_list(:proponent, 10)}

    it 'renders a all proponents response' do
      get proponents_url
      expect(response).to be_successful
    end

    it 'be return all owners with paginate' do
      get proponents_url,
        params: { page: 2, per_page: 5 }

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:proponent) { create(:proponent)}

    it 'renders a successful response' do
      get proponent_url(proponent)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_proponent_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:proponent) { create(:proponent)}

    it 'renders a successful response' do
      get edit_proponent_url(proponent)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:address_attr) { attributes_for(:address)}
      let!(:phones_attr) { attributes_for(:phone, proponent: nil) }

      let!(:proponent_attr) { attributes_for(:proponent) }
      
      before do
        proponent_attr[:address_attributes] = address_attr 
        proponent_attr[:phones_attributes] = phones_attr 
      end

      it 'creates a new Proponent' do
        expect {
          post proponents_url, params: { proponent: proponent_attr }
        }.to change(Proponent, :count).by(1)
      end

      it 'redirects to the created proponent' do
        post proponents_url, params: { proponent: proponent_attr }
        expect(response).to redirect_to(proponent_url(Proponent.last))
      end
    end

    context 'with invalid parameters' do
      let!(:proponent_invalid_attr) { attributes_for(:proponent, name: 0)}

      it 'does not create a new Proponent' do
        expect {
          post proponents_url, params: { proponent: proponent_invalid_attr }
        }.not_to change(Proponent, :count)
      end

    
      it 'renders a response with 422 status' do
        post proponents_url, params: { proponent: proponent_invalid_attr }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:proponent) { create(:proponent)}
      let!(:proponent_attr) { attributes_for(:proponent)}

      it 'updates the requested proponent' do
        patch proponent_url(proponent), params: { proponent: proponent_attr }
        proponent.reload

        expect(proponent.birth_date).to eq(proponent_attr[:birth_date])
        expect(proponent.cpf).to eq(proponent_attr[:cpf])
        expect(proponent.name).to eq(proponent_attr[:name])
        expect(proponent.salary).to eq(proponent_attr[:salary])
      end

      it 'redirects to the proponent' do
        patch proponent_url(proponent), params: { proponent: proponent_attr }
        proponent.reload
        expect(response).to redirect_to(proponent_url(proponent))


      end
    end

    context 'with invalid parameters' do
      let!(:proponent) { create(:proponent)}
      let!(:proponent_invalid_attr) { attributes_for(:proponent, name: 0)}
      
      it 'renders a response and redirect' do
        patch proponent_url(proponent), params: { proponent: proponent_invalid_attr }
        expect(response).to redirect_to(proponent_url(proponent))
      end
    
    end
  end

  describe 'DELETE /destroy' do

    let!(:proponent) { create(:proponent)}

    it 'destroys the requested proponent' do
      expect {
        delete proponent_url(proponent)
      }.to change(Proponent, :count).by(-1)
    end

    it 'redirects to the proponents list' do
      delete proponent_url(proponent)
      expect(response).to redirect_to(proponents_url)
    end
  end
end
