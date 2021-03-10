module UsersHelper
  def list_inputs_users
    [{ value: "username",type: InputsHelper::INPUT_TEXT},{ value: "email",type: InputsHelper::INPUT_TEXT},
      { value: "password",type: InputsHelper::INPUT_PASSWORD},{ value: "password_confirmation",type: InputsHelper::INPUT_PASSWORD}]
  end
end
