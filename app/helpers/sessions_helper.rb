module SessionsHelper
  def list_inputs_sessions
    [{ value: "email",type: InputsHelper::INPUT_TEXT},{ value: "password",type: InputsHelper::INPUT_PASSWORD}]
  end
end
