class SessionsController < ApplicationController
  def new
  end


  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      #if params[:session][:remember_me] == '1'
        #remember(user)
      #else
        #forget(user)
      #end
      #remember user

      #params[:session][:remember_me] ? remember(user) : forget(user)  0,1がtrueで常にチェックがON
      
      # エラーメッセージを作成する
      #flash[:danger] = 'Invalid email/password combination'  本当は正しくない flashnowはその後のリクエストで消える
      


  #&& (論理積 (and)) は、取得したユーザーが有効かどうかを決定するために使います。
  #Rubyではnilとfalse以外のすべてのオブジェクトは、真偽値ではtrueになる (4.2.3) という性質を考慮すると、
  #&&の前後の値の組み合わせは表 8.2のようになります。表 8.2を見ると、入力されたメールアドレスを持つユーザーがデータベースに存在し、
  #かつ入力されたパスワードがそのユーザーのパスワードである場合のみ、if文がtrueになることがわかります。言葉でまとめると「ユーザーがデータベースにあり、かつ、認証に成功した場合にのみ」となります

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
