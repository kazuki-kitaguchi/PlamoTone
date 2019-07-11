require 'rails_helper'

describe ColorsController do
	# GETメソッドのindexアクションについて
	describe 'GET #index' do
		context "adminユーザーでログインしている場合" do
			it "リクエストがOKであること" do
				expect(response).to be_success
				expect(response.status).to eq(200)
			end

			it "@colorsが正しく定義されているか" do
			end

			it "@makersが正しく定義されているか" do
			end

			it "正しくビューが描画されているかどうか" do
			end

		end

		context "adminでないユーザーがログインしている場合" do
			it "リクエストがOKであること" do
				expect(response).to be_success
				expect(response.status).to eq(200)
			end

			it "@colorsが正しく定義されているか" do
			end

			it "@makersが正しく定義されているか" do
			end

			it "home/indexにリダイレクトされているか" do
			end
		end

		context "ユーザーがログインしていない場合" do
			it "users/sign_inにリダイレクトされているか" do
			end
		end
	end
end