module ArticlesHelper
  def list_inputs_articles
    [{ value: "title",type: InputsHelper::INPUT_TEXT},{ value: "body",type: InputsHelper::INPUT_TEXT},
      { value: "status",type: InputsHelper::INPUT_SELECT, select_list: ['public','private','archived']}]
  end
end
