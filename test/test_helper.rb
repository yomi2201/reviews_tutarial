ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

    # テストユーザーとしてログインする
    def log_in_as(user)
      session[:user_id] = user.id
    end

  #ログイン済みのユーザーをテストする方法はいくつかありますが、今回はコントローラの単体テストを
  #使っていきましょう。具体的には、sessionメソッドを直接操作して、:user_idキーにuser.idの値を代入してみます
  #log_inメソッド (リスト 8.14) との混乱を防ぐため、あえてメソッド名をlog_in_asとしました。
  #このテスト用のメソッドを、test_helperファイルのActiveSupport::TestCaseクラス内で定義してみます


    # テストユーザーとしてログインする
    #def log_in_as(user, password: 'password', remember_me: '1')
    #  post login_path, params: { session: { email: user.email,
    #                                        password: password,
    #                                        remember_me: remember_me } }
    #end


    class ActionDispatch::IntegrationTest

      # テストユーザーとしてログインする
      def log_in_as(user, password: 'password', remember_me: '1')
        post login_path, params: { session: { email: user.email,
                                              password: password,
                                              remember_me: remember_me } }
      end
    end
 #例えばオンに対するテストは次のようになり
  #log_in_as(@user, remember_me: '1') 
 #オフの場合はこのようになります。
  #log_in_as(@user, remember_me: '0')

  # Add more helper methods to be used by all tests here...
end
