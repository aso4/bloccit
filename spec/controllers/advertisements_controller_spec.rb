require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
    let(:my_ad) do
        Advertisement.create!(
            id: 1,
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph,
            price: 99
        )
    end

    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    # describe "attributes" do
    #   it "should respond to title" do
    #     expect(my_ad).to respond_to(:title)
    #   end
    #
    #   it "should respond to body" do
    #     expect(my_ad).to respond_to(:body)
    #   end
    #
    #   it "should respond to price" do
    #     expect(my_ad).to respond_to(:price)
    #   end
    # end

    it 'assigns [my_ad] to @ads' do
        get :index
        expect(assigns(:ads)).to eq([my_ad])
    end

    describe 'GET #show' do
        it 'returns http success' do
            get :show, id: my_ad.id
            expect(response).to have_http_status(:success)
        end

        it 'renders the #show view' do
            get :show, id: my_ad.id
            expect(response).to render_template :show
        end

        it 'assigns my_ad to @ad' do
            get :show, id: my_ad.id
            expect(assigns(:ad)).to eq(my_ad)
        end
    end
    # it 'renders the #show view' do
    #     # #17
    #     get :show, id: my_ad.id
    #     expect(response).to render_template :show
    # end
    #
    # it 'assigns my_ad to @ad' do
    #     get :show, id: my_ad.id
    #     # #18
    #     expect(assigns(:ad)).to eq(my_ad)
    # end
    # end

    # describe "GET #new" do
    #   it "returns http success" do
    #     get :new
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    #
    # describe "GET #create" do
    #   it "returns http success" do
    #     get :create
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    #
    describe 'POST create' do
        # #4
        it 'increases the number of ads by 1' do
            expect { post :create, ad: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10 } }.to change(Advertisement, :count).by(1)
        end



        # #5
        it 'assigns the new ad to @ad' do
            post :create, ad: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10 }
            expect(assigns(:ad)).to eq Advertisement.last
        end

        # #6
        it 'redirects to the new ad' do
            post :create, ad: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10 }
            expect(response).to redirect_to Advertisement.last
        end
    end
end
