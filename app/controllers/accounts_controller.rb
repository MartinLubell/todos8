class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
      respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :update, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_account
      @account = current_user.account
    end

    def account_params
      params.require(:account).permit(:first_name, :last_name, :age, :gender)
    end

end
