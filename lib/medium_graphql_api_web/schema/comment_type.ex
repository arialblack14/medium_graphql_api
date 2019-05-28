defmodule MediumGraphqlApiWeb.Schema.Types.CommentType do
  use Absinthe.Schema.Notation

  alias MediumGraphqlApi.Loaders.Content

  import Absinthe.Resolution.Helpers

  object :comment_type do
    field(:id, :id)
    field(:content, :string)
    field(:user, :user_type, resolve: dataloader(Content))
    field(:post, :post_type, resolve: dataloader(Content))
  end

  input_object :comment_input_type do
    field :content, non_null(:string)
    field :post_id, non_null(:id)
  end
end
