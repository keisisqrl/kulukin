alias Kulukin.User

defimpl Canada.Can, for: User do
  # User abilities for User
  def can?(%User{admin: true},_,_), do: true
  def can?(%User{id: user_id}, action, %User{id: user_id}) when action in
    [:show, :edit, :update], do: true

  def can?(_,_,_), do: false
end
