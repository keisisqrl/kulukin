alias Kulukin.{User, Container}

defimpl Canada.Can, for: User do
  # Superuser
  def can?(%User{admin: true},_,_), do: true

  # User abilities for User
  def can?(_, :index, %User{}), do: true
  def can?(%User{id: user_id}, action, %User{id: user_id}) when action in
    [:show, :edit, :update], do: true

  def can?(%User{id: user_id}, _, %Container{user_id: user_id}), do: true

  def can?(_,_,_), do: false
end
